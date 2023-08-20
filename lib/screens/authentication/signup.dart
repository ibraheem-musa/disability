import 'package:disability/controller/regester.dart';
import 'package:disability/helper_widget/alert_dialog.dart';
import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/custom_textformfield.dart';
import 'package:disability/helper_widget/static_variables.dart';
import 'package:disability/screens/HomePage.dart';
import 'package:disability/screens/authentication/Login.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _userName = '';
  String _email='';
  String _password = '';
  String _phoneNumber = '';
  String roles = 'user';
  bool _showPassword = true;

  List<String> Roles = [
    "user",
    "medicalCenter"
  ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Home ',style: TextStyle(color:DisabilityColors.textDarkGrey,),),
        backgroundColor: DisabilityColors.blue,
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ----------Text Fro username
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Text(
                  "User Name",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              // --- TextFormField for username ---
              CustomTextFormField(
                controller: _userNameController,
                hintText: "Enter Your Name",
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return  "mandatory_field";
                  }
                  return null;
                },
                onChanged: (value) {
                  _userName = value;
                },
              ),
              // ----------Text Fro Email
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              // --- TextFormField for Email ---
              CustomTextFormField(
                controller: _emailController,
                hintText: "Enter Your Name",
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty ||
                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())){
                    return  "mandatory_field";
                  }
                  return null;
                },
                onChanged: (value) {
                  _email = value.trim();
                },
              ),
              //--------Password---
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text(
                  "Password",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              // --- TextFormField for Password ---
              CustomTextFormField(
                controller: _passwordController,
                hintText:"Enter Your Password",
                showPassword: _showPassword,
                textInputType: TextInputType.visiblePassword,
                onChanged: (value) {
                  _password = value;
                },
                validator:  (value) {
                  if (value!.isEmpty||value.length<6) {
                    return  "mandatory_field";
                  }
                  return null;
                },
                suffixWidget: InkWell(
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: !_showPassword
                        ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.remove_red_eye,color: DisabilityColors.mainColor,)
                    )
                        : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:  Icon(Icons.remove_red_eye_outlined,color: DisabilityColors.mainColor,),
                    )
                ),
              ),
              // ----------Text Fro username
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              // --- TextFormField for Email ---
              CustomTextFormField(
                controller: _phoneNumberController,
                hintText: "Enter Your Name",
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return  "mandatory_field";
                  }
                  return null;
                },
                onChanged: (value) {
                  _phoneNumber = value;
                },
              ),
              //drop down list
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text(
                  "specialized",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton<String>(
                  // Step 3.
                  value: roles,
                  // Step 4.

                  items:
                  Roles.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {

                      setState(() {
                        roles= newValue!;
                      });


                  },
                ),
              ),
              //Login Button
              const SizedBox(height: 24),
              Container(
                width:StaticVariables().width(context) ,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: DisabilityColors.mainColor, borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {

                          Messages().loading(context);
                          if(_formKey.currentState!.validate()){
                            Regester().signUp(email: _email
                                ,password:  _password,roles: roles,phone: _phoneNumber,userName: _userName).then((value) {
                              Navigator.pop(context);
                              if(value==200){
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (_) => LoginDemo()));
                              }else{
                                Messages().messageAlert(context: context,
                                    message: "Some things went wrong",
                                    roundedButtonTitle: 'OK',
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    icon: Icons.close);
                              }
                            });
                          }else{
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// TextFormField(
// controller: nameController,
// decoration: const InputDecoration(
// labelText: 'Name',
// border: OutlineInputBorder(),
// ),
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter your name';
// }
// return null;
// },
// ),
// const SizedBox(height: 12),
// TextFormField(
// controller: usernameController,
// decoration: const InputDecoration(
// labelText: 'Username',
// border: OutlineInputBorder(),
// ),
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter a username';
// }
// return null;
// },
// ),
// const SizedBox(height: 12),
// TextFormField(
// controller: emailController,
// decoration: const InputDecoration(
// labelText: 'Email',
// border: OutlineInputBorder(),
// ),
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter your email';
// }
// // You can add more email validation logic if needed
// return null;
// },
// ),
// const SizedBox(height: 12),
// TextFormField(
// controller: passwordController,
// obscureText: true,
// decoration: const InputDecoration(
// labelText: 'Password',
// border: OutlineInputBorder(),
// ),
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter a password';
// }
// // You can add more password validation logic if needed
// return null;
// },
// ),
// const SizedBox(height: 12),
// TextFormField(
// controller: phoneController,
// keyboardType: TextInputType.phone,
// decoration: const InputDecoration(
// labelText: 'Phone Number',
// border: OutlineInputBorder(),
// ),
// // validator: _validatePhoneNumber, // Add phone number validation
// inputFormatters: [
// LengthLimitingTextInputFormatter(10), // Set the maximum length to 10
// ],
// ),
// const SizedBox(height: 12),


