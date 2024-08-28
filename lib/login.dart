import 'package:flutter/material.dart';
import 'package:get/get.dart';
import'signup.dart';

class Login extends StatelessWidget {
  Login({Key? key,}) : super(key: key);
  bool memory = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: ListView(
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Sign in with you email and your password or continue with social media",
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Form(
                  key: validator,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              emil_check(value) == false) {
                            return "Enter a valid email  without spaces";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
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
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      TextFormField(
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                        controller: password,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 6 ||
                              value.contains(" ") == true) {
                            return "Enter a valid pass without spaces > 5";
                          }
                          return null;
                        },
                        // textCapitalization: TextCapitalization.none,
                        obscureText: true,
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
                height: MediaQuery.of(context).size.height / 25,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              // SizedBox(height:  MediaQuery.of(context).size.height/6,),

              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange),
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Get.to(()=>Signup());
                    },
                    // color: Colors.deepOrange,
                    child: const Text("Sign up"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

bool emil_check(String value) {
  if (value.contains("@gmail.com") && value.contains(" ") != true) {
    return true;
  }
  return false;
}
