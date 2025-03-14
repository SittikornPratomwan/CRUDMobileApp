import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class updateForm extends StatefulWidget {
  @override
  State<updateForm> createState() => _updateFormState();
}

class _updateFormState extends State<updateForm> {
  CollectionReference universityCollection =
      FirebaseFirestore.instance.collection('University');

  @override
  Widget build(BuildContext context) {
    final postData = ModalRoute.of(context)!.settings.arguments as dynamic;

    final universityController = TextEditingController(text: postData['university']);
    final rankingController = TextEditingController(text: postData['ranking']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 136, 137, 1),
        title: Center(
          child: Text(
            'Example',
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
                  'Update Post',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    universityCollection.doc(postData.id).update({
                      'university': universityController.text,
                      'ranking': rankingController.text
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
