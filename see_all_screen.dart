import 'package:flutter/material.dart';
import 'package:flutter_application_1/item_card.dart';

class SeeAllScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final String title;
  const SeeAllScreen({super.key, required this.items, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title,style: TextStyle(fontSize: 20,fontWeight: .w700),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) => ItemCard(
            name: items[index]['name'],
            qty: items[index]['qty'],
            price: items[index]['price'],
            image: items[index]['image'],
          ),
          itemCount: items.length,
        ),
      ),
    );
  }
}
