import 'package:get/get.dart';
import 'package:scanner_list/pages/scan_page.dart';

import '../pages/home_page.dart';

List<GetPage> routes = [
  GetPage(name: '/home', page: () => HomePage()),
  GetPage(name: '/scan', page: () => ScanPage()),
  ];
