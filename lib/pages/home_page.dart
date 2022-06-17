import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanner_list/controllers/home_page_controller.dart';
import 'package:scanner_list/pages/scan_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/visit_url_button.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = Get.put<HomeController>(HomeController()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('QR and BarCode Scanner'),
      ),
      floatingActionButton: ScanButton(),
      body: Obx(
        () => Container(
          child: _homeController.codesListIsEmpty.value? 
          const Center(child: Text("You didn't read any code yet")) : 
          ListView.builder(
            itemCount: _homeController.getCodes.length,
            itemBuilder: (context , index){
              final item = _homeController.getCodes[index];
              return Dismissible(
                key: Key(item.content),
                onDismissed: (direction) {
                _homeController.dismissReading(index);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('DISMISSED: ${item.content}')));
              },
              background: Container(color: Colors.red, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                const Text('Delete', style: TextStyle(color: Colors.white)),
                  SizedBox(width: Get.width*0.1),
                 const Icon(Icons.delete, color: Colors.white,),
                  SizedBox(width: Get.width*0.1),
                ],
              ),),
                child: ListTile(
                  title: Text(_homeController.getCodes[index].content, 
                          style: const TextStyle(fontWeight: FontWeight.bold),), 
                  trailing: _homeController.getCodes[index].isUrl ? 
                    VisitURLButton(_homeController.getCodes[index].content,) : 
                    const SizedBox()),
              );
            },
          )))
    );
  }
}

class ScanButton extends StatelessWidget {
  const ScanButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Get.toNamed('/scan');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_scanner,
            ),
            Container(
                width: 20,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      'scan',
                      style: GoogleFonts.orbitron(color: Colors.white),
                    )))
          ],
        ));
  }
}
