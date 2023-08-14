import 'package:flutter/material.dart';
import 'package:penmyplan/add_item_widget.dart';
import 'package:penmyplan/notifier.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    double totalAmount = 0;
    for (var cartItem in cart.items) {
      totalAmount += cartItem.item.price! * cartItem.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final cartItem = cart.items[index];
          final salad = cartItem.item;

          return ListTile(
            title: Text(salad.name!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            subtitle: Text(salad.description!),
            trailing: SizedBox(
              width: 120,
              child: AddItemWidget(
                key: Key(cartItem.item.name!),
                itemCount: cartItem.quantity,
                onMinus: () {
                  cart.removeFromCart(salad);
                },
                onPlus: () {
                  cart.addToCart(salad);
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
