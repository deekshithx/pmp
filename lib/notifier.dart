import 'package:flutter/material.dart';
import 'package:penmyplan/item_model.dart';

class CartModel extends ChangeNotifier {
  var preDefinedItems = [
    ItemModel(
      name: 'The Mixed Green Salad',
      description:
          'A refreshing mix of lettuce, spinach, arugula, and other greens with a tangy vinaigrette.',
      imageUrl:
          'https://cdn.loveandlemons.com/wp-content/uploads/2019/07/salad.jpg',
      price: 14.20,
    ),
    ItemModel(
      name: 'Green Salad',
      description:
          'A simple green salad with fresh lettuce, cucumber, and a zesty lemon dressing.',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_1280.jpg',
      price: 13.10,
    ),
    ItemModel(
      name: 'Cucumber Salad',
      description:
          'Cool and refreshing cucumber slices mixed with cherry tomatoes, red onion, and dill.',
      imageUrl:
          'https://bellyfull.net/wp-content/uploads/2023/04/Cucumber-Tomato-Salad-blog-1.jpg',
      price: 12.60,
    ),
    ItemModel(
      name: 'Fruit Salad',
      description:
          'A delightful medley of fresh seasonal fruits including berries, melon, and citrus.',
      imageUrl:
          'https://www.countryhillcottage.com/wp-content/uploads/2022/03/Condensed_Milk_Fruit_Salad-15.jpg',
      price: 10.00,
    ),
    ItemModel(
      name: 'Chicken Caesar Salad',
      description:
          'Grilled chicken breast, crisp romaine lettuce, croutons, and parmesan cheese, topped with Caesar dressing.',
      imageUrl:
          'https://www.theendlessmeal.com/wp-content/uploads/2019/11/Chicken-Salad-4.jpg',
      price: 16.50,
    ),
  ];
  final List<CartItem> items = [];

  void addToCart(ItemModel item) {
    try {
      final existingCartItem =
          items.firstWhere((cartItem) => cartItem.item == item);
      existingCartItem.quantity++;
    } catch (e) {
      items.add(CartItem(item: item, quantity: 1));
    }
    notifyListeners();
  }

  void removeFromCart(ItemModel item) {
    final existingCartItem = items.firstWhere(
      (cartItem) => cartItem.item == item,
    );

    if (existingCartItem.quantity > 1) {
      existingCartItem.quantity--;
    } else {
      items.remove(existingCartItem);
    }
    notifyListeners();
  }
}
