import 'package:flutter/material.dart';
import 'package:go_router_practice/constants.dart';
import 'package:go_router_practice/navigation_helper.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Sign Up"),
          TextButton(
              onPressed: () {
                CustomNavigationHelper.router.pushNamed(cartPath);
              },
              child: Text("Push to Cart")),
          TextButton(
              onPressed: () {
                CustomNavigationHelper.router.push(signInPath);
              },
              child: Text("Push to Sign In")),
          TextButton(
              onPressed: () {
                CustomNavigationHelper.router.push(signUpPath);
              },
              child: Text("Push to Sign Up")),
          TextButton(
              onPressed: () {
                CustomNavigationHelper.router.push(changePasswordPath);
              },
              child: Text("Push to Change Password"))
        ],
      ),
    );
  }
}
