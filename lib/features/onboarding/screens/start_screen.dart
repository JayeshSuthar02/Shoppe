
import 'package:flutter/material.dart';
import 'package:shoppe/features/auth/screens/create_account.dart';
import 'package:shoppe/features/auth/screens/login_screen.dart';

class StartScreen extends StatelessWidget{
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 5),
                              )
                            ]
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(20),

                              child: SizedBox(
                                width: 92,
                                height: 92,
                                child: Image.asset('assets/images/logo.png',
                                    fit: BoxFit.contain),
                              ),
                            )
                        )
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      'Shoppe',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12,),

                    Text(
                      'Beatiful eCommerce UI kit \n for your online store',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 25,),


                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount()
                          )
                        );
                      },

                    child: Container(
                        margin: const EdgeInsets.only(
                            top: 50,
                            left: 15,
                            right: 15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            'Let\'s get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ),
                    ),

                    SizedBox(height: 15,),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                          )
                        );
                      },
                      child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            'I already have an account  ',
                          ),
                          Icon(Icons.arrow_circle_right,
                            color: Colors.blue,)
                        ]
                    )
          )


                  ],
                ),
              )
          ),
        )
    );
  }
}