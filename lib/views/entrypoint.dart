import 'package:flutter/material.dart';
import 'package:merchant/views/payment/payment_screen.dart';

import 'home/home_screen.dart';
import 'inbox/inbox_screen.dart';
import 'profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const PaymentScreen(),
    const InboxScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: "Thanh toán"),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline), label: "Hộp thư"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Tài khoản"),
        ],
      ),
    );
  }
}
