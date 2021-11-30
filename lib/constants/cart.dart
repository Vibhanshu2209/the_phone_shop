import 'package:the_phone_shop/constants/model.dart';

class CartModel {
  //mark the class as singleton
  static final cartmodel = CartModel._single();
  CartModel._single();
  factory CartModel() => cartmodel;

  CatalogModel? _catalog;

  final List<int> itemList = [];

  CatalogModel? get catalog => _catalog;

  set setCatalog(CatalogModel? newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => itemList.map((e) => _catalog!.getById(e)).toList();

  num get cartTotal => items.fold(0, (total, element) => total + element.price);

  add(Item item) => itemList.add(item.id);

  remove(Item item) => itemList.remove(item.id);
}
