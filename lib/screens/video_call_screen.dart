import 'package:flutter/material.dart';
import 'package:equilibrio_mental/theme.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 80, color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text("Conectando con Dr. Martínez.....", style: TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 10),
                const CircularProgressIndicator(color: AppTheme.primaryColor),
              ],
            ),
          ),
          
          
          Positioned(
            top: 50,
            right: 20,
            child: Container(
              width: 100,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Center(child: Icon(Icons.videocam_off, color: Colors.white)),
            ),
          ),

   
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildControlBtn(Icons.mic_off, Colors.white, Colors.grey.shade700),
                _buildControlBtn(Icons.call_end, Colors.white, Colors.red, onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sesion finalizada")));
                }),
                _buildControlBtn(Icons.videocam, Colors.white, Colors.grey.shade700),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlBtn(IconData icon, Color iconColor, Color bgColor, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: bgColor,
        child: Icon(icon, color: iconColor, size: 28),
      ),
    );
  }
}