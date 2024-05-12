import 'package:coffee_shop/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return SafeArea(
      child: Scaffold(
        body: 
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background-image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: SingleChildScrollView(
              child: MediaQuery.of(context).size.width>600?
              Column(
                children: <Widget>[
                  Text('Caffeine Hub',
                      style: GoogleFonts.hahmlet(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            const Shadow(
                                offset: Offset(2, 2),
                                color: Colors.black,
                                blurRadius: 10)
                          ])),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    'Your Perfect Coffee Hub',
                    style: GoogleFonts.habibi(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        shadows: [
                          const Shadow(
                              offset: Offset(2, 2),
                              color: Colors.black,
                              blurRadius: 10)
                        ]),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Container(
                    width: width*0.4,
                    child: Text(
                        'aljfnkdbcbvcladjhdbvjkhjsdbvhsdbvjhsbdvhjbdsvsdjhvshkvbkjsdbvkjsdbvkjsdbvkjsdbvkjsdbvksbksbvkbskvbskvbskvbksdbvjksdbvkjsbvkjsbvjkwbdkveruigfuiwgfvieblwsbkjvbksjnvkjabfkjsjhfksjfkhfasdjkbfkjsbfhkshfjhsdfkhsggkbavkjbsdfkshdfkdfhkdfhskudfsdkjfckjajsbfkqbecbakjsbckabsvkcjaskjbakjbfbfoabfkhkhsdbdfjkhsbdvjhshdvkhsbdkvbsdjvbskdbvskdbvkhsdbvkcsd kvvcbsdkvbljasbfjkbqekjfbkjaksbckjabskfjbskjbfkasbfkjajbsfkjbaskjfbaksjbfkabfaskfjbafkjbnfdkfakbsfkjajbdkfjbaskjjbfkajsbfbaskfbbakbfkjajsbfkjabsdkjfbaksjb'),
                  ),
                SizedBox(height: height*0.35,),
                
                Container(
                  width: width*0.2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                    ),
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage())), child: Center(child: Text('Get Started',style: GoogleFonts.fahkwang(color:Colors.black,fontSize:20,fontWeight:FontWeight.w600),),)))
                ],
              )
            :
            Column(
                children: <Widget>[
                  Text('Caffeine Hub',
                      style: GoogleFonts.hahmlet(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            const Shadow(
                                offset: Offset(2, 2),
                                color: Colors.black,
                                blurRadius: 10)
                          ])),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Your Perfect Coffee Hub',
                    style: GoogleFonts.habibi(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        shadows: [
                          const Shadow(
                              offset: Offset(2, 2),
                              color: Colors.black,
                              blurRadius: 10)
                        ]),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    width: width*0.7,
                    child: Text(
                        'aljfnkdbcbvcladjhdbvjkhjsdbvhsdbvjhsbdvhjbdsvsdjhvshkvbkjsdbvkjsdbvkjsdbvkjsdbvkjsdbvksbksbvkbskvbskvbskvbksdbvjksdbvkjsbvkjsbvjkwbdkveruigfuiwgfvieblwsbkjvbksjnvkjabfkjsjhfksjfkhfasdjkbfkjsbfhkshfjhsdfkhsggkbavkjbsdfkshdfkdfhkdfhskudfsdkjfckjajsbfkqbecbakjsbckabsvkcjaskjbakjbfbfoabfkhkhsdbdfjkhsbdvjhshdvkhsbdkvbsdjvbskdbvskdbvkhsdbvkcsd kvvcbsdkvbljasbfjkbqekjfbkjaksbckjabskfjbskjbfkasbfkjajbsfkjbaskjfbaksjbfkabfaskfjbafkjbnfdkfakbsfkjajbdkfjbaskjjbfkajsbfbaskfbbakbfkjajsbfkjabsdkjfbaksjb'),
                  ),
                SizedBox(height: height*0.22,),
                
                Container(
                  width: width*0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                    ),
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage())), child: Center(child: Text('Get Started',style: GoogleFonts.fahkwang(color:Colors.black,fontSize:20,fontWeight:FontWeight.w600),),)))
                ],
              ),
            
            ),
          ),
        )

      
      ),
    );
  }
}
