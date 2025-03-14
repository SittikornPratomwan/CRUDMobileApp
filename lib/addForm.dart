import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addForm extends StatefulWidget {
  @override
  State<addForm> createState() => _addFormState();
}

class _addFormState extends State<addForm> {
  final universityController = TextEditingController();
  final rankingController = TextEditingController();
  final countryController = TextEditingController(); // New controller for country

  CollectionReference universityCollection =
      FirebaseFirestore.instance.collection('University');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 136, 137, 1),
        title: Center(
          child: Text(
            'University Ranking',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Column(
              children: [
                Text(
                  'ADD University',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: universityController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'University',
                    icon: Icon(Icons.school),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: rankingController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Ranking',
                    icon: Icon(Icons.star),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField( // New TextFormField for country
                  controller: countryController,
                  decoration: InputDecoration(
                    hintText: 'Country',
                    icon: Icon(Icons.flag),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    universityCollection.add({
                      'university': universityController.text,
                      'ranking': rankingController.text,
                      'country': countryController.text // Add country field
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
