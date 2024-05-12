import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/CoffeeDetail.dart';
import 'package:coffee_shop/UserData.dart';
import 'package:coffee_shop/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //create a function to fetch the current user information
  Future<UserData> getCurrentUserData() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Get the current user
  User? user = auth.currentUser;

  if (user != null) {
    // Get the document corresponding to the user from Firestore
    DocumentSnapshot snapshot = await firestore.collection('users').doc(user.uid).get();

    // Check if the document exists
    if (snapshot.exists) {
      // Convert the data from Firestore to your UserData model
      UserData userData = UserData.fromMap(snapshot.data() as Map<String, dynamic>);
      return userData;
    } else {
      // Document doesn't exist
      throw Exception('User data not found');
    }
  } else {
    // No user signed in
    throw Exception('No user signed in');
  }
}

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Caffeine Hub',
          style: GoogleFonts.eagleLake(fontWeight: FontWeight.bold, shadows: [
            const Shadow(
                offset: Offset(2, 2), color: Colors.black, blurRadius: 10)
          ]),
        ),
        automaticallyImplyLeading: false,
        actions: [
          MediaQuery.of(context).size.width > 600
              ? Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage())),
                      child: Text('Home',style: GoogleFonts.albertSans(fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2.5, 2.5),color: Colors.black,blurRadius: 11)])),
                    ),
                    
                    SizedBox(
                      width: width * 0.02,
                    ),
                    GestureDetector(
                      onTap: () async{
                        await FirebaseAuth.instance.signOut()
                        .then((value){
                         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => false);
                        });
                      },child: Text('Logout',style: GoogleFonts.albertSans(fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2.5, 2.5),color: Colors.black,blurRadius: 11)])),
                    ),
                    
                    SizedBox(
                      width: width * 0.2,
                    )
                  ],
                )
              : PopupMenuButton<String>(
                  onSelected: (String value) async{
                    if (value == 'home') {
                      // Handle home action
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    } else if (value == 'logout') {
                      // Handle logout action
                        await FirebaseAuth.instance.signOut()
                        .then((value){
                         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => false);
                        });
                      }
                    
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'home',
                        child: Text('Home'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'logout',
                        child: Text('Logout'),
                    
                      ),
                    ];
                  },
                ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: FutureBuilder(
                future: getCurrentUserData(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                          return const Text('loading...');
                        }else if(snapshot.hasError){
                          return Text("${snapshot.error}");
                        }

                  return Text('welcome ${snapshot.data!.fname}',style: GoogleFonts.eagleLake(fontSize:20,fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2, 2),color: Colors.black,blurRadius: 11)]),);
                },
              )
              ),
            SizedBox(
              height: 10,
            ),
            MediaQuery.of(context).size.width>600
            ?
            Expanded(
              child: GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                  itemCount: 18, 
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeDetail(index:index))),
                          child: Container(
                            height: height*0.2,
                            width: width*0.1,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/image-${index+1}.jpg'),
                                fit: BoxFit.cover,
                                opacity: 0.5
                              ),
                          ),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text('My Coffee ${index+1}',style: GoogleFonts.albertSans(fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2.5, 2.5),color: Colors.black,blurRadius: 11)]),)),
                          ),
                        ),
                      ),
                    );
                  }),
            ):Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: 18, 
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeDetail(index:index))),
                          child: Container(
                            height: height*0.2,
                            width: width*0.1,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/image-${index+1}.jpg'),
                                fit: BoxFit.cover,
                                opacity: 0.5
                              ),
                              
                          ),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text('My Coffee ${index+1}',style: GoogleFonts.albertSans(fontWeight:FontWeight.bold,shadows:[const Shadow(offset: Offset(2.5, 2.5),color: Colors.black,blurRadius: 11)]))),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          
          
          ],
        ),
      ),
    ));
  }
}
