import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    // Expresión regular para validar un correo electrónico
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null; // Si es válido, no devuelve ningún error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images.png',
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                    validator: validateEmail,
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Correo electrónico',
                        label: Text('Correo electrónico')),
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    label: const Text('Contraseña'),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ),
                ),
                const SizedBox(height: 50, width: double.infinity),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/correo');
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 37, 63, 77),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          )),
                      child: const Text('Iniciar sesión')),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    height: 20,
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/correo');
                        },
                        child: const Text(
                          'Recuperar contraseña',
                          style: TextStyle(
                              fontSize: 15.0,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 55, 55, 56)),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
