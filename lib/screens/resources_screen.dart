import 'package:flutter/material.dart';
import 'package:equilibrio_mental/data.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recursos de bienestar")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: selfHelpResources.length,
        itemBuilder: (context, index) {
          final resource = selfHelpResources[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              onTap: (){},
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: resource['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(resource['icon'], color: resource['color'], size: 30),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(resource['title'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(resource['type'], style: TextStyle(color: Colors.grey.shade600)),
                        ],
                      ),
                    ),
                    const Icon(Icons.play_arrow_rounded, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}