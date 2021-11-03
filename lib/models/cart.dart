import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

//Singleton class
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  // ignore: unused_field
  final List<int> _itemIds = [];

  // ignore: unnecessary_getters_setters
  CatalogModel get catalog {
    return _catalog;
  }

  // ignore: unnecessary_getters_setters
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
