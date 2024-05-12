import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/postbuy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyNow extends StatefulWidget {
  final int index;
  const BuyNow({super.key,required this.index});

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
  int Quantity = 1;
   
  void addBuyNowData()async{
    try{
User ?user =  FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('users')
    .doc(user!.uid)
    .collection('OrderItem')
    .add({
      'orderItem':'My Coffee ${widget.index+1}',
      'quantity': Quantity,
      'price': '1${widget.index+1}0',
      'date': DateTime.now().toString(),
      'uid': user.uid,
    }).then((value){
      // print(user2!.uid);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>  PastBuyNow(orderId: FirebaseAuth.instance.currentUser!.uid,)));              
});
    }catch(e){
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
        
      },);
    }
    
    
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    final width = MediaQuery.of(context).size.width*1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Card(
                shape:const BeveledRectangleBorder(),
                shadowColor: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    alignment: Alignment.center,
                    height: height*0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width*0.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/image-${widget.index+1}.jpg'),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                          SizedBox(width: width*0.05),
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.start ,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RichText(text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Item : ',
                                    style: GoogleFonts.fahkwang(fontSize:20,fontWeight:FontWeight.w500,color:Colors.white),
                                  ),
                                  TextSpan(
                                    text: "My Coffee ${widget.index+1}",
                                   style: GoogleFonts.fahkwang(fontSize:20,fontWeight:FontWeight.bold,color:Colors.white),
                                  ),
                                ]
                              )),
                              RichText(text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'price : ',
                                    style: GoogleFonts.fahkwang(fontSize:20,fontWeight:FontWeight.w500,color:Colors.white),
                                  ),
                                  TextSpan(
                                    text: "1${widget.index+1}0",
                                   style: GoogleFonts.fahkwang(fontSize:20,fontWeight:FontWeight.bold,color:Colors.white),
                                  ),
                                ]
                              )),
                  
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text('Quantity',style: GoogleFonts.fahkwang(fontSize:20,fontWeight:FontWeight.w500),),
                                  IconButton(onPressed: (){
                                    setState(() {
                                      Quantity-=1;
                                    });
                                  }, icon: const Icon(Icons.minimize)),
                                  Text('$Quantity'),
                                  IconButton(onPressed: (){
                                    setState(() {
                                      Quantity +=1;
                                    });
                                  }, icon: const Icon(Icons.add)),
                  
                                ],
                              ),
                        
                              Container(
                                  width: width*0.24,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: const BeveledRectangleBorder()
                                    ),
                                    onPressed: (){
                                        addBuyNowData();
                                  }, child: const Center(child: Text('Buy item Now'))),
                                )
                              
                  
                  
                            ],
                          )
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}