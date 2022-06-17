import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scanner_list/controllers/scanner_controller.dart';


import '../widgets/add_code_button.dart';

class ScanPage extends StatelessWidget {
  final _scannerController = Get.put<ScannerController>(ScannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan your codes'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
                allowDuplicates: false,
                controller: MobileScannerController(
                    facing: CameraFacing.back, torchEnabled: true),
                onDetect: (barcode, args) {
                  if (barcode.rawValue == null) {
                    Get.snackbar('Failed to scan', 'Something is bad with the code');
                  } else {
                    final String code = barcode.rawValue!;
                    _scannerController.setReading(code);
                    _scannerController.setReadingIsURL();
                   
                  
                  }
                }),
          ),
          Obx(() => Container(
                width: double.infinity,

                child: ListTile(
                  title: _scannerController.getReadingIsURL? 
                      Text(Uri.parse(_scannerController.getReading).authority, style: const TextStyle(fontWeight: FontWeight.bold),) : 
                      Text(_scannerController.getReading, style: const TextStyle(fontWeight: FontWeight.bold)), 
                  trailing: AddCodeButton(_scannerController.getReading,_scannerController.getReadingIsURL),
                  subtitle: _scannerController.getReadingIsURL? const Text('URL'): const Text('Not URL'),
              ))
      )],
      ),
    );
  }
}

