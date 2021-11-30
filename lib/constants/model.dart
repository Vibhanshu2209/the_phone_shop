class Item {
  final int id;
  final String name;
  final String manufacture;
  final int price;
  final String color;
  final String url;

  Item(
      {required this.id,
      required this.name,
      required this.manufacture,
      required this.price,
      required this.color,
      required this.url});

  factory Item.fromMap(Map<String, dynamic> json) {
    return Item(
      id: json["id"],
      name: json["name"],
      manufacture: json["desc"],
      price: json["price"],
      color: json["color"],
      url: json["image"],
    );
  }
}

class CatalogModel {
  //mark the class as singleton
  static final catamodel = CatalogModel._single();
  CatalogModel._single();
  factory CatalogModel() => catamodel;

  static List<Item> products = [];

  Item getById(int id) => products.firstWhere((e) => e.id == id);
  Item getByPos(pos) => products[pos];
}
