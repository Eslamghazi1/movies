import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  final validator = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign in'),
        backgroundColor: Colors.white.withOpacity(0.2),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20),
          child: ListView(
            children: [
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Sign up with your name, email, phone number and your password or continue with social media",
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Form(
                  key: validator,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: username,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 2 ||
                              value.contains(" ") == true) {
                            return "Enter a valid pass without spaces > 5";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.perm_contact_cal),
                          label: Text("Name"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(color: Colors.red, width: 2.0),
                          ),
                          // hintText: 'Enter Password',
                        ),
                        showCursor: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              emil_check(value) == false) {
                            return "Enter a valid email  without spaces";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.email_outlined),
                          label: Text("Email"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(color: Colors.red, width: 2.0),
                          ),
                          // hintText: 'Enter Email',
                        ),
                        showCursor: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      TextFormField(
                        controller: password,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 6 ||
                              value.contains(" ") == true) {
                            return "Enter a valid pass without spaces > 5";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.lock),
                          label: Text("Password"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(color: Colors.red, width: 2.0),
                          ),
                          // hintText: 'Enter Password',
                        ),
                        showCursor: true,
                      ),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () async {
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange),
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
      ),
    );
  }
}

bool emil_check(String value) {
  if (value.contains("@gmail.com") && value.contains(" ") != true) {
    return true;
  }
  return false;
}


