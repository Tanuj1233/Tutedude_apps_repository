import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:pokepedia/screens/home_screen.dart';
import 'package:pokepedia/screens/registration_screen.dart';
import 'package:pokepedia/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    emailController.addListener(() {
      listener:
      (context);
    });
    passwordController.addListener(() {
      listener:
      (context);
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.removeListener(() {
      listener:
      (context);
    });
    passwordController.removeListener(() {
      listener:
      (context);
    });
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Center(
                child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Lottie.asset('assets/animations/lottie1.json')),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[300],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  "Enter valid username & password",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 20,
                  right: 20,
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.yellow,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    suffixIcon: emailController.text.isEmpty
                        ? Container(
                            width: 0,
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                emailController.clear();
                              });
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: obscureText,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.yellow,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: passwordController.text.isEmpty
                        ? Container(
                            width: 0,
                          )
                        : GestureDetector(
                            child: const Icon(
                              Icons.remove_red_eye,
                              color: Colors.black,
                            ),
                            onLongPress: () {},
                            onLongPressUp: () {},
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LoadingAnimatedButton(
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    print("Button pressed");
                    loginUser();
                    final form = formKey.currentState!;
                    String email = emailController.text;
                    String password = passwordController.text;
                    print('$email is the mail');
                    print('$password is the password');
                    if (form.validate()) {
                      final email = emailController.text;
                      final password = passwordController.text;
                    } else {}
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegistrationScreen(),
                          ));
                    },
                    child: Text(
                      "Sign Up !",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.yellow[300],
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginUser() {
    if (passwordController.text == "") {
      Fluttertoast.showToast(
          msg: 'Password cannot be blank', backgroundColor: Colors.red);
    } else {
      String email = emailController.text;
      String password = passwordController.text;
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      }).catchError((e) {
        Fluttertoast.showToast(msg: '$e', backgroundColor: Colors.red);
      });
    }
  }
}
