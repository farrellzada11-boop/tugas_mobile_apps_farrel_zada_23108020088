import 'package:flutter/material.dart';
import '../widgets/contact_list.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kontak'),
        backgroundColor: Colors.orange.shade700,
      ),
      body: const ContactList(),
    );
  }
}