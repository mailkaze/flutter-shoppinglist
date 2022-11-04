import 'package:flutter/material.dart';

class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
            icon: Icon(Icons.account_circle),
            iconSize: 38,
          )
        ],
        title: Text('Formulario de Producto'),
      ),
      body: Center(
        child: Text('ProductFormScreen'),
      ),
    );
  }
}
