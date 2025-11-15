import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'product_page.dart';
import 'contact_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardPage(),
    const ProductPage(),
    const ContactPage(),
    const ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: 'Dashboard',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Produk',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.contacts),
      label: 'Kontak',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas UI/UX Flutter'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: _bottomNavItems,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey.shade600,
      ),
    );
  }
}