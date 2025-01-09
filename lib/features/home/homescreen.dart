import 'package:flutter/material.dart';
import 'package:ado_dad_admin/features/home/custom_chart.dart';
import 'package:ado_dad_admin/features/home/stat_cards.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Take full width
        height: double.infinity, // Take full height
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0), // Add outer padding
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 600, maxWidth: 1200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildStatsRow(),
                const SizedBox(height: 30),
                _buildChartsRow(),
                const SizedBox(height: 30),
                _buildChartsRow2(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 40.0, bottom: 20.0), // Increased top padding
      child: Text(
        'ADO_DAD DASHBOARD',
        style: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child:
                StatCard(title: 'Total Sales', value: '434', growth: '588.9%'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: StatCard(
                title: 'Total Value', value: '\$25,736.21', growth: '491.6%'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: StatCard(
                title: 'Conversion Rate', value: '0.61%', growth: '455.7%'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: StatCard(
                title: 'Avg. Order Value', value: '\$59.30', growth: '-14.1%'),
          ),
        ),
      ],
    );
  }

  Widget _buildChartsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        CustomChart(title: 'Transactions per Source'),
      ],
    );
  }

  Widget _buildChartsRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        CustomChart(title: 'Transactions per User Type'),
        CustomChart(title: 'Transactions per Device Type'),
      ],
    );
  }
}
