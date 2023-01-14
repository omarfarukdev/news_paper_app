import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_paper_app/app/routes/routes.dart';
import 'package:news_paper_app/app/utils/custom_snackbar.dart';

class NaviControllare extends GetxController{

  var selectedIndex = 0.obs;
  final checkdata = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkdata.writeIfNull('isLogged', false);
  }
  void changeIndex(int index){
    if(checkdata.read("isLogged")){
      selectedIndex.value = index;
    }
    else{
      CustomSnackbar("Error", "phone number is required ${index}", "error");
      if(index==1){
        Get.offNamed(GetRoutes.login);
        checkdata.write("from", "bookmark");

      }
      else if(index==2){
        Get.offNamed(GetRoutes.login);
        checkdata.write("from", "accoutn");

      }
      else{
      selectedIndex.value = index;
    }
    }

  }

}