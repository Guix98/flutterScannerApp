import 'package:get/get.dart';
import 'package:scanner_list/models/scanned_code.dart';

class HomeController extends GetxController {


final RxList<ScannedCode> codes = [
  ScannedCode(content: 'content123', isUrl: true),

  ].obs;
List<ScannedCode> get getCodes => codes.value;
final RxBool codesListIsEmpty = true.obs;

  @override
  void onInit() async {
    setCodesList();
    super.onInit();
  }

addReading(ScannedCode scannedCode){
  if (codes.value[0].content=='content123') {
    codes.value[0] = scannedCode; 
  }else{

  codes.value.add(scannedCode);
  }
  codes.refresh();
  setCodesList();
}
dismissReading(int index){
  codes.value.removeAt(index);
  setCodesList();
}

setCodesList(){
  if (codes.value[0].content=='content123') {
    codesListIsEmpty.value=true;
  }
  else{
    codesListIsEmpty.value=false;
  }
  codes.refresh();
}
}