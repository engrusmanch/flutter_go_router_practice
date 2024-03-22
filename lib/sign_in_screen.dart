import 'package:flutter/material.dart';
import 'package:go_router_practice/constants.dart';
import 'package:go_router_practice/navigation_helper.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Sign In"),
          TextButton(onPressed: () {
            CustomNavigationHelper.router.pushReplacement(cartPath);
          }, child: Text("Push Replace to Cart")),
          TextButton(onPressed: () {
            CustomNavigationHelper.router.pushReplacement(signInPath);
          }, child: Text("Push Replace to Sign In")),
          TextButton(onPressed: () {
            CustomNavigationHelper.router.pushReplacement(signUpPath);
          }, child: Text("Push Replace to Sign Up")),
          TextButton(onPressed: () {
            CustomNavigationHelper.router.pushReplacement(changePasswordPath);
          }, child: Text("Push Replace to Change Password"))
        ],
      ),
    );
  }
}
