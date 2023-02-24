// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/pages/auth/login_with_google.dart';
import 'package:flutter_task/pages/auth/sign_up.dart';
import 'package:flutter_task/pages/home/home_page.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  static String id = "LogIn";

  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                    child: Container(
                      width: 100,
                      height: 50,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade400,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Log_in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                gapPadding: 20,
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.lightBlue.shade400,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                gapPadding: 20,
                                borderSide: BorderSide(
                                  width: 20,
                                  color: Colors.lightBlue.shade400,
                                ),
                              ),
                              prefixIcon: const Icon(Icons.email),
                              label: const Text("Email"),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                gapPadding: 20,
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.lightBlue.shade400,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  gapPadding: 20,
                                  borderSide: BorderSide(width: 20)),
                              prefixIcon: const Icon(Icons.lock),
                              label: const Text("Password"),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: Colors.lightBlue.shade400),
                                onPressed: () async {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const HomePage();
                                    },
                                  ));
                                  try {
                                    FirebaseAuth authObject =
                                        FirebaseAuth.instance;

                                    UserCredential loginMethod =
                                        await authObject
                                            .signInWithEmailAndPassword(
                                                email: email.text,
                                                password: password.text);

                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const HomePage();
                                        },
                                      ),
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          e.message.toString(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  "Log in",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget password?",
                              style:
                                  TextStyle(color: Colors.lightBlue.shade400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Do not have account ? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignUp();
                            },
                          ));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.lightBlue.shade400,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 4.0,
                          color: Colors.pink[100],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Or Login With',
                          style: TextStyle(
                            color: Colors.lightBlue.shade400,
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 4.0,
                          color: Colors.pink[100],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const GoogleLogin(),
                      InkWell(
                        child: CircleAvatar(
                          backgroundColor: Colors.pink[100],
                          child: Icon(
                            Ionicons.logo_facebook,
                            color: Colors.lightBlue.shade400,
                            size: 30,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
