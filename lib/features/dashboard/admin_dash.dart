import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_bloc.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_event.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_state.dart';
import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/repositories/dashboard_rep.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final DashboardRepository _dashboardRepository = DashboardRepository();
  DashboardStats? _stats;
  List<DailyCount> _daily = [];
  bool _statsLoading = true;

  @override
  void initState() {
    super.initState();
    // Ensure ads data is available for the recent-listings table.
    context.read<AdsBloc>().add(const AdsEvent.fetchAllAds());
    _loadStats();
  }

  Future<void> _loadStats() async {
    try {
      final results = await Future.wait([
        _dashboardRepository.fetchStats(),
        _dashboardRepository.fetchDailyAddedListings(days: 7),
      ]);
      if (mounted) {
        setState(() {
          _stats = results[0] as DashboardStats;
          _daily = results[1] as List<DailyCount>;
          _statsLoading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() => _statsLoading = false);
      }
    }
  }

  String _statValue(int? value) {
    if (_statsLoading) return '…';
    return value?.toString() ?? '—';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(),
          const SizedBox(height: 20),
          _buildStatCards(),
          const SizedBox(height: 16),
          _buildAnalyticsRow(),
          const SizedBox(height: 16),
          _buildRecentListings(),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Header
  // ---------------------------------------------------------------------------
  Widget _buildHeaderSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth <= 640;
        final title = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Home / Dashboard",
                style: GoogleFonts.inter(
                    fontSize: 12, color: AppColors.textMuted)),
            const SizedBox(height: 2),
            Text("Dashboard",
                style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary)),
            const SizedBox(height: 2),
            Text("Overview of platform activity",
                style: GoogleFonts.inter(
                    fontSize: 13, color: AppColors.textSecondary)),
          ],
        );

        if (isNarrow) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              title,
              const SizedBox(height: 14),
              _buildAddShowroomButton(fullWidth: true),
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: title),
            _buildAddShowroomButton(),
          ],
        );
      },
    );
  }

  Widget _buildAddShowroomButton({bool fullWidth = false}) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: 44,
      child: ElevatedButton.icon(
        onPressed: () => context.push('/add-showroom'),
        icon: const Icon(Icons.add, size: 18),
        label: const Text("Add showroom"),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // KPI stat cards (wired to real bloc data)
  // ---------------------------------------------------------------------------
  Widget _buildStatCards() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = width >= 900
            ? 4
            : width >= 560
                ? 2
                : 1;
        const spacing = 12.0;
        // Subtract a small epsilon so floating-point rounding never pushes the
        // row a fraction over the available width (which would wrap a card).
        final cardWidth =
            ((width - spacing * (columns - 1)) / columns) - 0.5;

        final valueText = _statsLoading
            ? '…'
            : (_stats?.totalValue != null
                ? _formatCurrency(_stats!.totalValue!)
                : '—');

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            SizedBox(
              width: cardWidth,
              child: _kpiCard(
                icon: Icons.people_outline,
                iconBg: const Color(0xFFEEF2FF),
                iconColor: AppColors.accent,
                value: _statValue(_stats?.totalUsers),
                label: "Active users",
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: _kpiCard(
                icon: Icons.description_outlined,
                iconBg: const Color(0xFFFCE7F3),
                iconColor: const Color(0xFFDB2777),
                value: _statValue(_stats?.totalListings),
                label: "Total listings",
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: _kpiCard(
                icon: Icons.storefront_outlined,
                iconBg: const Color(0xFFE0E7FF),
                iconColor: const Color(0xFF4F46E5),
                value: _statValue(_stats?.totalShowrooms),
                label: "Total showrooms",
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: _kpiCard(
                icon: Icons.currency_rupee,
                iconBg: const Color(0xFFF3E8FF),
                iconColor: const Color(0xFF9333EA),
                value: valueText,
                label: "Listings value",
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _kpiCard({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: iconBg, borderRadius: BorderRadius.circular(9)),
            child: Icon(icon, color: iconColor, size: 19),
          ),
          const SizedBox(height: 14),
          Text(value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary)),
          const SizedBox(height: 2),
          Text(label,
              style: GoogleFonts.inter(
                  fontSize: 12.5, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Analytics row: chart panel + key metrics
  // ---------------------------------------------------------------------------
  Widget _buildAnalyticsRow() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final stack = constraints.maxWidth < 760;
        // Shared height for the side-by-side panels so they line up exactly.
        // (LineChart has no intrinsic height, so IntrinsicHeight can't be used.)
        const double rowHeight = 272;

        // When side-by-side, the panel is height-bounded (SizedBox below), so
        // the chart can Expand to fill it. When stacked it needs a fixed height.
        final chart = _panel(
          title: "Analytics",
          trailing: _pill("Last 7 days"),
          child: stack
              ? SizedBox(height: 200, child: _buildLineChart())
              : Expanded(child: _buildLineChart()),
        );
        final metrics = _panel(
          title: "Key metrics",
          child: Column(
            children: [
              _MetricRow(
                  label: 'Total listings',
                  value: _statValue(_stats?.totalListings)),
              _MetricRow(
                  label: 'Total users',
                  value: _statValue(_stats?.totalUsers)),
              _MetricRow(
                  label: 'Sold listings',
                  value: _statValue(_stats?.soldListings),
                  isLast: true),
            ],
          ),
        );

        if (stack) {
          return Column(children: [
            chart,
            const SizedBox(height: 16),
            metrics,
          ]);
        }
        // Bounded height + stretch forces both panels to exactly the same
        // height, regardless of their content.
        return SizedBox(
          height: rowHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 17, child: chart),
              const SizedBox(width: 16),
              Expanded(flex: 10, child: metrics),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLineChart() {
    final data = _daily;

    if (_statsLoading && data.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (data.isEmpty) {
      return Center(
        child: Text("No activity data",
            style: GoogleFonts.inter(
                fontSize: 13, color: AppColors.textSecondary)),
      );
    }

    final spots = <FlSpot>[
      for (int i = 0; i < data.length; i++)
        FlSpot(i.toDouble(), data[i].count.toDouble()),
    ];

    final maxCount =
        data.map((e) => e.count).fold<int>(0, (a, b) => b > a ? b : a);
    // Round headroom up to a sensible axis max (min 5).
    final maxY = (maxCount <= 4 ? 5 : (maxCount * 1.25).ceil()).toDouble();
    final yInterval = (maxY / 4).ceilToDouble();
    final lastIndex = data.length - 1;

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            preventCurveOverShooting: true,
            color: AppColors.accent,
            barWidth: 3,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
                show: true, color: AppColors.accent.withOpacity(0.08)),
            spots: spots,
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) => touchedSpots.map((s) {
              final d = data[s.x.toInt()].date;
              return LineTooltipItem(
                '${DateFormat('MMM d').format(d)}\n${s.y.toInt()} added',
                GoogleFonts.inter(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              );
            }).toList(),
          ),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final i = value.toInt();
                if (i < 0 || i >= data.length) return const SizedBox.shrink();
                // Show first, last, and (for longer ranges) the midpoint.
                final showMid = data.length > 4 && i == (lastIndex ~/ 2);
                if (i != 0 && i != lastIndex && !showMid) {
                  return const SizedBox.shrink();
                }
                final label = i == lastIndex
                    ? 'Today'
                    : DateFormat('MMM d').format(data[i].date);
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(label,
                      style: GoogleFonts.inter(
                          fontSize: 10, color: AppColors.textMuted)),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                interval: yInterval,
                reservedSize: 28,
                getTitlesWidget: (value, meta) => Text('${value.toInt()}',
                    style: GoogleFonts.inter(
                        fontSize: 10, color: AppColors.textMuted))),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: yInterval,
          getDrawingHorizontalLine: (v) =>
              FlLine(color: AppColors.border, strokeWidth: 1),
        ),
        minX: 0,
        maxX: lastIndex.toDouble(),
        minY: 0,
        maxY: maxY,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Recent listings (wired to AdsBloc)
  // ---------------------------------------------------------------------------
  Widget _buildRecentListings() {
    return _panel(
      title: "Recent listings",
      trailing: GestureDetector(
        onTap: () => context.go('/advertisements'),
        child: Text("View all",
            style: GoogleFonts.inter(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: AppColors.accent)),
      ),
      child: BlocBuilder<AdsBloc, AdsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: Center(child: CircularProgressIndicator()),
            ),
            loaded: (ads, total, _, __) {
              if (ads.isEmpty) {
                return _emptyHint("No listings yet");
              }
              final rows = ads.take(5).toList();
              return Column(
                children: [
                  _recentHeaderRow(),
                  ...rows.map(_recentDataRow),
                ],
              );
            },
            error: (message) => _emptyHint(message),
            orElse: () => _emptyHint("No listings to show"),
          );
        },
      ),
    );
  }

  Widget _recentHeaderRow() {
    final s = GoogleFonts.inter(
        fontSize: 10.5,
        fontWeight: FontWeight.w600,
        color: AppColors.textMuted,
        letterSpacing: 0.4);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(flex: 4, child: Text("VEHICLE", style: s)),
          Expanded(flex: 3, child: Text("LOCATION", style: s)),
          Expanded(flex: 2, child: Text("PRICE", style: s)),
          Expanded(flex: 2, child: Text("STATUS", style: s)),
        ],
      ),
    );
  }

  Widget _recentDataRow(AdModel ad) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(ad.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary)),
          ),
          Expanded(
            flex: 3,
            child: Text(ad.location.isEmpty ? '—' : ad.location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    fontSize: 12.5, color: AppColors.textSecondary)),
          ),
          Expanded(
            flex: 2,
            child: Text(_formatCurrency(ad.price),
                style: GoogleFonts.inter(
                    fontSize: 13, color: AppColors.textPrimary)),
          ),
          Expanded(flex: 2, child: _statusChip(ad)),
        ],
      ),
    );
  }

  Widget _statusChip(AdModel ad) {
    late String text;
    late Color bg;
    late Color fg;
    if (ad.soldOut) {
      text = 'Sold';
      bg = AppColors.surfaceAlt;
      fg = AppColors.textSecondary;
    } else if (ad.status == 'rejected') {
      text = 'Rejected';
      bg = AppColors.dangerSoft;
      fg = AppColors.danger;
    } else if (ad.isApproved) {
      text = 'Approved';
      bg = AppColors.successSoft;
      fg = AppColors.success;
    } else {
      text = 'Pending';
      bg = AppColors.warningSoft;
      fg = const Color(0xFF92400E);
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
        child: Text(text,
            style: GoogleFonts.inter(
                fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Shared building blocks
  // ---------------------------------------------------------------------------
  BoxDecoration _cardDecoration() => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      );

  Widget _panel(
      {required String title, Widget? trailing, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary)),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _pill(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(7)),
        child: Text(text,
            style: GoogleFonts.inter(
                fontSize: 11.5, color: AppColors.textSecondary)),
      );

  Widget _emptyHint(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(text,
              style: GoogleFonts.inter(
                  fontSize: 13, color: AppColors.textSecondary)),
        ),
      );

  /// Compact Indian-style currency (₹, K / L / Cr) without depending on
  /// locale-specific compact-number data (which isn't bundled for en_IN and
  /// would throw at runtime).
  String _formatCurrency(int amount) {
    String trim(double v) {
      final s = v.toStringAsFixed(1);
      return s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
    }

    if (amount.abs() >= 10000000) return '₹${trim(amount / 10000000)}Cr';
    if (amount.abs() >= 100000) return '₹${trim(amount / 100000)}L';
    if (amount.abs() >= 1000) return '₹${trim(amount / 1000)}K';
    return '₹$amount';
  }
}

class _MetricRow extends StatelessWidget {
  final String label;
  final String value;
  final String? trend;
  final bool isLast;

  const _MetricRow({
    required this.label,
    required this.value,
    this.trend,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final trend = this.trend;
    final trendColor = trend != null && trend.contains('+')
        ? AppColors.success
        : AppColors.danger;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: AppColors.surfaceAlt)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.inter(
                  fontSize: 12.5, color: AppColors.textSecondary)),
          Row(
            children: [
              Text(value,
                  style: GoogleFonts.inter(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary)),
              if (trend != null) ...[
                const SizedBox(width: 6),
                Text(trend,
                    style: GoogleFonts.inter(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: trendColor)),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
