import 'dart:typed_data';

import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/notification/bloc/bloc/notification_bloc.dart';
import 'package:ado_dad_admin/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  Uint8List? _notificationImage;
  List<NotificationListItem> _notifications = [];
  bool _isLoadingList = false;
  int _page = 1;
  int _totalPages = 1;
  final int _limit = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestNotifications();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _requestNotifications({int page = 1}) {
    context.read<NotificationBloc>().add(
          FetchNotifications(page: page, limit: _limit),
        );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() => _notificationImage = bytes);
    }
  }

  void _send() {
    final title = _titleController.text.trim();
    final body = _messageController.text.trim();
    if (title.isEmpty || body.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Title and message are required")),
      );
      return;
    }
    context.read<NotificationBloc>().add(
          SendBroadcastNotification(
            title: title,
            body: body,
            imageBytes: _notificationImage,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
      listener: (context, state) {
        if (state is NotificationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.success),
          );
          // Clear the composer and refresh the history.
          _titleController.clear();
          _messageController.clear();
          setState(() => _notificationImage = null);
          _requestNotifications(page: 1);
        } else if (state is NotificationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.danger),
          );
          if (_isLoadingList) setState(() => _isLoadingList = false);
        } else if (state is NotificationListLoading) {
          if (!_isLoadingList) setState(() => _isLoadingList = true);
        } else if (state is NotificationListLoaded) {
          setState(() {
            _notifications = state.items;
            _page = state.page;
            _totalPages = state.totalPages;
            _isLoadingList = false;
          });
        }
      },
      builder: (context, state) {
        final sending = state is NotificationLoading;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  final stacked = constraints.maxWidth < 900;
                  final compose = _composePanel(sending);
                  final history = _historyPanel();
                  if (stacked) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        compose,
                        const SizedBox(height: 16),
                        history,
                      ],
                    );
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 360, child: compose),
                      const SizedBox(width: 16),
                      Expanded(child: history),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  BoxDecoration _card() => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      );

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Home / Notifications",
            style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
        const SizedBox(height: 2),
        Text("Notifications",
            style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary)),
        const SizedBox(height: 2),
        Text("Send and review broadcast notifications",
            style:
                GoogleFonts.inter(fontSize: 13, color: AppColors.textSecondary)),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Compose panel
  // ---------------------------------------------------------------------------
  Widget _composePanel(bool sending) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Send notification",
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary)),
          const SizedBox(height: 16),
          _label("Title"),
          const SizedBox(height: 6),
          TextField(
            controller: _titleController,
            style:
                GoogleFonts.inter(fontSize: 14, color: AppColors.textPrimary),
            decoration: const InputDecoration(
                isDense: true, hintText: "Notification title"),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 14),
          _label("Message"),
          const SizedBox(height: 6),
          TextField(
            controller: _messageController,
            maxLines: 4,
            style:
                GoogleFonts.inter(fontSize: 14, color: AppColors.textPrimary),
            decoration:
                const InputDecoration(hintText: "Write your message…"),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _label("Image"),
              const SizedBox(width: 4),
              Text("(optional)",
                  style: GoogleFonts.inter(
                      fontSize: 12, color: AppColors.textMuted)),
            ],
          ),
          const SizedBox(height: 6),
          _imageDropzone(),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton.icon(
              onPressed: sending ? null : _send,
              icon: sending
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white))
                  : const Icon(Icons.send, size: 17),
              label: Text(sending ? "Sending…" : "Send notification",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageDropzone() {
    if (_notificationImage != null) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.memory(_notificationImage!,
                height: 130, width: double.infinity, fit: BoxFit.cover),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: InkWell(
              onTap: () => setState(() => _notificationImage = null),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.black54, shape: BoxShape.circle),
                child:
                    const Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      );
    }
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.surfaceAlt,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: AppColors.borderStrong,
              style: BorderStyle.solid,
              width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_upload_outlined,
                size: 26, color: AppColors.textMuted),
            const SizedBox(height: 6),
            Text("Tap to upload image",
                style: GoogleFonts.inter(
                    fontSize: 12.5, color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Text(text,
      style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary));

  // ---------------------------------------------------------------------------
  // History panel
  // ---------------------------------------------------------------------------
  Widget _historyPanel() {
    return Container(
      decoration: _card(),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
            child: Text("Sent notifications",
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary)),
          ),
          const Divider(height: 1),
          if (_isLoadingList)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 48),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_notifications.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Center(
                child: Text("No notifications sent yet",
                    style: GoogleFonts.inter(color: AppColors.textSecondary)),
              ),
            )
          else ...[
            ..._notifications
                .asMap()
                .entries
                .map((e) => _notificationTile(
                    e.value, e.key != _notifications.length - 1)),
            _pager(),
          ],
        ],
      ),
    );
  }

  Widget _notificationTile(NotificationListItem item, bool divider) {
    final hasImage = item.media?.url != null && item.media!.url.isNotEmpty;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: divider
            ? const Border(bottom: BorderSide(color: AppColors.border))
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: hasImage
                ? Image.network(item.media!.url,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(
                        Icons.image_outlined,
                        color: AppColors.textMuted))
                : const Icon(Icons.notifications_none,
                    color: AppColors.textMuted),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary)),
                    ),
                    if (item.priority != null && item.priority!.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      _priorityChip(item.priority!),
                    ],
                  ],
                ),
                const SizedBox(height: 3),
                Text(item.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        fontSize: 12.5,
                        height: 1.45,
                        color: AppColors.textSecondary)),
                if (item.targetType != null &&
                    item.targetType!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.people_outline,
                          size: 13, color: AppColors.textMuted),
                      const SizedBox(width: 4),
                      Text(_targetLabel(item.targetType!),
                          style: GoogleFonts.inter(
                              fontSize: 11.5, color: AppColors.textMuted)),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _targetLabel(String target) {
    switch (target.toLowerCase()) {
      case 'all':
      case 'all_users':
      case 'broadcast':
        return 'All users';
      default:
        return target.replaceAll('_', ' ');
    }
  }

  Widget _priorityChip(String priority) {
    Color bg;
    Color fg;
    switch (priority.toLowerCase()) {
      case 'high':
        bg = AppColors.dangerSoft;
        fg = const Color(0xFF991B1B);
        break;
      case 'low':
        bg = AppColors.surfaceAlt;
        fg = AppColors.textSecondary;
        break;
      default:
        bg = AppColors.accentSoft;
        fg = AppColors.accent;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(5)),
      child: Text(
        priority[0].toUpperCase() + priority.substring(1).toLowerCase(),
        style: GoogleFonts.inter(
            fontSize: 10.5, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }

  Widget _pager() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Page $_page of $_totalPages",
              style: GoogleFonts.inter(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary)),
          const SizedBox(width: 14),
          _arrow(
            icon: Icons.chevron_left,
            enabled: _page > 1,
            onTap: () => _requestNotifications(page: _page - 1),
          ),
          const SizedBox(width: 6),
          _arrow(
            icon: Icons.chevron_right,
            enabled: _page < _totalPages,
            onTap: () => _requestNotifications(page: _page + 1),
          ),
        ],
      ),
    );
  }

  Widget _arrow({
    required IconData icon,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Icon(icon,
            size: 18,
            color: enabled ? AppColors.textPrimary : AppColors.textMuted),
      ),
    );
  }
}
