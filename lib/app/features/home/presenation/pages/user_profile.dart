import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('User Profile'),
          ),
        ],
      ),
    );
  }
}
