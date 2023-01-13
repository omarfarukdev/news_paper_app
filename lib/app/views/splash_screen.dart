
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_paper_app/app/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Get.offAllNamed(GetRoutes.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffF5591F),
                gradient: LinearGradient(
                  colors: [(new Color(0xffF5591F)),(new Color(0xffF2861E))],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Center(
              child: Container(
                height: 300,
                width: 200,
                child: Image.asset("assets/images/news_image.png",),
              ),
            ),
          ],
        ),
    );
  }
}
