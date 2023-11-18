class MenuItem {
  final String id;
  final String name;
  final String price;

  MenuItem({
    required this.id,
    required this.name,
    required this.price,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}