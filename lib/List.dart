import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Publicaciones"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator()); // Centrando el indicador de carga
          }
          final posts = snapshot.data?.docs;
          return ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Margen para los cards
                child: ListTile(
                  title: Text(
                    posts?[index]['title'],
                    style: TextStyle(fontWeight: FontWeight.bold), // Título en negrita
                  ),
                  subtitle: Text(
                    posts![index]['scheduledDate'],
                    style: TextStyle(color: Colors.grey[700]), // Color gris para la fecha
                  ),
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: posts[index],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create'),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue, // Color del botón flotante
      ),
    );
  }
}
