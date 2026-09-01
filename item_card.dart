import 'package:flutter/material.dart';

import 'package:flutter_application_1/hive/cart_manager.dart';
import 'package:hive_ce_flutter/adapters.dart';

class ItemCard extends StatefulWidget {
  final String name;
  final String qty;
  final double price;
  final String image;
  const ItemCard({
    super.key,
    required this.name,
    required this.qty,
    required this.price,
    required this.image,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  final Box<CartManager> cartbox = Hive.box('cart');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 248,
      width: 173,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffFFFFFF),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 14),
            Center(child: Image.asset(widget.image, height: 80, width: 100)),
            SizedBox(height: 30),
            Text(
              widget.name,
              style: TextStyle(fontSize: 16, fontWeight: .bold),
            ),
            SizedBox(height: 3),
            Text(
              widget.qty,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff7C7C7C),
                fontWeight: .w400,
              ),
            ),
            Row(
              children: [
                Text(
                  '\$${widget.price}',
                  style: TextStyle(fontSize: 18, fontWeight: .w600),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    cartbox.add(
                      CartManager(
                      name: widget.name,
                      image: widget.image,
                      price: widget.price,
                      qty: widget.qty,
                    )
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${widget.name} added to cart!'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xff53B175),
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
