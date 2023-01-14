
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_paper_app/app/routes/routes.dart';
import 'package:news_paper_app/app/utils/custom_snackbar.dart';

class DetailsController extends GetxController{
  final checkdata = GetStorage();
  late bool check=false;
  late DatabaseReference ref;
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkdata.writeIfNull('isLogged', false);

  }
  checkLogin(String sourcename,String author,String title,String description,String url,String urlToImage,String date,String content) async{
    if(checkdata.read("isLogged")) {
      check=true;
      print("login");
      final User? usernya = auth.currentUser;
      final String? uid = usernya?.uid;

      ref = FirebaseDatabase.instance.ref().child('news').child(uid!);
      await ref.set({
        "sourcename": sourcename!,
        "author": author!,
        "title":title!,
        "description":description!,
        "url":url!,
        "urlToImage":urlToImage!,
        "poblishedAt":date!,
        "content":content!,
      }).asStream();
      CustomSnackbar("Success", " Bookmark Successful", "success");
    }
    else{
      checkdata.write("from", "details");
      Get.offNamed(GetRoutes.login);
      print("off");
    }
  }

}