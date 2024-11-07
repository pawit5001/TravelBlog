import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui_13/core/color.dart';
import 'package:ui_13/data/plant_data.dart';
import 'package:ui_13/page/details_page.dart';
import 'package:ui_13/page/all_popular_page.dart';
import 'package:ui_13/data/plant_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController(viewportFraction: 0.6);
  final PageController popularController =
      PageController(viewportFraction: 0.6);
  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  int activePage = 0;
  int activePopularPage = 0;

  @override
  void dispose() {
    searchController.dispose();
    focusNode.dispose();
    controller.dispose();
    popularController.dispose();
    super.dispose();
  }

  void searchPlant() async {
    String query = searchController.text.toLowerCase();
    await Future.delayed(const Duration(seconds: 1));

    try {
      final Plants plantFromPlants = plants.firstWhere(
        (plant) => plant.name.toLowerCase() == query,
        orElse: () => throw ('ไม่พบข้อมูล!'),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(plant: plantFromPlants),
        ),
      );
    } catch (e) {
      try {
        final Plants plantFromPopular = popularPlants.firstWhere(
          (plant) => plant.name.toLowerCase() == query,
          orElse: () => throw ('ไม่พบข้อมูล!'),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(plant: plantFromPopular),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
              style: const TextStyle(fontFamily: 'MN MINI', fontSize: 18),
            ),
            duration:
                const Duration(seconds: 2), // ตั้งค่า duration เป็น 2 วินาที
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: green,
        automaticallyImplyLeading: false, // ไม่ต้องการปุ่มกลับ
        title: const Text(
          'หน้าหลัก', // เพิ่มข้อความใน AppBar
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400, // เปลี่ยนสีข้อความตามต้องการ
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // เมื่อกดไอคอนเมนู
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllPopularPage(),
                ),
              );
            },
            icon: Image.asset(
              'assets/icons/menu.png',
              color: black.withOpacity(0.7),
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          focusNode.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45.0,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(color: green),
                          boxShadow: [
                            BoxShadow(
                              color: green.withOpacity(0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                focusNode: focusNode,
                                controller: searchController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "ค้นหาชื่อเมืองหรือสถานที่",
                                  hintStyle: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Image.asset('assets/icons/search.png',
                                  height: 25),
                              onPressed: () {
                                focusNode.unfocus();
                                searchPlant();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'สถานที่ยอดนิยม',
                  style: TextStyle(
                    color: black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
              SizedBox(
                height: 320.0,
                child: PageView.builder(
                  itemCount: plants.length,
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  padEnds: false,
                  pageSnapping: true,
                  onPageChanged: (value) {
                    setState(() {
                      activePage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    bool active = index == activePage;
                    return slider(active, index);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'สถานที่ทั้งหมด',
                      style: TextStyle(
                        color: black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        focusNode.unfocus();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllPopularPage(),
                          ),
                        );
                      },
                      icon: Image.asset(
                        'assets/icons/more.png',
                        color: Colors.grey,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 320.0,
                child: PageView.builder(
                  itemCount: popularPlants.length,
                  controller: popularController,
                  physics: const BouncingScrollPhysics(),
                  padEnds: false,
                  pageSnapping: true,
                  onPageChanged: (value) {
                    setState(() {
                      activePopularPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    bool active = index == activePopularPage;
                    return sliderPopular(active, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer slider(bool active, int index) {
    double margin = active ? 20 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantsCard(index),
    );
  }

  Widget mainPlantsCard(int index) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(plant: plants[index]),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
          ],
          border: Border.all(color: green, width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: lightGreen,
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  image: AssetImage(plants[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Text(
                plants[index].name,
                style: const TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer sliderPopular(bool active, int index) {
    double margin = active ? 20 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantsCardPopular(index),
    );
  }

  Widget mainPlantsCardPopular(int index) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(plant: popularPlants[index]),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
          ],
          border: Border.all(color: green, width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: lightGreen,
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  image: AssetImage(popularPlants[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Text(
                popularPlants[index].name,
                style: const TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
