import 'package:flutter/material.dart';


class Doctor {
  final String name;
  final String specialty;
  final String imagePath; 
  final double rating;

  Doctor(this.name, this.specialty, this.imagePath, this.rating);
}


final List<Doctor> doctors = [
  Doctor("Dr. Roberto Martínez", "Psiquiatria clinica", "assets/doc1.png", 4.8),
  Doctor("Lic. Laura Sánchez", "Psicologia cognitiva", "assets/doc2.png", 4.9),
  Doctor("Dr. Miguel Ángel", "Terapia de pareja", "assets/doc3.png", 4.7),
  Doctor("Lic. Ana Torres", "Psicologia infantil", "assets/doc4.png", 4.9),
];


final List<Map<String, dynamic>> selfHelpResources = [
  {
    "title": "Manejo de ansiedad",
    "type": "Articulo",
    "icon": Icons.article,
    "color": Colors.orangeAccent
  },
  {
    "title": "Respiracion guiada",
    "type": "Audio",
    "icon": Icons.headphones,
    "color": Colors.blueAccent
  },
  {
    "title": "Prevencion del burnout",
    "type": "Video",
    "icon": Icons.play_circle_fill,
    "color": Colors.redAccent
  },
  {
    "title": "Dormir mejor",
    "type": "Guia",
    "icon": Icons.bed,
    "color": Colors.indigoAccent
  },
];