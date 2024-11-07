class Plants {
  final int id;
  final String name;
  final String imagePath;
  final String category;
  final String description;
  final String country; // เพิ่มประเทศ

  Plants({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.category,
    required this.description,
    required this.country, // เพิ่มประเทศใน constructor
  });
}
