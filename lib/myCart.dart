import 'package:coffee_shop/buyNow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCart extends StatefulWidget {
  final int index;
  const MyCart({super.key,required this.index});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List cartdata = [];
  @override
  void initState() {
    // TODO: implement initState
    cartdata.add({
      'item':'My Coffee ${widget.index+1}',
      'price':'1${widget.index+1}0',
      'picture':'images/image-${widget.index+1}.jpg'
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    final width = MediaQuery.of(context).size.width*1;
    
    
    return Scaffold(
      body: 
      MediaQuery.of(context).size.width>600?
      Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text('My Cart',style: GoogleFonts.fahkwang(fontSize:25,fontWeight:FontWeight.bold),),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartdata.length,
                itemBuilder: (context,index){
                  String itemName = cartdata[index]['item'];
                  String itemPrice = cartdata[index]['price'];
                  String itemPicture = cartdata[index]['picture'];
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      shape:BeveledRectangleBorder(),
                      shadowColor: Colors.white,
                      child: Container(
                        height: height*0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width*0.2,
                              height: height*0.2,
                              decoration:BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(itemPicture),
                                  fit: BoxFit.cover
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                Text(itemName,style: GoogleFonts.fahkwang(fontSize:20,fontWeight:FontWeight.bold),),
                                Text(itemPrice,style: GoogleFonts.fahkwang(fontSize:18,fontWeight:FontWeight.w500),)
                              ],
                            ),
                           
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //remove from cart button
                                Container(
                                  width: width*0.24,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: const BeveledRectangleBorder()
                                    ),
                                    onPressed: (){
                                      setState(() {
                                        
                                       cartdata.removeAt(index);                 
                                      });
                                  }, child: Center(child: Text('Remove from cart'))),
                                ),
                              SizedBox(height: height*0.01,),
                                Container(
                                  width: width*0.24,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: const BeveledRectangleBorder()
                                    ),
                                    onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyNow(index: widget.index,)));              
                     
                                  }, child: Center(child: Text('Buy item Now'))),
                                )
                              
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
              }),
            )
            
          ],
        ),
      ):
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text('My Cart',style: GoogleFonts.fahkwang(fontSize:25,fontWeight:FontWeight.bold),),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              
              child: ListView.builder(
                itemCount: cartdata.length,
                itemBuilder: (context,index){
                   String itemName = cartdata[index]['item'];
                  String itemPrice = cartdata[index]['price'];
                  String itemPicture = cartdata[index]['picture'];
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      shape:BeveledRectangleBorder(),
                      shadowColor: Colors.white,
                      child: Container(
                        height: height*0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width*0.2,
                              height: height*0.2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(itemPicture),
                                  fit: BoxFit.cover
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                Text(itemName,style: GoogleFonts.fahkwang(fontSize:20,fontWeight:FontWeight.bold),),
                                Text(itemPrice,style: GoogleFonts.fahkwang(fontSize:18,fontWeight:FontWeight.w500),)
                              ],
                            ),
                           
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //remove from cart button
                                Container(
                                  width: width*0.25,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: const BeveledRectangleBorder()
                                    ),
                                    onPressed: (){
                                      setState(() {
                                      cartdata.removeAt(index);         
                                      });
                                  }, child: Center(child: Text('Remove'))),
                                ),
                              SizedBox(height: height*0.01,),
                                Container(
                                  width: width*0.25,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: const BeveledRectangleBorder()
                                    ),
                                    onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyNow(index: widget.index,)));              
                                  }, child: Center(child: Text('Buy'))),
                                )
                              
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
              }),
            )
            
          ],
        ),
      ),
    
    
    );
    
  
  }
}