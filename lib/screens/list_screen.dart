import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppinglist/providers/auth_provider.dart';
import 'package:flutter_shoppinglist/screens/login_screen.dart';
import 'package:flutter_shoppinglist/theme/app_theme.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (!authProvider.loggedIn) {
      return LoginScreen();
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
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
        title: Text('Lista de la compra'),
      ),
      body: Card(
        elevation: 10,
        margin: EdgeInsets.all(8),
        color: AppTheme.backgroundColor,
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) => Column(
            children: [
              Text(authProvider.loggedIn.toString()),
              ListTile(
                leading: Icon(Icons.check_box),
                title: Text('hola'),
                trailing: Icon(Icons.edit),
              ),
              Divider()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'form'),
        child: Icon(
          Icons.add_outlined,
          size: 34,
        ),
      ),

      // ),
    );
  }
}
