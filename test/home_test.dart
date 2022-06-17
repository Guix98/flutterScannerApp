import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:scanner_list/controllers/home_page_controller.dart';
import 'package:scanner_list/models/scanned_code.dart';

 void main() {
   final _homeController = Get.put<HomeController>(HomeController()); 
  test('Codes list must update after adding a reading', (){
    ScannedCode scannedCode = ScannedCode(content: 'content', isUrl: false);
    _homeController.addReading(scannedCode);
    expect(_homeController.codes.value[0], scannedCode);
  });
  test('Delete an element from list after dismissReading', (){
    ScannedCode scannedCode = ScannedCode(content: 'content', isUrl: false);
    ScannedCode scannedCode2 = ScannedCode(content: 'content1', isUrl: true);
    ScannedCode scannedCode3 = ScannedCode(content: 'content2', isUrl: false);
    _homeController.addReading(scannedCode);
    _homeController.addReading(scannedCode2);
    _homeController.addReading(scannedCode3);

    _homeController.dismissReading(1);
    expect(_homeController.codes.value[0], scannedCode);
    expect(_homeController.codes.value[1], scannedCode3);
  });
  test('Code list must show as empty at the begining', (){
    _homeController.setCodesList();
    expect(_homeController.codesListIsEmpty.value, true);
  });
  test('Code list must not show as empty after adding codes', (){
    _homeController.setCodesList();
    expect(_homeController.codesListIsEmpty.value, true);
    ScannedCode scannedCode = ScannedCode(content: 'content', isUrl: false);
    ScannedCode scannedCode2 = ScannedCode(content: 'content1', isUrl: true);
    ScannedCode scannedCode3 = ScannedCode(content: 'content2', isUrl: false);
    _homeController.addReading(scannedCode);
    _homeController.addReading(scannedCode2);
    _homeController.addReading(scannedCode3);
    _homeController.setCodesList();
    expect(_homeController.codesListIsEmpty.value, false);
  });
}