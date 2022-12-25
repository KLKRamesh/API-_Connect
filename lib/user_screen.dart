import 'package:flutter/material.dart';
import 'package:loginpage/user.dart';

class UserScreen extends StatefulWidget {
  final User user;
  const UserScreen({super.key, required this.user});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipOval(
                child: Image.network(
                  widget.user.image,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Container(
              child: Center(
                  child: Text(
                widget.user.name,
                style: const TextStyle(fontSize: 25, color: Colors.black),
              )),
            ),
            Container(
              child: Center(
                  child: Text(
                widget.user.city,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
