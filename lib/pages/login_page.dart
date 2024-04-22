import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  String email = '';
  String password = '';
  //login method
  void login() {
    /*

    fill out authentication here...
    

    */
    //navigate to home page
    // Navigator.push(
    //     context, MaterialPageRoute(builder: ((context) => HomePage())));
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 180,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(
                  height: 25,
                ),

                //message, app slogan
                Text(
                  'food delivery App',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  height: 25,
                ),

                //email textfield
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is Required";
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Please enter a valid email address";
                    }

                    return null;
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                ),

                const SizedBox(
                  height: 25,
                ),
                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is Required";
                    }
                    if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return "Please enter a valid password";
                    }

                    return null;
                  },
                  onSaved: (value) {
                    password = value!;
                  },
                ),

                const SizedBox(
                  height: 25,
                ),
                //sign in button

                MyButton(
                    onTap: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const HomePage())));
                      }
                      formKey.currentState!.save();

                      print(email);
                      print(password);
                    },
                    text: 'Sign in'),

                SizedBox(
                  height: 15,
                ),
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Register now',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
