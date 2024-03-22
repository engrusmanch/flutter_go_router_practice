import 'package:flutter/material.dart';
import 'package:go_router_practice/constants.dart';
import 'package:go_router_practice/navigation_helper.dart';



class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Change Password"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Change Password"),
          TextButton(onPressed: (){
            CustomNavigationHelper.router.go(cartPath);
          }, child: Text("Go to Cart")),
          TextButton(onPressed: (){
            CustomNavigationHelper.router.go(signInPath);
          }, child: Text("Go to Sign In")),
          TextButton(onPressed: (){
            CustomNavigationHelper.router.go(signUpPath);
          }, child: Text("Go to Sign Up")),
          TextButton(onPressed: (){
            CustomNavigationHelper.router.go(changePasswordPath);
          }, child: Text("Go to Change Password"))
        ],),
    );
  }
}
