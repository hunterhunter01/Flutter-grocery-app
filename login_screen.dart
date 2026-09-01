import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_text_form.dart';
import 'package:flutter_application_1/start.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController numController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      body: SizedBox(
        width: double.infinity,
        //height: double.infinity,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Image.asset('lib/assets/601 1.png'),
            SizedBox(height: 49),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.5),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Get your groceries\nwith nectar',
                        style: TextStyle(fontSize: 26, fontWeight: .w500),
                      ),
                      SizedBox(height: 30),
                      CustomTextForm(
                        labelText: 'Mobile Number',
                        hintText: '+201008345505',
                        controller: numController,
                        keyboardType: .phone,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Mobile number cannot be empty';
                          }
                          RegExp numRegx = RegExp(
                            r'^(?:\+201|01|00201)[0-25][0-9]{8}$',
                          );
                          if (!numRegx.hasMatch(value)) {
                            return 'Enter a valid Egyptian phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      CustomTextForm(
                        labelText: 'Password',
                        hintText: 'Enter your Password',
                        controller: passController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Password canot be empty';
                          }
                          RegExp passRegx = RegExp(
                            r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
                          );
                          if (!passRegx.hasMatch(value)) {
                            return 'Password must be at least 8 characters and contain letters and number';
                          }
                          return null;
                        },
                        keyboardType: .visiblePassword,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Start()),
                          );
                        },
                        child: Text(
                          
                          'Skip Login',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Start()),
                            );
                          }
                        },
                        child: Container(
                          alignment: .center,
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: .circular(19),
                            color: Color(0xff53B175),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffFFF9FF),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
