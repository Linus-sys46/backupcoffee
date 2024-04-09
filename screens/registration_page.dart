import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/screens/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? _emailError;
  bool _isNameError = false;
  bool _isPasswordError = false;
  bool _isConfirmPasswordError = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isPasswordMatchError = false;
  String? _phoneNumberError; // New state variable for phone number error

  bool _isEmailValid(String email) {
    // Regular expression pattern for email validation
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    fnameController.dispose();
    lnameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA000).withOpacity(0.5),
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20.0),
            color: Color(0xFFFFA000).withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.0),
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 50.0,
                    color: Color(0xFFFFA000).withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Email | Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    errorText: _emailError,
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _emailError = !_isEmailValid(value)
                          ? 'Please enter a valid email'
                          : null;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: fnameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    errorText: _isNameError ? 'Please fill out this field' : null,
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _isNameError = value.isEmpty;
                    });
                  },
                ),
                   SizedBox(height: 10.0),
                TextFormField(
                  controller: lnameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    errorText: _isNameError ? 'Please fill out this field' : null,
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _isNameError = value.isEmpty;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    errorText: _phoneNumberError, // Add error text here
                  ),
                  maxLength: 10, // Limit the input to 10 characters
                  keyboardType: TextInputType.phone, // Set the keyboard type to phone
                  onChanged: (value) {
                    // Regular expression pattern for Kenyan phone numbers starting with '07'
                    String pattern = r'^07\d{8}$';
                    RegExp regExp = RegExp(pattern);

                    // Validate if entered phone number matches the pattern
                    if (regExp.hasMatch(value)) {
                      // Phone number is valid
                      setState(() {
                        _phoneNumberError = null;
                      });
                    } else {
                      // Phone number is not valid, show error message
                      setState(() {
                        _phoneNumberError = 'Please enter a valid  phone number';
                      });
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    errorText: _isPasswordError ? 'Please fill out this field' : null,
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _isPasswordError = value.isEmpty;
                    });
                  },
                ),
                // SizedBox(height: 10.0),
                // TextFormField(
                //   controller: _confirmPasswordController,
                //   obscureText: !_isConfirmPasswordVisible,
                //   decoration: InputDecoration(
                //     labelText: 'Confirm Password',
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(30.0),
                //     ),
                //     errorText: _isConfirmPasswordError
                //         ? 'Please fill out this field'
                //         : _isPasswordMatchError
                //             ? 'Passwords do not match'
                //             : null,
                //     suffixIcon: IconButton(
                //       icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                //       onPressed: () {
                //         setState(() {
                //           _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                //         });
                //       },
                //     ),
                //     hintStyle: TextStyle(
                //       color: Colors.black,
                //     ),
                //   ),
                //   onChanged: (value) {
                //     setState(() {
                //       _isConfirmPasswordError = value.isEmpty;
                //       _isPasswordMatchError = _passwordController.text != value;
                //     });
                //   },
                // ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    serverSignup();
                    // setState(() {
                    //   _emailError = _emailController.text.isEmpty
                    //       ? 'Please enter an email'
                    //       : !_isEmailValid(_emailController.text)
                    //           ? 'Please enter a valid email'
                    //           : null;
                    //   _isNameError = _nameController.text.isEmpty;
                    //   _isPasswordError = _passwordController.text.isEmpty;
                    //   _isConfirmPasswordError = _confirmPasswordController.text.isEmpty;
                    //   _isPasswordMatchError =
                    //       _passwordController.text != _confirmPasswordController.text;
                    // });
                    // if (_emailError == null &&
                    //     !_isNameError 
                    //                         &&
                    //     !_isPasswordError &&
                    //     !_isConfirmPasswordError &&
                    //     !_isPasswordMatchError &&
                    //     _phoneNumberError == null) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => LoginPage()),
                    //   );
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login Here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> serverSignup() async{
    http.Response response;
   var body =  {
  'firstname': fnameController.text.trim(),
  'lastname': lnameController.text.trim(),
  'username': usernameController.text.trim(),
  'phone': phoneController.text.trim(),
  'password': passwordController.text.trim(),
   };
    response = await http.post(
      Uri.parse("http://www.nattiee.com/coffee/signup.php"),
      body: body);
      if(response.statusCode==200){
        var serverResponse = json.decode(response.body);
        int signedUp = serverResponse['success'];
        if(signedUp ==1){
           ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            content: Text('Account created successfully!'),
            backgroundColor: Colors.green,
              ),
             );

      // Navigate to the LoginPage after a short delay
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
          // print("Account Created");

        }
        // else{
        //   print("Account not created");
        // }
      }

    }
}