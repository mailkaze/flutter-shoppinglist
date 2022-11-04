import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppinglist/providers/auth_provider.dart';
import 'package:flutter_shoppinglist/screens/login_screen.dart';
import 'package:provider/provider.dart';

class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (!authProvider.loggedIn) {
      return LoginScreen();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              if (authProvider.loggedIn == true) {
                await FirebaseAuth.instance.signOut();
              }

              Navigator.of(context).pushNamedAndRemoveUntil(
                  'login', (Route<dynamic> route) => false);
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
