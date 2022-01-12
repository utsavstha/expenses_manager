import '../../constants.dart';
import '../components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14))),
                padding: const EdgeInsets.all(8),
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Expenses Tracker',
                      style: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: SvgPicture.asset('assets/saving_illustration.svg',
                          height: 150),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Login to your account',
                      style: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Email',
                      style: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700),
                    ),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'name@domain.com',
                          hintStyle: TextStyle(
                              fontFamily: 'GTWalsheimPro',
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Password',
                      style: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700),
                    ),
                    const TextField(
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: '*******',
                          hintStyle: TextStyle(
                              fontFamily: 'GTWalsheimPro',
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                        title: "Sign In", color: primaryColor, onPress: null),
                    const SizedBox(height: 30),
                    const Center(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontFamily: 'GTWalsheimPro',
                            fontSize: 14,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
