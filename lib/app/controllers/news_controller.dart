
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_paper_app/app/models/all_news.dart';
import 'package:http/http.dart' as http;
import 'package:news_paper_app/app/routes/routes.dart';
import 'package:news_paper_app/app/utils/baseurl.dart';
import 'package:news_paper_app/app/utils/custom_snackbar.dart';
import 'package:intl/intl.dart';


class NewsController extends GetxController{

  List<Articles> articles=[];
  var now;
  String? formattedDate;
  final checkdata = GetStorage();
  late bool check=false;
  late DatabaseReference ref;
  FirebaseAuth auth=FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkdata.writeIfNull('isLogged', false);
    now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    formattedDate = formatter.format(now);
    fetchAllArticles();
  }

  void fetchAllArticles() async{
    var q='apple';
    var sortBy='popularity';
    print("object");
    Map<String, dynamic> query ={
      "q": "apple",
      "from": formattedDate,
      "to": formattedDate,
      "sortBy": 'popularity',
      "apiKey": apiKey,
    };
    String fullURL = Uri.parse(baseurl).replace(queryParameters: query).toString();
    var response = await http.get(Uri.parse(fullURL));
    var res = await json.decode(response.body);

    if(response.statusCode==200){
      if(res['status']=='ok'){
        articles=AllNews.fromJson(res).articles!;
        update();
      }
    }
  }
  checkLogin(String? sourcename,String? author,String? title,String? description,String? url,String? urlToImage,String? date,String? content) async{
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

  void checkLoginf(String? name, String? author, String? title, String? description, String? url, String? urlToImage, date, String? content) {}
}