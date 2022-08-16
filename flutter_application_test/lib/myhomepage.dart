import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference storage =
        FirebaseFirestore.instance.collection('storage');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      storage.add({'fruit': _textEditingController.text});
                    },
                    child: const Icon(Icons.add)))),
      ),
      body: Center(
        child: StreamBuilder(
          stream: storage.snapshots(),
          //
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView(
                children: snapshot.data!.docs.map((storage) {
              return Column(
                children: [
                  Center(
                    child: ListTile(
                      title: Text(storage['fruit']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          storage.reference.delete();
                        },
                      ),
                    ),
                  ),
                ],
              );
            }).toList());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          storage.add({'fruit': _textEditingController.text});
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
