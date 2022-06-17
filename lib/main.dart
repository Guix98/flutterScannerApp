import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner_list/controllers/home_page_controller.dart';
import 'package:scanner_list/controllers/scanner_controller.dart';
import 'package:scanner_list/pages/home_page.dart';
import 'package:scanner_list/routes/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Get.put<HomeController>(HomeController(), permanent : true);
    Get.put<ScannerController>(ScannerController());
  }

  @override
  Widget build(BuildContext context) {
    return Main();
  }
}
class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        theme: ThemeData(primarySwatch: Colors.indigo),
        defaultTransition: Transition.fade,
        getPages:routes,
    );
  }
}


