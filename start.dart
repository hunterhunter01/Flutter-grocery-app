import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_screen.dart';
import 'package:flutter_application_1/item_card.dart';
import 'package:flutter_application_1/see_all_screen.dart';

class Start extends StatelessWidget {
  Start({super.key});
  final List<Map<String, dynamic>> offer = [
    {
      'name': 'Organic Bananas',
      'price': 2.99,
      'qty': '7pcs',
      'image': 'lib/assets/banana.png',
    },
    {
      'name': 'Red Apple',
      'price': 3.49,
      'qty': '1kg',
      'image': 'lib/assets/apple.png',
    },
    {
      'name': 'Diet Coke',
      'price': 1.99,
      'qty': '355ml',
      'image': 'lib/assets/dietcoca.png',
    },
    {
      'name': 'beef',
      'price': 4.99,
      'qty': '1kg',
      'image': 'lib/assets/beef.png',
    },
  ];

  final List<Map<String, dynamic>> trending = [
    {
      'name': 'Bell Pepper Red',
      'price': 4.99,
      'qty': '1kg',
      'image': 'lib/assets/ch.png',
    },
    {
      'name': 'Ginger',
      'price': 2.99,
      'qty': '250gm',
      'image': 'lib/assets/ginger.png',
    },
    {
      'name': 'Egg Chicken Red',
      'price': 1.99,
      'qty': '4pcs',
      'image': 'lib/assets/egg.png',
    },
    {
      'name': 'Pepsi Can',
      'price': 4.99,
      'qty': '330ml',
      'image': 'lib/assets/pepsi.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE5E5E5),
        centerTitle: true,
        title: Image.asset('lib/assets/Group (1).png'),
      ),
      body: Container(
        color: Color(0xffE5E5E5),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .center,
                spacing: 3,
                children: [
                  Icon(Icons.location_on_sharp, color: Color(0xff4C4F4D)),
                  Text(
                    'Egypt, Cairo',
                    style: TextStyle(
                      color: Color(0xff4C4F4D),
                      fontSize: 18,
                      fontWeight: .w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    height: 52,
                    width: 364,
                    decoration: BoxDecoration(
                      borderRadius: .circular(15),
                      color: Color(0xffF2F3F2),
                    ),
                    child: Row(
                      spacing: 9,
                      children: [
                        SizedBox(width: 8),
                        Icon(Icons.search_sharp, color: Color(0xff181B19)),
                        Text(
                          'Search Store',
                          style: TextStyle(fontSize: 14, fontWeight: .w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Image.asset('lib/assets/banner.png'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Exclusive Offer',
                      style: TextStyle(fontSize: 22, fontWeight: .w600),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          (context),
                          MaterialPageRoute(
                            builder: (context) => SeeAllScreen(
                              items: offer,
                              title: 'Exclusive Offer',
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xff53B175),
                          fontSize: 16,
                          fontWeight: .w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 248,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (context, index) => ItemCard(
                    name: offer[index]['name'],
                    qty: offer[index]['qty'],
                    price: offer[index]['price'],
                    image: offer[index]['image'],
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 15),
                  itemCount: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Best Selling',
                      style: TextStyle(fontSize: 22, fontWeight: .w600),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push((context),
                          MaterialPageRoute(
                            builder: (context) => SeeAllScreen(
                              items: trending,
                              title: 'Best Selling',
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xff53B175),
                          fontSize: 16,
                          fontWeight: .w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 248,
                child: ListView.separated(
                  itemBuilder: (context, index) => ItemCard(
                    name: trending[index]['name'],
                    qty: trending[index]['qty'],
                    price: trending[index]['price'],
                    image: trending[index]['image'],
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 15),
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff53B175),
        foregroundColor: Colors.white,
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        },
      ),
    );
  }
}
