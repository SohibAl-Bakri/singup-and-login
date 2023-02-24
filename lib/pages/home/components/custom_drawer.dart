import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/pages/auth/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  // final CollectionReference users =
  //     FirebaseFirestore.instance.collection('users');
  Widget build(BuildContext context) {
    // return StreamBuilder(
    //   stream: users.snapshots(),
    //   builder: (context, snapshot) {
    //     final docId = FirebaseAuth.instance.currentUser!.uid;
    //     if (snapshot.hasData) {
    //       var name = '';
    //       var image = '';
    //       var role = '';

    //       for (var i in snapshot.data!.docs) {
    //         if (i.id == docId) {
    //           name = i['name'];
    //           image = i["image"];
    //           role = i['role'];
    //         }
    //       }
    return Drawer(
      //backgroundColor: AppColors.somo3,
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade400,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(3),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ),
              ),
              accountName: Text(
                'User Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue.shade400,
                ),
              ),
              accountEmail: Text(
                'email@example.com',
                //FirebaseAuth.instance.currentUser!.email.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.lightBlue.shade400,
                ),
              ),
            ),
            InkWell(
              child: const ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.logout),
              ),
              onTap: () async {
                GoogleSignIn().signOut();
                FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const LogIn();
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
  // return const Center(
  //   child: CircularProgressIndicator(),
  // );
}
