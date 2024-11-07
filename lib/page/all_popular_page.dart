import 'package:flutter/material.dart';
import 'package:ui_13/data/plant_data.dart';
import 'package:ui_13/page/details_page.dart';

class AllPopularPage extends StatefulWidget {
  const AllPopularPage({Key? key}) : super(key: key);

  @override
  _AllPopularPageState createState() => _AllPopularPageState();
}

class _AllPopularPageState extends State<AllPopularPage> {
  String? sortOption;

  void sortPlants(String option) {
    setState(() {
      sortOption = option;
      if (option == 'country') {
        popularPlants.sort((a, b) => a.country.compareTo(b.country));
      } else if (option == 'category') {
        // สมมติว่าใน Plants class ของคุณมีการเก็บข้อมูลทวีป
        popularPlants.sort((a, b) => a.category.compareTo(b.category));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'สถานที่ทั้งหมด',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.green,
        actions: [
          PopupMenuButton<String>(
            onSelected: sortPlants,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'country',
                child: Text(
                  'จัดเรียงตามประเทศ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const PopupMenuItem(
                value: 'category',
                child: Text(
                  'จัดเรียงตามทวีป',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 8.0), // เพิ่มระยะห่างจากขอบ
        child: ListView.builder(
          itemCount: popularPlants.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsPage(plant: popularPlants[index]),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15.0),
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          15.0), // ใช้ ClipRRect เพื่อทำให้ภาพมีมุมโค้ง
                      child: Image.asset(
                        popularPlants[index].imagePath,
                        width: 100, // ลดขนาดภาพ
                        height: 100,
                        fit: BoxFit.cover, // ปรับให้ภาพเต็มพื้นที่
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      // เพิ่ม Expanded เพื่อให้ข้อความมีพื้นที่เหลือ
                      child: Text(
                        popularPlants[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
