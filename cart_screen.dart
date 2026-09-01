import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_item.dart';
import 'package:flutter_application_1/hive/cart_manager.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Box<CartManager> cartmanage = Hive.box('cart');

  double getTotalPrice() {
    double total = 0;

    for (var item in cartmanage.values) {
      total += item.price * item.iqty;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 20, fontWeight: .w700),
        ),
      ),
      body: cartmanage.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18, fontWeight: .w500),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final item = cartmanage.getAt(index)!;
                      return CartItem(
                        image: item.image,
                        name: item.name,
                        qty: item.qty,
                        price: item.price,
                        ondelete: () {
                          cartmanage.deleteAt(index);
                          setState(() {});
                        },
                        oninc: () {
                          item.iqty++;
                          setState(() {
                            
                          });
                        },
                        ondec: () {
                          item.iqty--;
                          setState(() {
                            
                          });
                        },
                        iqty: item.iqty,
                      );
                    },
                    itemCount: cartmanage.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xff53B175),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            'Go to Checkout',
                            style: TextStyle(fontSize: 18),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: .rectangle,
                              color: Color(0xff489E67),
                            ),
                            child: Text(
                              '\$${getTotalPrice().toStringAsFixed(2)}',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
