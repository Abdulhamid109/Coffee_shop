import 'dart:ui';

import 'package:coffee_shop/HomePage.dart';
import 'package:coffee_shop/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isvisible = false;
  void visibilityCheck(){
    setState(() {
      isvisible = !isvisible;
    });
  }

  //create a method to log in 
  void login(String email,String password)async{
    try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
     .then((value) {
       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const HomePage()));
     });
    } catch (e) {
       ScaffoldMessenger(
        child: SnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
          content: Text('Failed to login try again after sometime',style: GoogleFonts.fahkwang(fontSize:18,fontWeight:FontWeight.bold,color:Colors.black),),
        ));
    }
  }

  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    final width = MediaQuery.of(context).size.width*1;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background-image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
              child: Container(
                alignment: Alignment.center,
                color: Colors.grey.withOpacity(0.1),
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: MediaQuery.of(context).size.width>600?
                      Container(
                        width: width*0.4,
                        child: Column(
                          children: <Widget>[
                            //textfield for gmail and password
                            Text('Login',style: GoogleFonts.racingSansOne(fontSize:20,fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),),
                            SizedBox(height: height*0.01,),
                            TextField(
                              controller: EmailController,
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: GoogleFonts.eagleLake(fontWeight:FontWeight.bold),
                                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                              ),
                            ),
                        
                            SizedBox(height: height*0.03,),
                            TextField(
                              obscureText: isvisible,
                              obscuringCharacter: "*",
                              controller: passwordController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed:visibilityCheck,
                                  icon: isvisible?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                                ),
                                labelText: "Password",
                                labelStyle: GoogleFonts.eagleLake(fontWeight:FontWeight.bold),
                                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                              ),
                            ),
                        
                            //red button for login
                            SizedBox(height: height*0.03,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: (){
                                login(EmailController.text.toLowerCase(), passwordController.text);
                              },
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.eagleLake(fontWeight:FontWeight.bold,color:Colors.black),
                                ),
                              ),
                            ),

                            SizedBox(height: height*0.02,),
                            const Row(
                              children: <Widget>[
                                Expanded(child: Divider(color: Colors.white,)),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Or'),
                                ),
                                Expanded(child: Divider(color: Colors.white,))
                              ],
                            ),
                            SizedBox(height: height*0.01,),
                            RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: GoogleFonts.racingSansOne(fontSize:18,fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),
                                    ),
                                TextSpan(
                                    text: 'Sign Up',
                                    style: GoogleFonts.racingSansOne(fontSize:20,fontWeight:FontWeight.bold,color:Colors.blue,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),
                                    recognizer: TapGestureRecognizer()..onTap=() => Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupPage()))
                                    )
                              ]
                            ))
                          ],
                        ),
                      )
                    
                    :Container(
                        width: width*0.7,
                        child: Column(
                          children: <Widget>[
                            //textfield for gmail and password
                            Text('Login',style: GoogleFonts.racingSansOne(fontSize:20,fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),),
                            SizedBox(height: height*0.01,),
                            TextField(
                              controller: EmailController,
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: GoogleFonts.eagleLake(fontWeight:FontWeight.bold),
                                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                              ),
                            ),
                        
                            SizedBox(height: height*0.03,),
                            TextField(
                              controller: passwordController,
                              obscureText: isvisible,
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed:visibilityCheck,
                                  icon: isvisible?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                                ),
                                labelText: "Password",
                                labelStyle: GoogleFonts.eagleLake(fontWeight:FontWeight.bold),
                                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                              ),
                            ),
                        
                            //red button for login
                            SizedBox(height: height*0.03,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: (){
                                login(EmailController.text.toLowerCase(), passwordController.text);
                              },
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.eagleLake(fontWeight:FontWeight.bold,color:Colors.black),
                                ),
                              ),
                            ),

                            SizedBox(height: height*0.02,),
                            const Row(
                              children: <Widget>[
                                Expanded(child: Divider(color: Colors.white,)),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Or'),
                                ),
                                Expanded(child: Divider(color: Colors.white,))
                              ],
                            ),
                            SizedBox(height: height*0.01,),
                            RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: GoogleFonts.racingSansOne(fontSize:18,fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),
                                    ),
                                TextSpan(
                                    text: 'Sign Up',
                                    style: GoogleFonts.racingSansOne(fontSize:20,fontWeight:FontWeight.bold,color:Colors.blue,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),
                                    recognizer: TapGestureRecognizer()..onTap=() => Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupPage()))
                                    )
                              ]
                            ))
                          ],
                        ),
                      )
                    
                    ),
                  ),
                ),
              ),
            ),
          ),
          
        ),
      ),
    );
  }
}