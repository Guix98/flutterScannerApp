import 'package:get/get.dart';

class ScannerController extends GetxController {

RxString reading = 'Your Scan Goes here'.obs;
 String get getReading => reading.value;
 void setReading(String reading) => this.reading.value = reading;

RxBool readingIsURL = false.obs;
 bool get getReadingIsURL => readingIsURL.value;
 void setReadingIsURL() => readingIsURL.value = Uri.parse(getReading).isAbsolute;

}