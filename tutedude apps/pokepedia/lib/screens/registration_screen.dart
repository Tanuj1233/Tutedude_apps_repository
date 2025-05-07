import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokepedia/screens/login_screen.dart';
import 'package:pokepedia/widgets/button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
                    height: 200,
                    width: 400,
                    child: Lottie.asset('assets/animations/lottie2.json')),
              ),

              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[300],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Use proper information",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              //** name field
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: obscureText,
                  obscuringCharacter: '*',
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
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
                      Icons.person,
                      color: Colors.black,
                    ),
                    suffixIcon: nameController.text.isEmpty
                        ? Container(
                            width: 0,
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                nameController.clear();
                              });
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
              ),
              //** email field
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
              //* password field
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
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
              //** login button
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LoadingAnimatedButton(
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
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
                            builder: (_) => const LoginScreen(),
                          ));
                    },
                    child: Text(
                      "Sign In !",
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
}
