import 'package:face_meet/component/background.dart';
import 'package:face_meet/constant/validation.dart';
import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/decoration.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // dispose() is lifecycle method of flutter

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
    // The purpose of calling dispose => Prevent memory leaks
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _registerFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Image.asset(
                        "images/logo.png",
                        width: size.height * 0.25,
                      )),
                  const Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Let's help you meet up your tasks",
                    style: TextStyle(fontSize: 15, color: fieldColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    controller: _nameController,
                    decoration: textFieldDecoration.copyWith(
                        labelText: 'Enter your full name',
                        hintText: "John Jackson"),
                    validator: (value) {
                      return validationName(value!);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: textFieldDecoration.copyWith(
                        labelText: 'Email',
                        hintText: "johnjackson@example.com"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      // check if : the email take a form email => aa@gg.com & the field not empty
                      return validationEmail(value!);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration:
                        textFieldDecoration.copyWith(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      // check if : the field not empty
                      return validationPassword(value!, 8);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: textFieldDecoration.copyWith(
                        labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: (value) {
                      return validationSamePassword(
                          value!, _passwordController.text);
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25, bottom: 25.0),
                    color: primaryColor,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () async {
                          try {
                            if (_registerFormKey.currentState!.validate()) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/NewMeeting", (route) => false);
                            }
                          } catch (e) {
                            print('Error Happened!!!: $e');
                          }
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account ?   "),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/log_in", (route) => false);
                          },
                          child: const Text(
                            "Sign in here!",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  // const SizedBox(
                  //   child: CircularProgressIndicator(strokeWidth: 2),
                  //   height: 30,
                  //   width: 30,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
