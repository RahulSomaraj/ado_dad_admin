import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/repositories/ads_rep.dart';
import 'package:flutter/material.dart';

class AdminAdsDashboard extends StatefulWidget {
  const AdminAdsDashboard({super.key});

  @override
  State<AdminAdsDashboard> createState() => _AdminAdsDashboardState();
}

class _AdminAdsDashboardState extends State<AdminAdsDashboard> {
  final AdsRepository _adsRepository = AdsRepository();
  List<AdModel> _ads = [];
  bool _isLoading = true;
  String? _error;
  int _currentPage = 1;
  int _itemsPerPage = 10;
  int _totalAds = 0;
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchAds();
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchAds() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await _adsRepository.fetchAllAds(
        page: _currentPage,
        limit: _itemsPerPage,
      );

      setState(() {
        _ads = response.data;
        _totalAds = response.total;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(),
          const SizedBox(height: 20),
          _buildAdsTable(),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon(
          //   Icons.dashboard,
          //   size: 32,
          //   color: Colors.black87,
          // ),
          const SizedBox(width: 16),
          Text(
            "Admin Dashboard",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          if (_totalAds > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Total Ads: $_totalAds",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAdsTable() {
    if (_isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const Icon(
                Icons.error_outline,
                size: 48,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading ads: $_error',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _fetchAds,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_ads.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const Icon(
                Icons.inbox_outlined,
                size: 48,
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              const Text(
                'No ads found',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        _buildAdsDataTable(),
        const SizedBox(height: 20),
        _buildPagination(),
      ],
    );
  }

  Widget _buildAdsDataTable() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Scrollbar(
          controller: _horizontalScrollController,
          thumbVisibility: true,
          trackVisibility: true,
          child: SingleChildScrollView(
            controller: _horizontalScrollController,
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 1000),
              child: DataTable(
                columnSpacing: 90,
                headingRowColor: WidgetStateColor.resolveWith(
                  (states) => const Color.fromARGB(66, 144, 140, 140),
                ),
                dataRowColor: WidgetStatePropertyAll(AppColors.primaryColor),
                dataRowMinHeight: 60,
                dataRowMaxHeight: 80,
                columns: const [
                  DataColumn(
                    label: Text(
                      'Image',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Description',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Category',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Posted On',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Location',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Price',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: _ads.map((ad) => _buildAdRow(ad)).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  DataRow _buildAdRow(AdModel ad) {
    return DataRow(
      cells: [
        DataCell(
          SizedBox(
            width: 80,
            height: 50,
            child: _buildAdImage(ad),
          ),
        ),
        DataCell(
          SizedBox(
            width: 100,
            child: Text(
              ad.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
        DataCell(
          Text(
            _formatCategory(ad.category),
            style: const TextStyle(fontSize: 14),
          ),
        ),
        DataCell(
          Text(
            _formatDate(ad.postedAt),
            style: const TextStyle(fontSize: 12),
          ),
        ),
        DataCell(
          Text(
            ad.location,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        DataCell(
          Text(
            '₹${ad.price.toString()}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: 60,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: ad.soldOut ? Colors.black : Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                ad.soldOut ? 'SoldOut' : 'Active',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdImage(AdModel ad) {
    if (ad.images.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          ad.images.first,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              _buildImagePlaceholder(),
        ),
      );
    }
    return _buildImagePlaceholder();
  }

  Widget _buildImagePlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.image_not_supported,
        color: Colors.grey,
        size: 24,
      ),
    );
  }

  String _formatCategory(String category) {
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

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Widget _buildPagination() {
    final totalPages = (_totalAds / _itemsPerPage).ceil();

    if (totalPages <= 1) return const SizedBox.shrink();

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Rows per page: "),
            const SizedBox(width: 8),
            DropdownButton<int>(
              value: _itemsPerPage,
              dropdownColor: Colors.white,
              items: [10, 20].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _itemsPerPage = value;
                    _currentPage =
                        1; // Reset to first page when changing items per page
                  });
                  _fetchAds();
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: _currentPage > 1
                  ? () {
                      setState(() {
                        _currentPage--;
                      });
                      _fetchAds();
                    }
                  : null,
              child: Icon(
                Icons.chevron_left,
                size: 28,
                color: _currentPage > 1 ? Colors.black : Colors.grey[400],
              ),
            ),
            const SizedBox(width: 15),
            Text(
              "Page $_currentPage of $totalPages",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: _currentPage < totalPages
                  ? () {
                      setState(() {
                        _currentPage++;
                      });
                      _fetchAds();
                    }
                  : null,
              child: Icon(
                Icons.chevron_right,
                size: 28,
                color:
                    _currentPage < totalPages ? Colors.black : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
