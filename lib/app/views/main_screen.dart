import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_paper_app/app/controllers/navigation_controller.dart';
import 'package:news_paper_app/app/views/account_screen.dart';
import 'package:news_paper_app/app/views/home/home_screen.dart';
import 'package:news_paper_app/app/views/news/bookmark_screen.dart';
import 'package:news_paper_app/app/widgets/custom_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  NaviControllare naviControllare=Get.put(
      NaviControllare());

  final pages=[
    HomeScreen(),
    BookMarkScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2861E),
        title: Text("News App"),
      ),
      body: Obx(()=> IndexedStack(
          index: naviControllare.selectedIndex.value,
          children: pages,
        ),
      ),
      bottomNavigationBar: Obx(()=> CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.colorScheme.secondary,
          currentIndex:naviControllare.selectedIndex.value,
          onChange: (index) {
            //controller.changePage(index);
            naviControllare.changeIndex(index);
          },
          children: [
          CustomBottomNavigationItem(
            icon: Icons.home_outlined,
            label: "Home".tr,
            color: Color(0xffF2861E)
          ),
            CustomBottomNavigationItem(
              icon: Icons.bookmark,
              label: "BookMark".tr,
                color: Color(0xffF2861E)
            ),
            CustomBottomNavigationItem(
              icon: Icons.account_box,
              label: "Account".tr,
                color: Color(0xffF2861E)
            ),
        ]
        ),
      ),
    );
  }
}
