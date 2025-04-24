import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Continue Shopping',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
      )),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Text(
                ' No Product added in your cart',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
