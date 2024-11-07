import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // เพิ่ม import นี้
import 'package:ui_13/core/color.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // กำหนดพื้นหลังเป็นสีขาว
      appBar: AppBar(
        automaticallyImplyLeading: false, // ปิดการแสดงปุ่ม back
        title: const Text(
          'ช่วยเหลือ',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.green, // สีของ AppBar
      ),
      body: SingleChildScrollView(
        // เพิ่ม SingleChildScrollView ที่นี่
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'คำถามที่พบบ่อย',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. วิธีใช้งานแอปพลิเคชันนี้คืออะไร?',
              style: TextStyle(fontSize: 22.0),
            ),
            const SizedBox(height: 5),
            const Text(
              'ตอบ: แอปนี้ช่วยให้คุณสามารถศึกษาข้อมูลของสถานที่ที่คุณอยากไป',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 15),
            const Text(
              '2. ฉันสามารถเพิ่มสถานที่ลงในรายการโปรดได้อย่างไร?',
              style: TextStyle(fontSize: 22.0),
            ),
            const SizedBox(height: 5),
            const Text(
              'ตอบ: คุณสามารถเพิ่มสถานที่โดยการกดไอคอนรูปหัวใจที่หน้ารายละเอียดของสถานที่นั้น',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 15),
            const Text(
              '3. จะลบสถานที่ออกจากรายการโปรดได้อย่างไร?',
              style: TextStyle(fontSize: 22.0),
            ),
            const SizedBox(height: 5),
            const Text(
              'ตอบ: คุณสามารถลบสถานที่โปรดของคุณโดยการกดไอคอนรูปถังขยะที่หน้าแสดงรายการโปรด',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 15),
            const Text(
              '4. วิธีการติดต่อทีมงาน?',
              style: TextStyle(fontSize: 22.0),
            ),
            const SizedBox(height: 5),
            const Text(
              'ตอบ: คุณสามารถติดต่อทีมงานผ่านอีเมลได้ที่ปุ่มติดต่อเราด้านล่าง',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20), // เพิ่มระยะห่าง
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // แสดงข้อมูลอีเมลในป๊อปอัป
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'ข้อมูลการติดต่อ',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        content: const Text(
                          'ติดต่อเราที่: pawit.wee@rmutto.ac.th',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'ปิด',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // คัดลอกอีเมลไปยังคลิปบอร์ด
                              Clipboard.setData(
                                const ClipboardData(
                                    text: 'pawit.wee@rmutto.ac.th'),
                              ).then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'คัดลอกที่อยู่อีเมลแล้ว!',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    duration: Duration(
                                        seconds: 1), // ตั้งค่า duration
                                  ),
                                );
                              });
                            },
                            child: const Text(
                              'คัดลอกที่อยู่อีเมล',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'ติดต่อเรา',
                  style: TextStyle(fontSize: 20, color: white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // เปลี่ยนจาก primary เป็น backgroundColor
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
