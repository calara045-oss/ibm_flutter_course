import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Layout Lab Practice',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Layout Lab Practice')),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.star, color: Colors.blue),
              Icon(Icons.favorite, color: Colors.red),
              Icon(Icons.thumb_up, color: Colors.green),
            ],
          ),
          Text('Flutter is so cool!'),
          Text('Building layout in Flutter is so simple.'),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Enter your name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your name';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _logger.i('Form is submitted. User input is valid.');
                showAlertDialog(
                  context,
                  'Flutter Layout Lab Practice',
                  'Thank you for submitting.',
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

void showAlertDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
