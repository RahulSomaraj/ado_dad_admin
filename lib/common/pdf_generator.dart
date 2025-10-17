import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:ado_dad_admin/models/ad_model.dart';

class PdfGenerator {
  static Future<Uint8List> generateAdsReport(List<AdModel> ads) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            // Header
            pw.Header(
              level: 0,
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Ads Report',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    'Generated on: ${_formatDate(DateTime.now())}',
                    style: pw.TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 20),

            // Summary
            pw.Container(
              padding: const pw.EdgeInsets.all(16),
              decoration: pw.BoxDecoration(
                color: PdfColors.grey100,
                borderRadius: pw.BorderRadius.circular(8),
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                children: [
                  _buildSummaryItem('Total Ads', ads.length.toString()),
                  _buildSummaryItem('Approved',
                      ads.where((ad) => ad.isApproved).length.toString()),
                  _buildSummaryItem('Pending',
                      ads.where((ad) => !ad.isApproved).length.toString()),
                  _buildSummaryItem('Sold Out',
                      ads.where((ad) => ad.soldOut).length.toString()),
                ],
              ),
            ),
            pw.SizedBox(height: 20),

            // Table
            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.grey300),
              columnWidths: {
                0: const pw.FlexColumnWidth(1.2), // Ad ID
                1: const pw.FlexColumnWidth(2.0), // Ad Name
                2: const pw.FlexColumnWidth(1.2), // Category
                3: const pw.FlexColumnWidth(1.0), // Posted On
                4: const pw.FlexColumnWidth(1.5), // Location
                5: const pw.FlexColumnWidth(1.0), // Price
                6: const pw.FlexColumnWidth(0.8), // Status
                7: const pw.FlexColumnWidth(0.8), // Approval
                8: const pw.FlexColumnWidth(1.0), // User ID
                9: const pw.FlexColumnWidth(1.5), // User Name
                10: const pw.FlexColumnWidth(2.0), // User Email
              },
              children: [
                // Header row
                pw.TableRow(
                  decoration: const pw.BoxDecoration(color: PdfColors.grey200),
                  children: [
                    _buildTableCell('Ad ID', isHeader: true),
                    _buildTableCell('Ad Name', isHeader: true),
                    _buildTableCell('Category', isHeader: true),
                    _buildTableCell('Posted On', isHeader: true),
                    _buildTableCell('Location', isHeader: true),
                    _buildTableCell('Price', isHeader: true),
                    _buildTableCell('Status', isHeader: true),
                    _buildTableCell('Approval', isHeader: true),
                    _buildTableCell('User ID', isHeader: true),
                    _buildTableCell('User Name', isHeader: true),
                    _buildTableCell('User Email', isHeader: true),
                  ],
                ),

                // Data rows
                ...ads.map((ad) => pw.TableRow(
                      children: [
                        _buildTableCell(ad.id),
                        _buildTableCell(_buildVehicleTitle(ad)),
                        _buildTableCell(_formatCategory(ad.category)),
                        _buildTableCell(_formatDate(ad.postedAt)),
                        _buildTableCell(ad.location),
                        _buildTableCell('Rs.${ad.price.toString()}'),
                        _buildTableCell(ad.soldOut ? 'SoldOut' : 'Active'),
                        _buildTableCell(ad.isApproved ? 'Approved' : 'Pending'),
                        _buildTableCell(ad.user.id),
                        _buildTableCell(ad.user.name),
                        _buildTableCell(ad.user.email),
                      ],
                    )),
              ],
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _buildSummaryItem(String label, String value) {
    return pw.Column(
      children: [
        pw.Text(
          value,
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue800,
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          label,
          style: pw.TextStyle(
            fontSize: 12,
            color: PdfColors.grey600,
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildTableCell(String text, {bool isHeader = false}) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(6),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: isHeader ? 9 : 8,
          fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
        maxLines: 2,
        overflow: pw.TextOverflow.clip,
      ),
    );
  }

  static String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  static String _formatCategory(String category) {
    switch (category) {
      case 'two_wheeler':
        return 'Two Wheeler';
      case 'four_wheeler':
        return 'Four Wheeler';
      case 'commercial_vehicle':
        return 'Commercial Vehicle';
      case 'property':
        return 'Property';
      default:
        return category
            .replaceAll('_', ' ')
            .split(' ')
            .map((word) => word.isNotEmpty
                ? word[0].toUpperCase() + word.substring(1).toLowerCase()
                : '')
            .join(' ');
    }
  }

  static String _buildVehicleTitle(AdModel ad) {
    // For property category, show description
    if (ad.category == 'property') {
      return ad.description.isNotEmpty
          ? ad.description
          : 'Property Description Not Available';
    }

    // For vehicle categories, show vehicle details
    if (ad.category == 'two_wheeler' ||
        ad.category == 'four_wheeler' ||
        ad.category == 'commercial_vehicle' ||
        ad.category == 'private_vehicle') {
      if (ad.vehicleDetails == null) {
        return 'Vehicle Details Not Available';
      }

      final manufacturer =
          ad.vehicleDetails?.manufacturer.displayName ?? 'Unknown';
      final model = ad.vehicleDetails?.model.displayName ?? 'Unknown';
      final year = ad.vehicleDetails?.year.toString() ?? 'Unknown';

      return '$manufacturer $model($year)';
    }

    // For other categories, show title or description
    return ad.title.isNotEmpty
        ? ad.title
        : (ad.description.isNotEmpty ? ad.description : 'No Title Available');
  }
}
