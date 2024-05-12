import 'package:coffee_shop/buyNow.dart';
import 'package:coffee_shop/myCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDetail extends StatefulWidget {
  final int index;
  const CoffeeDetail({super.key, required this.index});

  @override
  State<CoffeeDetail> createState() => _CoffeeDetailState();
}

class _CoffeeDetailState extends State<CoffeeDetail> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Detail ',style: GoogleFonts.eagleLake(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      const Shadow(
                          offset: Offset(2, 2),
                          color: Colors.black,
                          blurRadius: 10)
                    ]),),
                    centerTitle: true,
      ),
        body: SingleChildScrollView(
      child: MediaQuery.of(context).size.width>600?
      Container(
        width: width*1,
        height: height*1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image-${widget.index+1}.jpg'),
            fit: BoxFit.cover,
            opacity: 0.7,
            
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Card(
            shape: BeveledRectangleBorder(),
            shadowColor: Colors.white,
            color: Colors.white.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height:height* 0.7,
                  width:width* 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/image-${widget.index+1}.jpg'),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: width*0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Item : My coffee ${widget.index+1}',style: GoogleFonts.abel(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            const Shadow(
                                offset: Offset(4, 4),
                                color: Colors.black,
                                blurRadius: 10)
                          ]),),
                        Text('Price : 1${widget.index+1}0',style: GoogleFonts.abel(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          shadows: [
                            const Shadow(
                                offset: Offset(4, 4),
                                color: Colors.black,
                                blurRadius: 10)
                          ]),),
                        Container(
                          width: width*0.4,
                          child: Text('Details : ajrgawkgakwjjbgikjiawbkadsbkfjbawekfbvwkabgviabirgbkawbgkbkakb4giauwbubgkjvbkbrvbkjbiu4bibiui43ubg3gbwabvkjajbabvbaw[gppjwpeab;wrnb;an;abnribnrnbarnbbbbb]JIRGOIRNBNRGNNOINRNGBbbnsrnboisnronboir',style: GoogleFonts.eagleLake(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            shadows: [
                              const Shadow(
                                  offset: Offset(4, 4),
                                  color: Colors.black,
                                  blurRadius: 10)
                            ]),),
                        ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(
                                height: height * 0.1,
                              ),
                              Container(
                                
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder(),
                                        backgroundColor: Colors.yellow,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                     MyCart(index: widget.index,)));
                                      },
                                      child: Center(
                                        child: Text(
                                          'Add to Cart',
                                          style: GoogleFonts.fahkwang(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      )),
                                ),
                              ),
                              Container(
                                
                                child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder(),
                                        backgroundColor: Colors.green,
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyNow(index:widget.index)));
                                      },
                                      child: Center(
                                          child: Text(
                                        'Buy now',
                                        style: GoogleFonts.fahkwang(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )),
                                    )),
                              ),
                            ],
                          )
                  
                          
                          
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
      :
      Column(
        children: <Widget>[
          Container(
            height: height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/image-${widget.index + 1}.jpg'),
                  fit: BoxFit.cover),
            ),
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'My Coffee ${widget.index + 1}',
                style: GoogleFonts.eagleLake(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      const Shadow(
                          offset: Offset(2, 2),
                          color: Colors.black,
                          blurRadius: 10)
                    ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '1${widget.index + 1}0',
                    style: GoogleFonts.halant(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          const Shadow(
                              offset: Offset(2, 2),
                              color: Colors.black,
                              blurRadius: 10)
                        ]),
                  ),
                ),
                
                Text(
                  'Details',
                  style: GoogleFonts.halant(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const Shadow(
                            offset: Offset(2, 2),
                            color: Colors.black,
                            blurRadius: 10)
                      ]),
                ),
                
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Container(
                      width: width * 0.9,
                      child: const Text(
                          'Loremfdsjhbdvkwejbvskdbvkhskhdbvjhbwekbvksbdvbsdvbwhebfksbdvkjbwehbwjdhbffffffffffffffffffffffffffffffffffffddddddddddddddffffffffdkkkkkkkkkkkkkkrfhbaskdjfshdfhajfvakhbckjavskbaskhvbkasvbfkavdcjhhvsjdvbkjsbkjbljjsfgbiksjbgksdbgbruinofsdnflndjfiubrfoofnsdbvnovwuufoonvobouwbguwrihbljfnsdbfuirbfisbefiuwruigbwigbadkgsjbdbgibewiebiuwiugb')),
                ),
                
                     Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: Colors.yellow,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 MyCart(index: widget.index,)));
                                  },
                                  child: Center(
                                    child: Text(
                                      'Add to Cart',
                                      style: GoogleFonts.fahkwang(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: Colors.green,
                                  ),
                                  onPressed: () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>BuyNow(index: widget.index)));
                                    
                                  },
                                  child: Center(
                                      child: Text(
                                    'Buy now',
                                    style: GoogleFonts.fahkwang(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                                )),
                          ),
                        ],
                      )
              
              ],
            ),
          ),
        ],
      ),
    
    
    )
    
    );
  }
}
