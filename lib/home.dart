import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gestor de Publicaciones")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Dos cuadros por fila
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildSocialMediaCard(
              context,
              'Facebook',
              'images/facebook_logo.png', // Asegúrate de que el logo exista
            ),
            _buildSocialMediaCard(
              context,
              'WhatsApp',
              'images/whatsapp_logo.png', // Asegúrate de que el logo exista
            ),
            _buildSocialMediaCard(
              context,
              'Instagram',
              'images/instagram_logo.png', // Asegúrate de que el logo exista
            ),
            _buildSocialMediaCard(
              context,
              'TikTok',
              'images/tiktok_logo.jpg', // Asegúrate de que el logo exista
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Listado"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Crear"),
        ],
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/list');
          else if (index == 1) Navigator.pushNamed(context, '/create');
        },
      ),
    );
  }

  Widget _buildSocialMediaCard(BuildContext context, String name, String logoPath) {
    return GestureDetector(
      onTap: () {
        // Navega a la pantalla de crear publicación
        Navigator.pushNamed(context, '/create');
      },
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logoPath,
              height: 60, // Ajusta la altura del logo
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
