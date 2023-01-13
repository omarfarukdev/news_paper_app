import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);
  var data=Get.arguments;
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
                child: Image.network(data[5],fit: BoxFit.fill,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer_sharp,color: Colors.grey,),
                      Text(data[6].toString(),style: TextStyle(color: Colors.grey),),
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
                data[2],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.grey
                  ),
                ),
                child: Text(data[0]),
              ),
              SizedBox(height: 10,),
              Text(data[7]),
              SizedBox(height: 10,),
              Text("")
            ],
          ),
        ),
      ),
    );
  }
}
class bookController extends GetxController{

}
