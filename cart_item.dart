import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final String image;
  final String name;
  final String qty;
  final double price;
  final VoidCallback ondelete;
  final VoidCallback oninc;
  final VoidCallback ondec;
  final int iqty;

  const CartItem({
    super.key,
    required this.image,
    required this.name,
    required this.qty,
    required this.price,
    required this.ondelete,
    required this.oninc,
    required this.ondec, required this.iqty,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Image.asset(widget.image, width: 90, height: 90),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(fontSize: 16, fontWeight: .w700),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            widget.ondelete();
                          },
                          icon: Icon(Icons.close, color: Color(0xffB3B3B3)),
                        ),
                      ],
                    ),
                    Text(
                      widget.qty,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff7C7C7C),
                        fontWeight: .w400,
                      ),
                    ),
                    SizedBox(height: 13),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            widget.ondec();
                          },
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: .circular(17),
                              color: Color(0xffF0F0F0),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.remove, color: Color(0xffB3B3B3)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            '${widget.iqty}',
                            style: TextStyle(fontSize: 16, fontWeight: .w500),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            widget.oninc();
                          },
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: .circular(17),
                              color: Color(0xffE2E2E2),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.add, color: Color(0xff53B175)),
                          ),
                        ),

                        Spacer(),
                        Text(
                          '\$${(widget.price * widget.iqty).toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18, fontWeight: .w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
