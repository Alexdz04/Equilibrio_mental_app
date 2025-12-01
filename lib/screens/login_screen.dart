import 'package:flutter/material.dart';
import 'package:equilibrio_mental/screens/home_screen.dart'; 
import 'package:equilibrio_mental/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void _login() {
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              Icon(Icons.self_improvement, size: 100, color: AppTheme.primaryColor),
              const SizedBox(height: 16),
              Text(
                "EQUILIBRIO MENTAL",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.secondaryColor,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Hospital general Dr. Vinicio Calventi",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 48),
              
            
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Correo electronico",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              const SizedBox(height: 24),
              
              ElevatedButton(
                onPressed: _login,
                child: const Text("INGRESAR", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: const Text("No tienes una cuenta? Registrate aqui (Demo)"),
              ),
              
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              const Text("Acceso corporativo y staff", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),),
            ],
          ),
        ),
      ),
    );
  }
}