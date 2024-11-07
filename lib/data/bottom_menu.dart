class BottomMenu {
  final int id;
  final String imagePath;
  final String title; // เพิ่ม property title สำหรับชื่อของหน้า

  const BottomMenu(
      {required this.id, required this.imagePath, required this.title});
}

List<BottomMenu> bottomMenu = const [
  BottomMenu(id: 0, imagePath: 'assets/icons/home.png', title: 'หน้าหลัก'),
  BottomMenu(id: 1, imagePath: 'assets/icons/heart.png', title: 'รายการโปรด'),
  BottomMenu(id: 2, imagePath: 'assets/icons/info.jpg', title: 'ช่วยเหลือ'),
  BottomMenu(id: 3, imagePath: 'assets/icons/credit.png', title: 'เครดิต'),
];
