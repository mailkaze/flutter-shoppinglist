import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppinglist/firebase_options.dart';
import 'package:flutter_shoppinglist/providers/auth_provider.dart';
import 'package:flutter_shoppinglist/screens/list_screen.dart';
import 'package:flutter_shoppinglist/screens/login_screen.dart';
import 'package:flutter_shoppinglist/screens/product_form_screen.dart';
import 'package:flutter_shoppinglist/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
          lazy: false,
        )
      ],
      child: ShoppingListApp(),
    );
  }
}

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mailkazes\'s Shopping List',
      theme: AppTheme.lightTheme,
      initialRoute: 'list',
      routes: {
        'list': (context) => ListScreen(),
        'login': (context) => LoginScreen(),
        'form': (context) => ProductFormScreen(),
      },
    );
  }
}
