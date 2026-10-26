import 'package:flutter/material.dart';
import 'package:shoppe/features/home/screens/home_screen.dart';

class PasswordScreen extends StatefulWidget{
  const PasswordScreen({super.key});
  
  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}


class _PasswordScreenState extends State<PasswordScreen> {

  String errorMessage = '';

  final List<TextEditingController> controllers = List.generate(
     4,
      (index) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(
     4,
      (index) => FocusNode(),
  );

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }



     @override
  Widget build(BuildContext context){
       return Scaffold(
           body:SafeArea(
             child: SingleChildScrollView(
               child: Column(
             children: [
               Center(
                 child: Container(
                   margin: EdgeInsets.only(
                     top: 90
                   ),

                 child: Stack(
                   alignment: Alignment.center,
                   children: [
                    Container(
                 width: 150,
                 height: 150,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Colors.grey.shade200
                 ),
               ),
                     Image.asset(
                       'assets/images/profile.png',
                        fit: BoxFit.contain,
                        height: 120,
                       width: 120,

                     )
             ]
               )
       ),
               ),
               const SizedBox(height: 15,),
               Text(
                 'Hello, Romina !!!',
                 style: TextStyle(
                   fontSize: 36,
                   fontWeight: FontWeight.bold
                 ),
               ),

               const SizedBox(height: 25,),

               Text(
                 'Type your password',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18
                  ),
               ),
               const SizedBox(height: 15,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [

                  SizedBox(
                    height: 55,
                    width: 55,
                    child: TextField(
                      controller: controllers[0],
                      focusNode: focusNodes[0],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      onChanged: (value){
                        if(value.isNotEmpty){
                          FocusScope.of(context).requestFocus(focusNodes[1]);
                        }
                      },
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),

                    ),
                  ),


                   const SizedBox(width: 15,),

                     SizedBox(
                     height: 55,
                     width: 55,
                     child: TextField(
                       controller: controllers[1],
                       focusNode: focusNodes[1],
                       keyboardType: TextInputType.number,
                       maxLength: 1,
                       textAlign: TextAlign.center,
                       obscureText: true,
                       onChanged: (value){
                         if(value.isNotEmpty){
                           FocusScope.of(context).requestFocus(focusNodes[2]);
                         } else {
                           FocusScope.of(context).requestFocus(focusNodes[0]);
                         }

                       },
                       decoration: InputDecoration(
                         counterText: '',
                         filled: true,
                         fillColor: Colors.grey.shade200,
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide.none,
                         ),
                       ),
                     ),
                   ),




                   const SizedBox(width: 15,),

                   SizedBox(
                     height: 55,
                     width: 55,
                     child: TextField(
                       controller: controllers[2],
                       focusNode: focusNodes[2],
                       keyboardType: TextInputType.number,
                       maxLength: 1,
                       textAlign: TextAlign.center,
                       obscureText: true,
                       onChanged: (value){
                         if(value.isNotEmpty){
                           FocusScope.of(context).requestFocus(focusNodes[3]);
                         } else {
                           FocusScope.of(context).requestFocus(focusNodes[1]);
                         }
                       },
                       decoration: InputDecoration(
                         counterText: '',
                         filled: true,
                         fillColor: Colors.grey.shade200,
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide.none,
                         ),
                       ),
                   ),
                   ),


                   const SizedBox(width: 15,),


                   SizedBox(
                     height: 55,
                     width: 55,
                     child: TextField(
                       controller: controllers[3],
                       focusNode: focusNodes[3],
                       keyboardType: TextInputType.number,
                       maxLength: 1,
                       textAlign: TextAlign.center,
                       obscureText: true,

                       onChanged: (value){
                         if(value.isEmpty){
                           FocusScope.of(context).requestFocus(focusNodes[2]);
                         } else {
                           checkpassword();
                         }
                       },
                       onSubmitted: (value){
                         checkpassword();
                       },

                       decoration: InputDecoration(
                         counterText: '',
                         filled: true,
                         fillColor: Colors.grey.shade200,
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide.none,
                         ),
                       ),
                   )
                   ),
                   ]

               ),
               errorMessage.isNotEmpty
                  ? Padding(
                   padding: const EdgeInsets.only(top: 15),
                   child: Text(
                     errorMessage,
                     style: const TextStyle(
                       color: Colors.red,
                       fontSize: 16
                     ),
                   ),
                 )
               : const SizedBox.shrink(),



               const SizedBox(height: 200,),
               Padding(
                   padding: EdgeInsets.only(
                     bottom: 40,
                   ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     'Not you?',
                     style: TextStyle(
                       fontSize: 16,
                       color: Colors.black54,
                     ),
                   ),
                   const SizedBox(width: 8,),
                   Icon(Icons.arrow_circle_right,
                   color: Colors.blue,)
                 ],
               )
               )
             ],
           )
         ),
           )
       );
     }

     void checkpassword(){
    String password =
        controllers[0].text +
    controllers[1].text +
    controllers[2].text +
    controllers[3].text;

     if(password == '1234'){
       Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) => HomeScreen(),
           )
       );
     } else {
        setState(() {
          errorMessage = 'Wrong password';

          for (final controller in controllers) {
            controller.clear();
          }
        });
        FocusScope.of(context).requestFocus(focusNodes[0]);
     }
     }


}