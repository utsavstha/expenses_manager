import '../../constants.dart';
import '../components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                      'Sign In',
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
                      'Forgot your password?',
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
                    PrimaryButton(
                        title: "Submit", color: primaryColor, onPress: null),
                    const SizedBox(height: 30),
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
