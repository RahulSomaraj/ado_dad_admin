// Cross-platform PDF saver using conditional imports
import 'save_pdf_io.dart' if (dart.library.html) 'save_pdf_web.dart';

Future<void> savePdf(List<int> bytes, String filename) {
  return savePdfImpl(bytes, filename);
}
