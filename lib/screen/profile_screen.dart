import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/common/date_from_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.pop(context);
            },
            label: Text(
              "logout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 135, 24, 176),
        title: Text("Profile "),
      ),
      body: Padding(
        padding: EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(31, 203, 7, 200),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Text(
                    "Info form firebase Auth",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Email :  ${credential!.email}",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "create date:${DateFormat("MMM d ,y").format(credential!.metadata.creationTime!)}",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "last Signed in:  ${DateFormat("MMM d ,y").format(credential!.metadata.lastSignInTime!)}",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      CollectionReference users =
                          FirebaseFirestore.instance.collection('glasses');
                      credential!.delete();
                      users.doc(credential!.uid).delete();
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Delet user",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(31, 203, 7, 200),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Text(
                    "Info from firebase Firestore",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              GetDataFromFirestore(
                documentId: credential!.uid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
