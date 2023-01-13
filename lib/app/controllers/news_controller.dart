
import 'dart:convert';

import 'package:get/get.dart';
import 'package:news_paper_app/app/models/all_news.dart';
import 'package:http/http.dart' as http;
import 'package:news_paper_app/app/utils/baseurl.dart';
import 'package:news_paper_app/app/utils/custom_snackbar.dart';
import 'package:intl/intl.dart';


class NewsController extends GetxController{

  List<Articles> articles=[];
  var now;
  String? formattedDate;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

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
      "from": "2023-01-12",
      "to": "2023-01-12",
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
}