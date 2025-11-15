import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        backgroundColor: Colors.green.shade700,
      ),
      body: const ProductGrid(),
    );
  }
}