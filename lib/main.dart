import 'package:flutter/material.dart';
import 'package:penmyplan/bottom_bar.dart';
import 'package:penmyplan/item_model.dart';
import 'package:penmyplan/notifier.dart';
import 'package:penmyplan/salad_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Salad & Soups"),
      ),
      bottomNavigationBar: BottomBarWidget(cart: cart),
      body: SafeArea(
        child: ListView.builder(
          itemCount: cart.preDefinedItems.length,
          itemBuilder: (context, index) {
            final salad = cart.preDefinedItems[index];
            final cartItem = cart.items.firstWhere(
              (cartItem) => cartItem.item == salad,
              orElse: () => CartItem(item: salad, quantity: 0),
            );

            return SaladWidget(
              itemCount: cartItem.quantity,
              salad: salad,
              onMinus: () {
                cart.removeFromCart(salad);
              },
              onPlus: () {
                cart.addToCart(salad);
              },
            );
          },
        ),
      ),
    );
  }
}
