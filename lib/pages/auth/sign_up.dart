// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/pages/auth/login.dart';
import 'package:ionicons/ionicons.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool passVis = true;
  Icon showPass = const Icon(Ionicons.eye_outline);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                  child: Container(
                    width: 111,
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
                      "Sign up",
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
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: userName,
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
                            label: const Text("Enter your user name"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
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
                            label: const Text("Example@example.com"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: password,
                          obscureText: passVis,
                          decoration: InputDecoration(
                            label: const Text("Enter your password"),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              gapPadding: 20,
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.lightBlue.shade400,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: showPass,
                              onPressed: () {
                                setState(() {
                                  passVis = !passVis;
                                });
                                if (passVis == true) {
                                  setState(() {
                                    showPass = const Icon(Ionicons.eye_outline);
                                  });
                                } else {
                                  setState(() {
                                    showPass =
                                        const Icon(Ionicons.eye_off_outline);
                                  });
                                }
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue.shade400,
                        ),
                        onPressed: (() async {
                          try {
                            FirebaseAuth authObj = FirebaseAuth.instance;
                            UserCredential myUser =
                                await authObj.createUserWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added Successfully'),
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LogIn();
                                },
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.message.toString()),
                              ),
                            );
                          }
                        }),
                        child: const Text(
                          "sign up",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const LogIn();
                          },
                        ));
                      },
                      child: const Text(
                        "Already have account!",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LogIn();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.lightBlue.shade400,
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
