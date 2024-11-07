import 'package:flutter/material.dart';
import 'package:ui_13/core/color.dart';
import 'package:ui_13/data/bottom_menu.dart';
import 'package:ui_13/page/home_page.dart';
import 'package:ui_13/page/wishlist_page.dart'; // นำเข้า WishlistPage
import 'package:ui_13/page/help_page.dart'; // นำเข้า HelpPage
import 'package:ui_13/page/credit_page.dart'; // นำเข้า CreditPage

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController pageController = PageController();
  int selectIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) => setState(() => selectIndex = value),
        children: [
          const HomePage(),
          const WishlistPage(), // หน้ารายการโปรด
          const HelpPage(), // หน้าช่วยเหลือ
          const CreditPage(), // หน้าขอบคุณ/เครดิต
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; bottomMenu.length > i; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectIndex = i;
                      pageController.jumpToPage(i);
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        bottomMenu[i].imagePath,
                        width: 30.0, // ปรับขนาดความกว้างที่ต้องการ
                        height: 30.0, // ปรับขนาดความสูงที่ต้องการ
                        color:
                            selectIndex == i ? green : black.withOpacity(0.8),
                      ),
                      const SizedBox(
                          height: 5), // ระยะห่างระหว่าง icon และ title
                      Text(
                        bottomMenu[i].title,
                        style: TextStyle(
                          fontFamily: 'MN MINI', // ใช้ฟอนต์ MN MINI
                          fontSize: 15.0, // ขนาดฟอนต์
                          color:
                              selectIndex == i ? green : black.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
