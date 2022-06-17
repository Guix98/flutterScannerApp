import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanner_list/controllers/home_page_controller.dart';

import '../models/scanned_code.dart';

class AddCodeButton extends StatelessWidget {
  final String content;
  final bool isURL;
  AddCodeButton(
    this.content,
    this.isURL,
    {
    Key? key,
  }) : super(key: key);
 final _homeController = Get.put<HomeController>(HomeController()); 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width*0.25,
      child: ElevatedButton(
        onPressed: (){
          _homeController.addReading(buildScan(content, isURL));
           Get.snackbar('Code addded!', content, backgroundColor: Colors.indigoAccent,colorText: Colors.white, duration: const Duration(seconds: 2));
        },
        style: ButtonStyle(elevation: MaterialStateProperty.all(0), backgroundColor: MaterialStateProperty.all(Colors.green)), 
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.check_circle_outline),
            Text('Add', style: GoogleFonts.orbitron(color: Colors.white),)
          ],
        ),
        ),
    );
  }
  
  ScannedCode buildScan(String content, bool isURL) {
    return ScannedCode(content: content, isUrl: isURL);
  }
}
