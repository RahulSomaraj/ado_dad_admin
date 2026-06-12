import 'dart:typed_data';

import 'package:ado_dad_admin/models/vehicle_model/fuel_transmission_models.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';

class VehicleModelRepository {
  final Dio _dio;

  VehicleModelRepository() : _dio = ApiService().dio;

  Future<VehicleModelResponse> fetchAllModels({
    int page = 1,
    int limit = 10,
    String? searchQuery,
  }) async {
    try {
      final response = await _dio.get(
        '/vehicle-inventory/models',
        queryParameters: {
          'page': page,
          'limit': limit,
          'search': searchQuery,
        },
      );

      if (response.statusCode == 200) {
        if (response.data == null) {
          throw Exception("API returned null response");
        }

        if (response.data is! Map<String, dynamic>) {
          throw Exception("API returned invalid response format");
        }

        return VehicleModelResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load vehicle models");
      }
    } on DioException catch (e) {
      throw Exception(
          'Failed to load vehicle models: ${e.response?.data ?? e.message}');
    } catch (e) {
      throw Exception("Unexpected error while loading vehicle models: $e");
    }
  }

  Future<String?> uploadImageToS3(Uint8List fileBytes, String label) async {
    try {
      final mimeType = lookupMimeType('image.jpg', headerBytes: fileBytes);
      final fileExtension = mimeType?.split('/').last ?? 'jpg';
      final fileName = '$label.$fileExtension';

      final signedUrlResponse = await _dio.get(
        '/upload/presigned-url',
        queryParameters: {
          'fileName': fileName,
          'fileType': mimeType,
        },
      );
      final signedUrl = signedUrlResponse.data['url'];
      if (signedUrl == null) throw Exception('No signed URL received');

      final uploadResponse = await Dio().put(
        signedUrl,
        data: fileBytes,
        options: Options(headers: {
          'Content-Type': mimeType,
          'Content-Length': fileBytes.length.toString(),
        }),
      );
      if (uploadResponse.statusCode == 200 ||
          uploadResponse.statusCode == 204) {
        return signedUrl.split('?').first;
      } else {
        throw Exception('Upload failed: ${uploadResponse.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<List<String>> uploadImagesToS3(List<PlatformFile> files) async {
    List<String> uploadedUrls = [];

    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      final fileBytes = file.bytes;
      if (fileBytes == null) continue;

      final label = 'vehicle_model_${DateTime.now().millisecondsSinceEpoch}_$i';

      final url = await uploadImageToS3(fileBytes, label);
      if (url != null) {
        uploadedUrls.add(url);
      }
    }
    return uploadedUrls;
  }

  Future<List<FuelType>> fetchFuelTypes() async {
    try {
      final res = await _dio.get('/vehicle-inventory/fuel-types');
      final list = (res.data is Map && res.data['data'] is List)
          ? (res.data['data'] as List)
          : (res.data as List);
      return list
          .map((e) => FuelType.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception(
          'Failed to load fuel types: ${e.response?.data ?? e.message}');
    }
  }

  Future<List<TransmissionType>> fetchTransmissionTypes() async {
    try {
      final res = await _dio.get('/vehicle-inventory/transmission-types');
      final list = (res.data is Map && res.data['data'] is List)
          ? (res.data['data'] as List)
          : (res.data as List);
      return list
          .map((e) => TransmissionType.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception(
          'Failed to load transmission types: ${e.response?.data ?? e.message}');
    }
  }

  Future<void> createVehicleModel(VehicleModel model) async {
    try {
      final payload = model.toJson();

      if (model.manufacturer != null) {
        payload['manufacturer'] = model.manufacturer!.id;
      } else {
        payload.remove('manufacturer');
      }

      payload.removeWhere((key, value) =>
          value == null ||
          value == '' ||
          key == '_id' ||
          key == 'variantCount' ||
          key == 'priceRange' ||
          key == 'isCommercialVehicle' ||
          key == 'commercialVehicleType' ||
          key == 'commercialBodyType' ||
          key == 'defaultPayloadCapacity' ||
          key == 'defaultPayloadUnit' ||
          key == 'defaultAxleCount' ||
          key == 'defaultSeatingCapacity');

      if ((payload['fuelTypes'] as List?)?.isEmpty ?? true) {
        payload.remove('fuelTypes');
      }

      if ((payload['transmissionTypes'] as List?)?.isEmpty ?? true) {
        payload.remove('transmissionTypes');
      }

      final response =
          await _dio.post('/vehicle-inventory/models', data: payload);

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("Failed to post vehicle: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }

  Future<VehicleModelResponse> fetchModelsByManufacturer(
    String manufacturerId, {
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _dio.get(
        '/vehicle-inventory/models',
        queryParameters: {
          'manufacturerId': manufacturerId,
          'page': page,
          'limit': limit,
        },
      );

      if (response.statusCode == 200) {
        return VehicleModelResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to fetch models for manufacturer");
      }
    } on DioException catch (e) {
      throw Exception(
          'Failed to load vehicle models: ${e.response?.data ?? e.message}');
    }
  }

  Future<VehicleModel> fetchModelById(String id) async {
    try {
      final res = await _dio.get('/vehicle-inventory/models/$id');
      if (res.statusCode == 200) {
        final data = (res.data is Map && res.data['data'] != null)
            ? res.data['data'] as Map<String, dynamic>
            : res.data as Map<String, dynamic>;
        return VehicleModel.fromJson(data);
      }
      throw Exception('Failed to fetch model');
    } on DioException catch (e) {
      throw Exception(
          'Failed to fetch model: ${e.response?.data ?? e.message}');
    }
  }

  Future<void> updateVehicleModel(VehicleModel model) async {
    if (model.id == null || model.id!.isEmpty) {
      throw Exception('Cannot update: model id is missing');
    }
    try {
      final payload = model.toJson();

      if (model.manufacturer != null) {
        payload['manufacturer'] = model.manufacturer!.id;
      } else {
        payload.remove('manufacturer');
      }

      payload.removeWhere((key, value) =>
          value == null ||
          value == '' ||
          key == '_id' ||
          key == 'variantCount' ||
          key == 'priceRange' ||
          key == 'isCommercialVehicle' ||
          key == 'commercialVehicleType' ||
          key == 'commercialBodyType' ||
          key == 'defaultPayloadCapacity' ||
          key == 'defaultPayloadUnit' ||
          key == 'defaultAxleCount' ||
          key == 'defaultSeatingCapacity');

      if ((payload['images'] as List?)?.isEmpty ?? true) {
        payload.remove('images');
      }

      if ((payload['fuelTypes'] as List?)?.isEmpty ?? true) {
        payload.remove('fuelTypes');
      }

      if ((payload['transmissionTypes'] as List?)?.isEmpty ?? true) {
        payload.remove('transmissionTypes');
      }

      final res = await _dio.put(
        '/vehicle-inventory/models/${model.id}',
        data: payload,
      );

      if (res.statusCode != 200) {
        throw Exception('Update failed: ${res.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }

  Future<String> uploadCsv(
      String manufacturerId, List<int> fileBytes, String fileName) async {
    try {
      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: fileName,
        ),
      });

      final response = await _dio.post(
        '/vehicle-inventory/$manufacturerId/upload-csv',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'] ?? "CSV file uploaded successfully";
      } else {
        throw Exception("Failed to upload CSV file: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
