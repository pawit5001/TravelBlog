import 'package:flutter/material.dart';
import 'package:ui_13/core/color.dart';
import 'package:ui_13/widgets/bottom_nav.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onGetStartedTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (builder) => const BottomNavBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // เพิ่ม SingleChildScrollView ที่นี่
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 30),
            const Text(
              'TravelBlog',
              style: TextStyle(
                fontSize: 55.0,
                letterSpacing: 1.8,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'ศึกษาข้อมูลของสถานที่ ที่คุณอยากไป',
              style: TextStyle(
                color: grey,
                fontSize: 25,
                letterSpacing: 1.6,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 450,
              width: 450,
              child: Image.asset('assets/images/Asset1.png'),
            ),
            const SizedBox(height: 25),
            ScaleTransition(
              scale: _scaleAnimation,
              child: TextButton(
                onPressed: () {
                  _controller.forward();
                  // ใช้ Future เพื่อหน่วงเวลาการเปลี่ยนหน้า
                  Future.delayed(const Duration(milliseconds: 200), () {
                    _controller.reverse();
                    _onGetStartedTap();
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80.0,
                    vertical: 12.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'เริ่มสำรวจเลย',
                  style: TextStyle(
                    color: white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30), // เพิ่มระยะห่างด้านล่าง
          ],
        ),
      ),
    );
  }
}
