import 'package:face_meet/component/background.dart';
import 'package:flutter/material.dart';
import '../constant/decoration.dart';
import '../constant/validation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _loginFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Image.asset(
                      "images/logo.png",
                      width: size.height * 0.25,
                    ),
                  ),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "images/login.png",
                      width: size.width * 0.5,
                    ),
                  ),
                  TextFormField(
                    decoration: textFieldDecoration.copyWith(
                        labelText: 'Email', hintText: "johnjackson@example.com"),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      return validationEmail(value!);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: textFieldDecoration.copyWith(labelText: 'Password'),
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      return validationPassword(value!,8);
                      },
                  ),
                  GestureDetector(
                    onTap: (){

                      // TODO : forget password

                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text(
                        "Forget password ?",
                        style: TextStyle(
                            color: Colors.deepOrange, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 25),
                    color: Colors.deepOrange,
                    height: 50,
                    width: size.width * 0.7,
                    child: ElevatedButton(
                      // style: TextButton.styleFrom(
                      //   backgroundColor: Colors.deepOrange,),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_loginFormKey.currentState!.validate()) {
                          try {



                        Navigator.of(context).pushNamedAndRemoveUntil(
                         "/NewMeeting", (route) => false);

                          } catch (e) {
                            print('Error Happened!!!: $e');
                          }
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You don't have an account?   "),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/sign_up", (route) => false);
                        },
                        child: const Text(
                          "Sign up here!",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   child: CircularProgressIndicator(
                  //       strokeWidth: 2),
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
