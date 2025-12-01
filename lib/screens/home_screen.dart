import 'package:flutter/material.dart';
import 'package:equilibrio_mental/theme.dart';
import 'package:equilibrio_mental/data.dart';
import 'package:equilibrio_mental/screens/appointments_screen.dart';
import 'package:equilibrio_mental/screens/resources_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  
    if (index == 1) {
       Navigator.push(context, MaterialPageRoute(builder: (context) => const AppointmentsScreen()));
    } else if (index == 2) {
       Navigator.push(context, MaterialPageRoute(builder: (context) => const ResourcesScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text("Hola usuario!"), 
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.primaryColor, AppTheme.primaryColor.withOpacity(0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))],
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Proxima sesion", style: TextStyle(color: Colors.white70, fontSize: 14)),
                      SizedBox(height: 4),
                      Text("Hoy, 5:00 PM", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("Dr. Roberto Martínez", style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            
            const Text("Que necesitas hoy?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionCard(context, "Agendar cita", Icons.add_circle_outline, Colors.blue, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AppointmentsScreen()));
                }),
                _buildActionCard(context, "Recursos", Icons.library_books_outlined, Colors.orange, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ResourcesScreen()));
                }),
                _buildActionCard(context, "Emergencia", Icons.phone_in_talk, Colors.red, () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Contactando unidad de crisis.....")));
                }),
              ],
            ),

            const SizedBox(height: 24),
            
            const Text("Especialistas disponibles", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doc = doctors[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.accentColor,
                      child: Icon(Icons.person, color: AppTheme.primaryColor),
                    ),
                    title: Text(doc.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(doc.specialty),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const AppointmentsScreen()));
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Citas"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Recursos"),
        ],
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}