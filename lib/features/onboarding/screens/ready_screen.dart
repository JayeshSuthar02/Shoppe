  import 'package:flutter/material.dart';
import 'package:shoppe/features/profile/screens/profile_screen.dart';
import 'package:shoppe/features/home/screens/main_screen.dart';

class ReadyScreen extends StatefulWidget{
  const ReadyScreen({super.key});

  @override
  State<ReadyScreen> createState() => _ReadyScreenState();
}

class _ReadyScreenState extends State<ReadyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                        left: 25,
                        right: 25
                      ),
                  child:
                      Stack(
                        children: [
                          Container(
                    height: 550,
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(
                      top: 60
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 5),
                        )
                      ]
                    ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/ready.png'
                                ),
                                const SizedBox(height: 15,),
                                Text(
                                  'Ready?',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18
                                  ),
                                ),
                                const SizedBox(height: 35,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfileScreen()
                                      )
                                    );
                                  },
                                  child:
                                      Padding(
                                          padding:EdgeInsets.only(
                                            left: 25,
                                            right: 25
                                          ),
                                          child:
                                    Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          minimumSize: Size(double.infinity, 40),
                                        ),
                                          onPressed: (){
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder:(context) => const MainScreen()
                                            )
                                            );
                                          },

                                          child: Text(
                                            'Let\'s Start',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))
                                    ),
                                  ),
                                )
                              ],
                            ),
                  ),
                ]
                      )
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          shape: BoxShape.circle,
                        ),
                      ),

                    ],
                  )
                ],
              ),
            )
    )
    );
  }
}