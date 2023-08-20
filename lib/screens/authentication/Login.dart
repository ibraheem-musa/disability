import 'package:disability/controller/regester.dart';
import 'package:disability/helper_widget/alert_dialog.dart';
import 'package:disability/screens/authentication/signup.dart';
import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/custom_textformfield.dart';
import 'package:disability/helper_widget/static_variables.dart';
import 'package:disability/screens/HomePage.dart';
import 'package:flutter/material.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  String _email = '';
  String _password = '';
  bool _showPassword = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isCheckedRememberMe = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white ,
        body: SingleChildScrollView(
          child: Form(
            key:_formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40,),
                  child: Container(
                    height: StaticVariables().height(context)/2.5,
                    child: Center(
                      child: Image.asset(
                        'assets/icon1.png', // Replace 'assets/image.png' with the actual path to your image in the assets folder.
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,),
                    ),
                  ),
                ),
                // ----------Text Fro username
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
                      hintText: "Enter Your Email",
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())){
                          return  "mandatory field";
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
                          return  "mandatory field";
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
                //----remember me----------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    checkColor: Colors.white,
                    activeColor: DisabilityColors.maineGreen,
                    value: isCheckedRememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedRememberMe = value!;
                      });
                    },
                  ),
                    Text(
                      "Remember Me",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),

                //=== login button
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
                              Regester().signIn(_email, _password).then((value) {
                                Navigator.pop(context);
                                if(value==200){
                                  Navigator.pushAndRemoveUntil(
                                      context, MaterialPageRoute(builder: (_) => HomePage()),(Route<dynamic> route) => false);
                                }else{
                                  Messages().messageAlert(context: context,
                                      message: "your email or password not correct",
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
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Container(
                    child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => SignUp()));

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                             Text ('You don\'t have account ? ' ,
                              style: TextStyle(color: Colors.black , fontSize: 15,fontWeight: FontWeight.w400), ),
                            Text ('Create One Now.' ,
                              style: TextStyle(color: Colors.black , fontSize: 15,fontWeight: FontWeight.w600), ),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}