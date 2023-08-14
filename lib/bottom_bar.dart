import 'package:flutter/material.dart';
import 'package:penmyplan/notifier.dart';
import 'package:penmyplan/summary_screen.dart';

class BottomBarWidget extends StatelessWidget {
  final CartModel cart;

  const BottomBarWidget({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    int totalQuantity = 0;

    for (final cartItem in cart.items) {
      totalPrice += cartItem.item.price! * cartItem.quantity;
      totalQuantity += cartItem.quantity;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.shopping_cart_outlined),
          Text(
            '$totalQuantity Items',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(),
          const SizedBox(),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: totalQuantity == 0
                  ? MaterialStateProperty.all(Colors.grey)
                  : MaterialStateProperty.all(Colors.green),
            ),
            onPressed: totalQuantity != 0
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SummaryScreen()),
                    );
                  }
                : null,
            child: Text(
              'Place Order ${totalPrice != 0 ? "\$${totalPrice.toStringAsFixed(2)}" : ''}',
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
