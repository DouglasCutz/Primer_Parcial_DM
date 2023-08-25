import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Usuario',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crea tu cuenta'),
      ),
      body: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? _selectedCarrera;

  List<String> _carreras = [
    'Ingeniería en Sistemas',
    'Ingeniería en Electrónica',
    'Medicina',
    'Otra Carrera'
  ];

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Color(0xFF6750A4)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Color(0xFF6750A4), width: 2.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _nicknameController,
            decoration: _inputDecoration('Nickname'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: _inputDecoration('Correo'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: _inputDecoration('Contraseña'),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedCarrera,
            onChanged: (newValue) {
              setState(() {
                _selectedCarrera = newValue;
              });
            },
            items: _carreras.map((carrera) {
              return DropdownMenuItem<String>(
                value: carrera,
                child: Text(carrera),
              );
            }).toList(),
            decoration: _inputDecoration('Carrera'),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Aquí puedes realizar la lógica de registro o navegación
                // a la siguiente pantalla.
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF6750A4),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Aún más redondeado
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0), // Espacio interno
                child: Text(
                  'Siguiente',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {
              // Aquí puedes implementar la navegación a la pantalla de inicio de sesión.
            },
            child: Text(
              '¿Ya tienes cuenta? Inicia sesión',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
