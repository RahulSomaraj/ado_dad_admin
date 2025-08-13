import 'dart:typed_data';

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
      // print('Model Datas: ${response.data}');

      if (response.statusCode == 200) {
        return VehicleModelResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load vehicle models");
      }
    } on DioException catch (e) {
      throw Exception(
          'Failed to load vehicle models: ${e.response?.data ?? e.message}');
    }
  }

  Future<String?> uploadImageToS3(Uint8List fileBytes, String label) async {
    try {
      final mimeType = lookupMimeType('image.jpg', headerBytes: fileBytes);
      final fileExtension = mimeType?.split('/').last ?? 'jpg';
      // final fileName =
      //     'image_${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
      final fileName = '$label.$fileExtension';

      // Step 1: Get presigned URL
      final signedUrlResponse = await _dio.get(
        '/upload/presigned-url',
        queryParameters: {
          'fileName': fileName,
          'fileType': mimeType,
        },
      );
      // print('??????????????$signedUrlResponse?????????????????');
      final signedUrl = signedUrlResponse.data['url'];
      // print('??????????????$signedUrl?????????????????');
      if (signedUrl == null) throw Exception('No signed URL received');

      // Step 2: Upload to S3
      final uploadResponse = await Dio().put(
        signedUrl,
        data: fileBytes,
        options: Options(headers: {
          'Content-Type': mimeType,
          'Content-Length': fileBytes.length.toString(),
        }),
      );
      // print('##############${uploadResponse.statusCode}##############');
      if (uploadResponse.statusCode == 200 ||
          uploadResponse.statusCode == 204) {
        return signedUrl
            .split('?')
            .first; // ✅ Public URL (without query params)
      } else {
        throw Exception('Upload failed: ${uploadResponse.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      print('❌ Unexpected error in uploadImageToS3: $e');
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
    print('uploadedUrls: $uploadedUrls');
    return uploadedUrls;
  }

  // Future<void> createVehicleModel(VehicleModel model) async {
  //   try {
  //     final payload = model.toJson()
  //       ..['manufacturer'] = model.manufacturer.id; // 👈 override manufacturer

  //     // 🚫 Remove optional empty lists if they are not required by backend
  //     if ((payload['availableFuelTypes'] as List?)?.isEmpty ?? true) {
  //       payload.remove('availableFuelTypes');
  //     }
  //     if ((payload['availableTransmissionTypes'] as List?)?.isEmpty ?? true) {
  //       payload.remove('availableTransmissionTypes');
  //     }

  //     print("🚀 Final payload to send: $payload");

  //     // Override manufacturer with only ID
  //     // payload['manufacturer'] = model.manufacturer.id;

  //     final response =
  //         await _dio.post('/vehicle-inventory/models', data: payload);
  //     print('create vehicle status code: ${response.statusCode}');

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final newId = response.data['_id'] ?? response.data['id'];

  //       print("✅ Vehicle Model created with ID: $newId");
  //       print("Vehicle posted successfully");
  //     } else {
  //       throw Exception("Failed to post vehicle: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     print("Error posting vehicle: $e");
  //     rethrow;
  //   }
  // }

  Future<void> createVehicleModel(VehicleModel model) async {
    try {
      final payload = model.toJson()..['manufacturer'] = model.manufacturer.id;

      // Remove all null, empty string, or disallowed fields
      payload.removeWhere((key, value) =>
          value == null ||
          value == '' ||
          key == '_id' ||
          key == 'variantCount' ||
          key == 'priceRange' ||
          key == 'availableFuelTypes' ||
          key == 'availableTransmissionTypes' ||
          key == 'isCommercialVehicle' ||
          key == 'commercialVehicleType' ||
          key == 'commercialBodyType' ||
          key == 'defaultPayloadCapacity' ||
          key == 'defaultPayloadUnit' ||
          key == 'defaultAxleCount' ||
          key == 'defaultSeatingCapacity');

      print("🚀 Final payload to send: $payload");

      final response =
          await _dio.post('/vehicle-inventory/models', data: payload);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final newId = response.data['_id'] ?? response.data['id'];
        print("✅ Vehicle Model created with ID: $newId");
      } else {
        throw Exception("Failed to post vehicle: ${response.statusCode}");
      }
    }
    // catch (e) {
    //   print("❌ Error posting vehicle: $e");
    //   rethrow;
    // }
    on DioException catch (e) {
      print("❌ DioException Response: ${e.response?.data}");
      throw Exception(DioErrorHandler.handleError(e));
    }
  }

  Future<VehicleModelResponse> fetchModelsByManufacturer(
      String manufacturerId) async {
    try {
      final response = await _dio.get(
        '/vehicle-inventory/models',
        queryParameters: {
          'manufacturerId': manufacturerId,
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
}
