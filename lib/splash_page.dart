import 'package:flutter/material.dart';
import 'package:loginpage/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    navigateToLoginScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity, //get entire scrren
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            width: 150,
            child: Image.asset('assets/laco.png'),
          ),

          // Container(
          //   child: ElevatedButton(
          //       onPressed: () {
          //         Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //               builder: (BuildContext context) => LoginPage()),
          //           //ModalRoute.withName('/'),
          //         );
          //       },
          //       child: Text('push and remove until')),
          // ),
        ],
      ),
    );
  }

// Navigate to the login screen with 3 seconds...
  void navigateToLoginScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }
}
