import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'email': 'mailkaze@gmail.com',
      'password': '',
      'password2': '',
    };

    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text('Cuenta de usuario'),
      ),
      body: SingleChildScrollView(
          child: Form(
              child: Column(
        children: [
          TextFormField(
              // textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              onChanged: (value) => formValues['email'] = value,
              validator: (value) {
                if (value == null) return 'Este campo es requerido.';
                return value.length < 3 ? 'Mínimo 3 letras' : null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              )),
          TextFormField(
              // textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (value) => formValues['password'] = value,
              validator: (value) {
                if (value == null) return 'Este campo es requerido.';
                return value.length < 3 ? 'Mínimo 3 letras' : null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
              )),
          ElevatedButton(
            onPressed: () async {
              try {
                final credential =
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: formValues['email'].toString(),
                  password: formValues['password'].toString(),
                );
                Navigator.of(context).pushNamedAndRemoveUntil(
                    'list', (Route<dynamic> route) => false);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              } catch (error) {
                print('error: $error');
              }
            },
            child: const SizedBox(
              width: double.infinity,
              child: Center(
                child: Text('Guardar'),
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
