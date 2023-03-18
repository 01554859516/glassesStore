import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/common/custom_button.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/common/custom_textform.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/common/snakbar.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/provider/google_singin.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/screen/RegistrationPage.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/screen/forgotPasswordpage.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/screen/products/selectionglasses.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/widgets/HeaderWidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisable = false;

  signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      ShowSnakBar(context, "Error : ${e.code}");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  double _headerHeight = 190;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(
                _headerHeight,
                true,
              ),
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Signin into Your account ",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          CustomFormTextfield(
                            controller: emailController,
                            Validator: (value) {
                              return null;
                            },
                            type: TextInputType.emailAddress,
                            lableText: "Email",
                            hintText: "Enter your Email",
                            prefix: Icons.email,
                            obscure: false,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            child: CustomFormTextfield(
                              Validator: (value) {
                                return null;
                              },
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              lableText: "Password",
                              hintText: "Enter your Password",
                              prefix: Icons.lock,
                              obscure: isVisable ? false : true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisable = !isVisable;
                                  });
                                },
                                icon: isVisable
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordPage()),
                                );
                              },
                              child: Text(
                                "forgot your password?",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          CustomBotton(
                            onPressed: () async {
                              await signIn();
                              if (!mounted) return;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SelectionGlasses()));
                            },
                            text: 'Login',
                            width: 200.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don\"t have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationPage()),
                                  );
                                },
                                child: Text(
                                  "Create",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 299,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 0.6,
                                    color: Color.fromARGB(255, 205, 7, 255),
                                  ),
                                ),
                                Text(
                                  "oR",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 205, 7, 255),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 0.6,
                                    color: Color.fromARGB(255, 205, 7, 255),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 27),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    googleSignInProvider.googlelogin();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.purple, width: 1),
                                    ),
                                    child: Image.asset(
                                      "images/google-logo.png",
                                      height: 29,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
