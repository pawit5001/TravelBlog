import 'package:flutter/material.dart';

class CreditPage extends StatelessWidget {
  const CreditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'เครดิต',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.green, // สีของ AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ผู้พัฒนาแอปพลิเคชัน',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Pawit\n∙นักออกแบบ UI/UX\n∙นักพัฒนา Flutter',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10),
            const Text(
              'ต้นแบบ UI',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Youtube: Flutter crown/@fluttercrown',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10),
            const Text(
              'ข้อมูลสถานที่/รูปภาพ',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              '∙wikipedia.org\n∙bing.com',
              style: TextStyle(fontSize: 20.0),
            ),
            const Text(
              'แรงบันดาลใจ',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              '∙Agoda\n∙Trip.com',
              style: TextStyle(fontSize: 20.0),
            ),
            const Spacer(),
            Center(
              child: Text(
                'ขอขอบคุณสำหรับการสนับสนุน!',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
