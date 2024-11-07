import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // นำเข้า Provider
import 'package:ui_13/page/wishlist_provider.dart'; // นำเข้า WishlistProvider
import 'package:ui_13/page/details_page.dart'; // นำเข้า DetailsPage

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistItems = Provider.of<WishlistProvider>(context).wishlistItems;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // ปิดการแสดงปุ่ม back
        title: const Text(
          'รายการโปรด',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.green, // สีของ AppBar
      ),
      body: wishlistItems.isEmpty
          ? const Center(
              child: Text(
                "ไม่พบรายการโปรดของคุณ",
                style: TextStyle(fontSize: 24),
              ),
            )
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistItems[index];
                final truncatedDescription =
                    item.description.length > 40 // กำหนดความยาวของตัวอักษร
                        ? '${item.description.substring(0, 40)}...'
                        : item.description;

                return ListTile(
                  leading: InkWell(
                    onTap: () {
                      // เมื่อกดที่รูปภาพ จะไปยังหน้า DetailsPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(plant: item),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        width: 100.0,
                        height: 200.0,
                        child: Image.asset(
                          item.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 20.0, // กำหนดขนาดตัวอักษร
                    ),
                  ),
                  subtitle: InkWell(
                    onTap: () {
                      // เมื่อกดที่ see more จะไปยังหน้า DetailsPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(plant: item),
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        text: truncatedDescription,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        children: item.description.length > 50
                            ? [
                                const TextSpan(
                                  text: ' อ่านเพิ่มเติม',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ]
                            : [],
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "คุณต้องการที่จะลบ ${item.name} ออกจากรายการโปรด ใช่หรือไม่?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'ไม่ใช่',
                                style: TextStyle(
                                  fontSize: 20.0, // กำหนดขนาดตัวอักษร
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // ทำการลบรายการจาก Wishlist
                                Provider.of<WishlistProvider>(context,
                                        listen: false)
                                    .removeFromWishlist(item);

                                Navigator.of(context).pop(); // ปิด dialog

                                // แสดง SnackBar เพื่อแจ้งผู้ใช้ว่าได้ทำการลบรายการแล้ว
                                Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "ลบรายการสำเร็จ!",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        duration: Duration(
                                            seconds: 1), // แสดง 1 วินาที
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'ใช่',
                                style: TextStyle(
                                  fontSize: 20.0, // กำหนดขนาดตัวอักษร
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
