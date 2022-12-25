import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        // leading: Icon(
        //   Icons.account_balance,
        //   color: Colors.white,
        // ),
      ),
      body: Container(

          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(10),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.withOpacity(0.4),
          //         blurRadius: 2.0,
          //         spreadRadius: 3.0,
          //       )
          //     ]),

          // width: 200,
          // height: 100,
          // child: Center(child: Image.asset('assets/laco.png')
          //     //Image.network(
          //     //'https://assets.stickpng.com/thumbs/58429f65a6515b1e0ad75aed.png',
          //     //width: 200,
          //     //height: 100,
          //     //),
          //     ),

          // // child: const Text('Login Page', style: TextStyle(
          // //   color: Colors.black,
          // //   fontSize: 20,

          // // ),),
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              width: 150,
              child: Image.asset('assets/laco.png'),
            ),

            // text form field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        print(value);
                      },
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your username',
                          hintText: 'username'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your password',
                          hintText: 'password'),
                    ),
                  ),
                ],
              ),
            ),

            //Login button

            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: 200,
              child: ElevatedButton(
                  onPressed: loginButtonClick,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      )),
    );
  }

  void loginButtonClick() {
    //  print('Login button click');

    if (_usernameController.text == 'user123' &&
        _passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
      );

      print('Login success');
    } else {
      print('Login fail');
      showAlertDialog(context);
    }
  }
// Alert dialog (Wrong login credentials)....

  showAlertDialog(BuildContext context) {
    Widget okButton = ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'));
    AlertDialog alertDialog = AlertDialog(
      title: const Text('Error'),
      content: const Text('Wrong username and password'),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
