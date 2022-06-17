import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
 class VisitURLButton extends StatelessWidget {
  final String url;
  const VisitURLButton(this.url,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: visitURL, 
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                  ), 
                  child: const Text('Visit'),);
  }
  Future<void> visitURL()async{
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }
}