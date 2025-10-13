// Cross-platform CSV saver using conditional imports
import 'save_csv_io.dart' if (dart.library.html) 'save_csv_web.dart';

Future<void> saveCsv(List<int> bytes, String filename) {
  return saveCsvImpl(bytes, filename);
}
