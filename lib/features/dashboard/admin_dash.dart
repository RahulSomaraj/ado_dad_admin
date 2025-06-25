import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        _buildHeaderSection(),
        const SizedBox(height: 20),
        _buildStatCards(),
        const SizedBox(height: 20),
        _buildAnalyticsSection()
      ],
    );
  }

  Widget _buildHeaderSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: isTablet
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 150, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Dashboard",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildNewAddButton(),
                  const SizedBox(height: 12),
                  _buildNewShowroomAddButton(),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Dashboard",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  _buildNewAddButton(),
                  const SizedBox(width: 15),
                  _buildNewShowroomAddButton(),
                ],
              ),
            ),
    );
  }

  Widget _buildNewAddButton() {
    final isTablet = MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width >= 550;
    return SizedBox(
      width: isTablet ? double.infinity : 150,
      height: 50,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final buttonWidth = constraints.maxWidth;

          // Dynamically adjust content based on width
          double iconSize = buttonWidth < 180 ? 18 : 20;
          double fontSize = buttonWidth < 180 ? 14 : 16;
          double spacing = buttonWidth < 180 ? 6 : 8;

          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blackColor,
              foregroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              textStyle:
                  TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment:
                  isTablet ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Icon(Icons.add, color: Colors.white, size: iconSize),
                SizedBox(width: spacing),
                Text('Add New Ads', style: TextStyle(fontSize: fontSize)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewShowroomAddButton() {
    final isTablet = MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width >= 550;
    return SizedBox(
      width: isTablet ? double.infinity : 200,
      height: 50,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final buttonWidth = constraints.maxWidth;

          // Dynamically adjust content based on width
          double iconSize = buttonWidth < 180 ? 18 : 20;
          double fontSize = buttonWidth < 180 ? 14 : 16;
          double spacing = buttonWidth < 180 ? 6 : 8;

          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blackColor,
              foregroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              textStyle:
                  TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment:
                  isTablet ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Icon(Icons.add, color: Colors.white, size: iconSize),
                SizedBox(width: spacing),
                Text('Add New Showroom', style: TextStyle(fontSize: fontSize)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet =
              constraints.maxWidth <= 900 && constraints.maxWidth >= 550;

          return Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildStatCard(
                icon: Icons.person_outline,
                label: "Active Users",
                value: "1627",
                color: Colors.greenAccent,
              ),
              _buildStatCard(
                icon: Icons.insert_drive_file_outlined,
                label: "Total Listings",
                value: "1820",
                color: Colors.pinkAccent.shade100,
              ),
              _buildStatCard(
                icon: Icons.business,
                label: "Total Showrooms",
                value: "35",
                color: Colors.indigo.shade100,
              ),
              _buildStatCard(
                icon: Icons.currency_rupee,
                label: "Total Value",
                value: "₹ 27,45,280.20",
                color: Colors.purpleAccent.shade100,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Analytics",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _AnalyticsItem(
                        label: 'Total Listings', value: '1820', trend: '+49%'),
                    _AnalyticsItem(
                        label: 'Total Users', value: '1627', trend: '+7%'),
                    _AnalyticsItem(
                        label: 'Sold Listings', value: '1571', trend: '-7%'),
                  ],
                ),
                const SizedBox(height: 20),
                // Placeholder for chart
                SizedBox(
                  height: 200,
                  child: Center(child: _buildLineChart()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.orange,
            dotData: FlDotData(show: false),
            belowBarData:
                BarAreaData(show: true, color: Colors.orange.withOpacity(0.3)),
            spots: const [
              FlSpot(0, 5),
              FlSpot(1, 9),
              FlSpot(2, 12),
              FlSpot(3, 7),
              FlSpot(4, 10),
              FlSpot(5, 18),
              FlSpot(6, 14),
            ],
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final labels = ['Wed 20', '', '', '', '', '', 'Today'];
                return Text(labels[value.toInt()],
                    style: const TextStyle(fontSize: 10));
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, interval: 5),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(color: Colors.black12),
            left: BorderSide(color: Colors.black12),
          ),
        ),
        gridData: FlGridData(show: true, horizontalInterval: 5),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 25,
      ),
    );
  }
}

class _AnalyticsItem extends StatelessWidget {
  final String label;
  final String value;
  final String trend;

  const _AnalyticsItem({
    required this.label,
    required this.value,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    Color trendColor = trend.contains('+') ? Colors.green : Colors.red;

    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          trend,
          style: TextStyle(fontSize: 14, color: trendColor),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
