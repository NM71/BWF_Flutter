import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_6_e_commerce_e_bazaar/constants/themes.dart';
import 'package:task_6_e_commerce_e_bazaar/controllers/appValidator.dart';
import 'package:task_6_e_commerce_e_bazaar/services/auth_service.dart';
import 'package:task_6_e_commerce_e_bazaar/views/signup_screen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var isLoader = false;
  var authService = AuthService();

  void _submitForm() async{
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });
      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };

      await authService.login(data, context);

      setState(() {
        isLoader = false;
      });
    }
  }

  var appValidator = Appvalidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Image.asset('assets/images/online-shop.png',height: 100,width: 100,),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    "Account Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(color: kSecondaryColor),
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                  _buildInputDecoration("Email", Icons.email_outlined,),
                  validator: appValidator.validateEmail,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  style: TextStyle(color: kSecondaryColor),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                  _buildInputDecoration("Password", Icons.password_outlined),
                  obscureText: true,
                  validator: appValidator.validatePassword,
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kSecondaryColor),
                        onPressed: isLoader ? null : _submitForm,
                        child: isLoader
                            ? Center(child: CircularProgressIndicator())
                            : Text("Login", style: TextStyle(fontSize: 20,color: Colors.white),)
                    )
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    "Create New Account",
                    style: TextStyle(
                        color: kSecondaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
      fillColor: kPrimaryColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: kSecondaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: kSecondaryColor,
        ),
      ),
      labelText: label,
      labelStyle: TextStyle(color: kSecondaryColor),
      suffixIcon: Icon(
        suffixIcon,
        color: kSecondaryColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
