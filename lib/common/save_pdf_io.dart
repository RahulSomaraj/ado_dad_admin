// IO implementation (mobile/desktop) for PDF saving
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<void> savePdfImpl(List<int> bytes, String filename) async {
  Directory baseDir;
  try {
    baseDir = await getDownloadsDirectory() ??
        await getApplicationDocumentsDirectory();
  } catch (_) {
    baseDir = await getApplicationDocumentsDirectory();
  }
  final file = File('${baseDir.path}/$filename');
  await file.writeAsBytes(bytes, flush: true);
}
