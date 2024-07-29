import 'package:flutter/material.dart';
import 'package:task_6_e_commerce_e_bazaar/constants/themes.dart';
import 'package:task_6_e_commerce_e_bazaar/controllers/appValidator.dart';
import 'package:task_6_e_commerce_e_bazaar/services/auth_service.dart';
import 'package:task_6_e_commerce_e_bazaar/views/home_page.dart';
import 'package:task_6_e_commerce_e_bazaar/views/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });
      var data = {
        "username": _userNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "password": _passwordController.text,
      };

      await authService.createUser(data, context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      setState(() {
        isLoader = false;
      });
      // ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
      //   const SnackBar(content: Text('Form Submitted Successfully!')),
      // );
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
                SizedBox(height: 30,),
                Image.asset('assets/images/online-shop.png',height: 100,width: 100,),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    "Create New Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _userNameController,
                  style: TextStyle(color: kSecondaryColor),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                      _buildInputDecoration("Username", Icons.person_outline),
                  validator: appValidator.validateUsername,
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
                      _buildInputDecoration("Email", Icons.email_outlined),
                  validator: appValidator.validateEmail,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _phoneController,
                  style: TextStyle(color: kSecondaryColor),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration(
                      "Phone Number", Icons.phone_android_outlined),
                  validator: appValidator.validatePhoneNumber,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  style: TextStyle(color: kSecondaryColor),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration(
                      "Password", Icons.password_outlined),
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
                            : Text("Create Account", style: TextStyle(fontSize: 20, color: kPrimaryColor),)
                    )
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Have Account? Login",
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
