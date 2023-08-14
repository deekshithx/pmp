class ItemModel {
  String? name;
  String? description;
  String? imageUrl;
  double? price;

  ItemModel(
      {required this.name,
      required this.description,
      required this.imageUrl,
      required this.price});
}

class CartItem {
  final ItemModel item;
  int quantity;

  CartItem({required this.item, required this.quantity});
}
