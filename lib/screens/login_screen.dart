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
              const SizedBox(height: 16),
              
              
              const Text(
                "Síguenos en redes sociales",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              
              
              _buildSocialCard(
                logoWidget: const Icon(Icons.facebook, color: Colors.white, size: 22),
                label: "Equilibrio Mental",
                subtitle: "Facebook",
                color: const Color(0xFF1877F2),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              
              
              _buildSocialCard(
                logoWidget: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFCAF45), Color(0xFFE1306C), Color(0xFF833AB4)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 14),
                  ),
                ),
                label: "Equilibrio Mental",
                subtitle: "Instagram",
                color: const Color(0xFFE1306C),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              
              
              _buildSocialCard(
                logoWidget: const Text(
                  "𝕏",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                label: "Equilibrio Mental",
                subtitle: "X (Twitter)",
                color: Colors.black,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialCard({
    required Widget logoWidget,
    required String label,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: logoWidget),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.7), size: 16),
          ],
        ),
      ),
    );
  }
}