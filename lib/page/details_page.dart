import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_13/core/color.dart';
import 'package:ui_13/data/plant_model.dart';
import 'package:ui_13/page/home_page.dart';
import 'package:ui_13/page/wishlist_provider.dart';

class DetailsPage extends StatefulWidget {
  final Plants plant;

  const DetailsPage({
    Key? key,
    required this.plant,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _isCooldown = false; // ตัวแปรเช็ค cooldown

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        bool isFromSearch = ModalRoute.of(context)?.settings.name == '/search';

        if (isFromSearch) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
          return false;
        }

        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 2,
                    decoration: BoxDecoration(
                      color: lightGreen,
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.plant.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.plant.name,
                                        style: TextStyle(
                                          color: black.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'MN MINI',
                                          fontSize: 23.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '  (เมืองใน${widget.plant.category})',
                                        style: TextStyle(
                                          color: black.withOpacity(0.5),
                                          fontFamily: 'MN MINI',
                                          fontSize: 21.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: _isCooldown
                                      ? null
                                      : () {
                                          _handleWishlist(context);
                                        },
                                  icon: Image.asset(
                                    'assets/icons/heart.png',
                                    color: black,
                                    width: 30, // กำหนดความกว้าง
                                    height: 30,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            RichText(
                              text: TextSpan(
                                text: widget.plant.description,
                                style: TextStyle(
                                  color: black.withOpacity(0.5),
                                  fontFamily: 'MN MINI',
                                  fontSize: 19.0,
                                  height: 1.4,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
                      backgroundColor: green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      shadowColor: green.withOpacity(0.2),
                      elevation: 5,
                    ),
                    child: const Text(
                      'ย้อนกลับ',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleWishlist(BuildContext context) {
    // ตรวจสอบว่าอยู่ในช่วง cooldown หรือไม่
    if (_isCooldown) {
      return; // ไม่ทำอะไรถ้าอยู่ใน cooldown
    }

    final wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);

    // ตรวจสอบว่าพืชนี้มีอยู่ใน Wishlist หรือไม่
    if (wishlistProvider.wishlistItems.contains(widget.plant)) {
      // ปิด Snackbar ก่อนหน้า
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "รายการนี้อยู่ในรายการโปรดของคุณแล้ว!",
            style: TextStyle(fontSize: 18),
          ),
          duration: Duration(seconds: 2),
        ),
      );

      // เริ่ม cooldown
      setState(() {
        _isCooldown = true; // ตั้งค่า cooldown
      });

      // เรียกใช้ Future.delayed เพื่อรีเซ็ต cooldown
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          // ตรวจสอบว่าอยู่ในต้นไม้ของวิดเจ็ตหรือไม่
          setState(() {
            _isCooldown = false; // รีเซ็ต cooldown
          });
        }
      });
    } else {
      wishlistProvider.addToWishlist(widget.plant);

      // ปิด Snackbar ก่อนหน้า
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${widget.plant.name} ถูกเพิ่มไปยังรายการโปรดของคุณแล้ว!',
            style: const TextStyle(fontSize: 18),
          ),
          duration: const Duration(seconds: 1),
        ),
      );

      // เริ่ม cooldown
      setState(() {
        _isCooldown = true; // ตั้งค่า cooldown
      });

      // เรียกใช้ Future.delayed เพื่อรีเซ็ต cooldown
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          // ตรวจสอบว่าอยู่ในต้นไม้ของวิดเจ็ตหรือไม่
          setState(() {
            _isCooldown = false; // รีเซ็ต cooldown
          });
        }
      });
    }
  }
}
