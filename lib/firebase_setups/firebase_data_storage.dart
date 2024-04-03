import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void addItem(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter title',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String title = _titleController.text;
                  // Check if the text is not empty before adding
                  if (title.isNotEmpty) {
                    _addTodoTitle(title);
                    // Clear text field after adding
                    _titleController.clear();
                  }
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addTodoTitle(String title) {
    FirebaseFirestore.instance.collection('todos').add({
      'title': title,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }

  void _deleteTodoItem(String documentId) {
    FirebaseFirestore.instance.collection('todos').doc(documentId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('FireStore Class'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('todos').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              String title = documents[index]['title'];
              return ListTile(
                title: Text(title),
                trailing: InkWell(
                  onTap: () {
                    _deleteTodoItem(documents[index].id);
                  },
                  child: const Icon(Icons.delete_forever),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem(context);
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
