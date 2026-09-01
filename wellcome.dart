import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart';


class Wellcome extends StatelessWidget {
  const Wellcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('lib/assets/8140 1.png',fit: .cover,)),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: .end,
              children: [
                Image.asset('lib/assets/Group.png'),
                SizedBox(height: 10,),
                Text('  Welcome \nto our store',style: TextStyle(fontSize: 45,fontWeight: .w400,color: Colors.white,height: 1.2),),
                SizedBox(height: 7,),
                Text('Ger your groceries in as fast as one hour',style: TextStyle(fontSize: 16,color: Colors.white70),),
                SizedBox(height: 40,),
                ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                style:ElevatedButton.styleFrom(backgroundColor: Color(0xff53B175),fixedSize: Size(353, 67) ),
                child: Text('Get Started',style: TextStyle(fontSize: 18,color: Colors.white),)
                ),
                SizedBox(height: 90,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
