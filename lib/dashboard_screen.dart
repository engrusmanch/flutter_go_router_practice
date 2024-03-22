import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/constants.dart';
import 'package:go_router_practice/navigation_helper.dart';

class DashboardScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const DashboardScreen({super.key, required this.navigationShell});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Define your screens here
  List<Widget> _widgetOptions = <Widget>[
    // Add your screens or tabs here
    Column(
      children: [
        Text('Sign In'),
        ElevatedButton(
            onPressed: () {
              CustomNavigationHelper.router.go(signUpPath);
            },
            child: Text("Go Sign Up")),
        ElevatedButton(
            onPressed: () {
              CustomNavigationHelper.router.go(changePasswordPath);
            },
            child: Text("Go Change Password")),
      ],
    ),
    Column(
      children: [
        Text('Sign Up'),
        ElevatedButton(
            onPressed: () {
              CustomNavigationHelper.router.push(signInPath);
            },
            child: Text("Push Sign In")),
        ElevatedButton(
            onPressed: () {
              CustomNavigationHelper.router.push(changePasswordPath);
            },
            child: Text("Push Change Password")),
      ],
    ),
    Column(
      children: [
        Text('Change Password'),
        ElevatedButton(
            onPressed: () {
              CustomNavigationHelper.router.push(signInPath);
            },
            child: Text("Push Sign In")),
        ElevatedButton(
            onPressed: () {
              CustomNavigationHelper.router.push(signUpPath);
            },
            child: Text("Push Sign Up")),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
      ),
      body: Center(
        child: widget.navigationShell,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login_outlined),
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Sign Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Change Password',
          ),
        ],
        currentIndex: widget.navigationShell.currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          widget.navigationShell.goBranch(
            index,
            initialLocation: index == widget.navigationShell.currentIndex,
          );
          setState(() {});
        },
      ),
    );
  }
}
