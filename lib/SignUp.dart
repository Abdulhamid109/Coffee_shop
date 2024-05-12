
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/HomePage.dart';
import 'package:coffee_shop/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isvisible = false;
  void visibilityCheck(){
    setState(() {
      isvisible = !isvisible;
    });
  }
  TextEditingController firstname = TextEditingController();
  TextEditingController Lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  void SignUp(String email ,String password) async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
    .then((value) {
      print(value.user!.uid);
      addData(firstname.text,Lastname.text,email,password);
    });
  }

  //function to add the data in the firebasefirestore
  void addData(String fname,String lname,String email,String password) async{
    User ?user = FirebaseAuth.instance.currentUser;

    if(user!=null){
    await FirebaseFirestore.instance
    .collection('users')
    .doc(user.uid)
    .set({
      'FirstName':fname,
      'LastName':lname,
      'Email':email,
      'Password':password,
      'uid':FirebaseAuth.instance.currentUser?.uid
    })
    .then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
    })
    .catchError((err){
      print(err);
    });
    }else{
      print("User is not signed in");
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    final width = MediaQuery.of(context).size.width*1;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
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
                            Text('Sign Up',style: GoogleFonts.racingSansOne(fontSize:20,fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),),
                            SizedBox(height: height*0.01,),
                            TextField(
                              controller: firstname,
                              decoration: InputDecoration(
                                labelText: " FirstName",
                                labelStyle: GoogleFonts.eagleLake(fontWeight:FontWeight.bold),
                                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                              ),
                            ),
                            SizedBox(height: height*0.03,),
                            TextField(
                              controller: Lastname,
                              decoration: InputDecoration(
                                labelText: " LastName",
                                labelStyle: GoogleFonts.eagleLake(fontWeight:FontWeight.bold),
                                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                              ),
                            ),
                            SizedBox(height: height*0.03,),
                            TextField(
                              controller: email,
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: GoogleFonts.eagleLake(fontWeight:FontWeight.bold),
                                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                              ),
                            ),
                        
                            
                            SizedBox(height: height*0.03,),
                            TextField(
                              controller: password,
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

                            SizedBox(height: height*0.03,),
                            TextField(
                              controller: cpassword,
                              obscureText: isvisible,
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed:visibilityCheck,
                                  icon: isvisible?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                                ),
                                labelText: "confrim Password",
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
                                SignUp(email.text.toLowerCase(), password.text);
                              },
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.eagleLake(fontWeight:FontWeight.bold,color:Colors.black),
                                ),
                              ),
                            ),

                            SizedBox(height: height*0.02,),
                            const Row(
                              children: <Widget>[
                                Expanded(child: Divider(color: Colors.white,)),
                                Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Text('Or'),
                                ),
                                Expanded(child: Divider(color: Colors.white,))
                              ],
                            ),
                            SizedBox(height: height*0.01,),
                            RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Already have an Account',
                                    style: GoogleFonts.racingSansOne(fontSize:18,fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),
                                    ),
                                TextSpan(
                                    text: 'Login',
                                    style: GoogleFonts.racingSansOne(fontSize:20,fontWeight:FontWeight.bold,color:Colors.blue,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),
                                    recognizer: TapGestureRecognizer()..onTap= () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()))
                                    )
                              ]
                            ))
                          ],
                        ),
                      )
                      :
                      Container(
                        width: width*0.7,
                        child: Column(
                          children: <Widget>[
                            //textfield for gmail and password
                            Text('Sign Up',style: GoogleFonts.racingSansOne(fontSize:20,fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),),
                            SizedBox(height: height*0.01,),
                            TextField(
                              decoration: InputDecoration(
                                labelText: " FirstName",
                                labelStyle: GoogleFonts.eagleLake(fontWeight:FontWeight.bold),
                                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                              ),
                            ),
                            SizedBox(height: height*0.03,),
                            TextField(
                              decoration: InputDecoration(
                                labelText: " LastName",
                                labelStyle: GoogleFonts.eagleLake(fontWeight:FontWeight.bold),
                                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                              ),
                            ),
                            SizedBox(height: height*0.03,),
                            TextField(
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

                            SizedBox(height: height*0.03,),
                            TextField(
                              obscureText: isvisible,
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed:visibilityCheck,
                                  icon: isvisible?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                                ),
                                labelText: "confrim Password",
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
                                SignUp(email.text.toLowerCase(), password.text);
                              },
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.eagleLake(fontWeight:FontWeight.bold,color:Colors.black),
                                ),
                              ),
                            ),

                            SizedBox(height: height*0.02,),
                            Row(
                              children: <Widget>[
                                Expanded(child: Divider(color: Colors.white,)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Or'),
                                ),
                                Expanded(child: Divider(color: Colors.white,))
                              ],
                            ),
                            SizedBox(height: height*0.01,),
                            RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Already have an Account',
                                    style: GoogleFonts.racingSansOne(fontSize:18,fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),
                                    ),
                                TextSpan(
                                    text: 'Login',
                                    style: GoogleFonts.racingSansOne(fontSize:20,fontWeight:FontWeight.bold,color:Colors.blue,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 10)]),
                                    recognizer: TapGestureRecognizer()..onTap= () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()))
                                    )
                              ]
                            ))
                          ],
                        ),
                      ),
                      
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