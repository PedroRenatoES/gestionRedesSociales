import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostFormScreen extends StatefulWidget {
  final DocumentSnapshot? post;

  PostFormScreen({this.post});

  @override
  _PostFormScreenState createState() => _PostFormScreenState();
}

class _PostFormScreenState extends State<PostFormScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? scheduledDate; // Para almacenar la fecha seleccionada
  String? selectedSocialMedia; // Para almacenar la red social seleccionada

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      titleController.text = widget.post!['title'];
      descriptionController.text = widget.post!['description'];
      scheduledDate = DateTime.parse(widget.post!['scheduledDate']);
      selectedSocialMedia = widget.post!['redSocial']; // Cargar red social si existe
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post == null ? "Crear Publicación" : "Editar Publicación"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alineación a la izquierda
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12),
              ),
              maxLines: 3, // Permitir múltiples líneas
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: _selectDateTime,
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Fecha y Hora Programada',
                    hintText: scheduledDate != null
                        ? DateFormat('dd MMMM yyyy, hh:mm:ss a').format(scheduledDate!)
                        : 'Seleccionar Fecha y Hora',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedSocialMedia,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSocialMedia = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Red Social',
                border: OutlineInputBorder(),
              ),
              items: <String>[
                'Facebook',
                'WhatsApp',
                'Instagram',
                'TikTok'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _savePost(context),
              child: Text("Guardar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Color del botón
                padding: EdgeInsets.symmetric(vertical: 12), // Espaciado vertical
                textStyle: TextStyle(fontSize: 16), // Tamaño de fuente
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDateTime() async {
    DateTime now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: scheduledDate ?? now,
      firstDate: now,
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(scheduledDate ?? now),
      );

      if (pickedTime != null) {
        // Combina la fecha y la hora seleccionadas
        scheduledDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {}); // Actualiza el estado para mostrar la fecha seleccionada
      }
    }
  }

  void _savePost(BuildContext context) async {
    final title = titleController.text;
    final description = descriptionController.text;
    String formattedDate = DateFormat('dd MMMM yyyy, hh:mm:ss a').format(scheduledDate ?? DateTime.now());

    if (widget.post == null) {
      await FirebaseFirestore.instance.collection('posts').add({
        'title': title,
        'description': description,
        'scheduledDate': formattedDate, // Guarda la fecha formateada
        'redSocial': selectedSocialMedia, // Guarda la red social seleccionada
      });
    } else {
      await FirebaseFirestore.instance.collection('posts').doc(widget.post!.id).update({
        'title': title,
        'description': description,
        'scheduledDate': formattedDate, // Actualiza la fecha si se edita
        'redSocial': selectedSocialMedia, // Actualiza la red social si se edita
      });
    }
    Navigator.pop(context);
  }
}
