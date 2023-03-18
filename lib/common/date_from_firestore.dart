import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetDataFromFirestore extends StatefulWidget {
  final String documentId;

  const GetDataFromFirestore({super.key, required this.documentId});

  @override
  State<GetDataFromFirestore> createState() => _GetDataFromFirestoreState();
}

class _GetDataFromFirestoreState extends State<GetDataFromFirestore> {
  final dialogUsernameController = TextEditingController();
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('glasses');

  myDialog(Map data, dynamic myKey) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: Container(
              padding: EdgeInsets.all(22),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: dialogUsernameController,
                    maxLength: 20,
                    decoration: InputDecoration(
                      hintText: '${data[myKey]}',
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          users
                              .doc(credential!.uid)
                              .update({myKey: dialogUsernameController.text});
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "cancel",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('glasses');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Username: ${data['username']} ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            users
                                .doc(credential!.uid)
                                .update({"username": FieldValue.delete()});
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                          myDialog(data, 'username');
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Emailuser:${data['email']} ",
                    style: TextStyle(
                      fontSize: 16.5,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      myDialog(data, 'email');
                    },
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "userpassword: ${data['password']} ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      myDialog(data, 'password');
                    },
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "userphone: ${data['phone']} ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      myDialog(data, 'phone');
                    },
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      users.doc(credential!.uid).delete();
                    });
                  },
                  child: Text(
                    "Delet Data",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}
