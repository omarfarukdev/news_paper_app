import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2861E),
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                margin: EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                child: Image.network("https://s.yimg.com/os/creatr-uploaded-images/2021-10/f7694340-25b2-11ec-bb65-1f3d94c5d6b3",fit: BoxFit.fill,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer_sharp,color: Colors.grey,),
                      Text(" 12-12-2023",style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                  IconButton(
                      onPressed: (){
                        print(" object");
                      },
                    icon: Icon(Icons.bookmark_border,color: Colors.grey,),
                  ),
                ],
              ),
              Text(
                "Apple TV and Apple Music apps quietly appear on the Microsoft Store",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.grey
                  ),
                ),
                child: Text("data"),
              ),
              SizedBox(height: 10,),
              Text("Apple Music and Apple TV apps have quietly arrived as preview versions on Microsoft Windows 11, according to a tweet from @ALumia_Italia seen by Thurrott. It's now possible to download the apps from … [+1341 chars]"),
              SizedBox(height: 10,),
              Text("${Get.arguments}")
            ],
          ),
        ),
      ),
    );
  }
}
class bookController extends GetxController{

}
