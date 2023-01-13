
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_paper_app/app/controllers/news_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_paper_app/app/models/all_news.dart';
import 'package:news_paper_app/app/routes/routes.dart';
import 'package:news_paper_app/app/utils/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:news_paper_app/app/widgets/custom_button.dart';
import '../../utils/baseurl.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final newsController=Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
          padding: EdgeInsets.all(15),
        child: GetBuilder<NewsController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children:controller.articles.map((articles) =>
                    Slidable(
                        child: NewsList(articles:articles),
                    )).toList(),
                  /*List.generate(111, (index) =>
                      Slidable(
                        child: NewsList(),
                      )).toList(),*/

              ),
            );
          }
        ),
      ),
    );
  }
}
class NewsList extends StatelessWidget {
   NewsList({Key? key,required this.articles}) : super(key: key);
   final Articles articles;
  var now;
  String? formattedDate;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        String dates=articles.publishedAt.toString();
        final date = dates.split('T');
        Get.toNamed(GetRoutes.details,arguments: [articles.source?.name,articles.author,articles.title,articles.description,articles.url,articles.urlToImage,date[0],articles.content],);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 12,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                 // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        articles.title!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      articles.description!,
                      maxLines: 5,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 2,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/5,
                          child: Image.network(
                            articles.urlToImage!,
                            fit:BoxFit.fill ,
                          ),
                      ),
                      SizedBox(height: 10,),
                      CustomButton(
                          label: "Bookmark",
                          onPressed: (){
                            //controller.ForgotPassword();
                            Get.offNamed(GetRoutes.login);
                          }
                          ),
                    ],
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}

