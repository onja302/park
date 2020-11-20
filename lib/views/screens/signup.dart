import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/models/user.dart' as userModel;
import 'package:share_your_park/views/screens/car.dart';
import 'package:validators/validators.dart';
import 'package:share_your_park/const.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool test = true;
  final _formkey = GlobalKey<FormState>();
  String currentFirstName = '';
  String currentLastName;
  String currentEmail;
  String currentAdress;
  int currentCodePostal;
  String currentNumeroPhone;
  userModel.UserInformation newUser = userModel.UserInformation();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          child: Container(
            child: Column(children: [
              Container(
                  height: size.height / 2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0xFFFF008D),
                        Color(0xFFFF6EBE),
                      ])),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: screenWidth * 0.13,
                              top: screenHeight * 0.01),
                          child: Align(
                            alignment: Alignment(0, 1),
                              child: Container(
                    child:  Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChatBubble(
                          margin: EdgeInsets.only(top: screenHeight * 0.1),
                              alignment: Alignment.center,clipper: ChatBubbleClipper3(type: BubbleType.sendBubble),
                              backGroundColor: Colors.white,
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: screenWidth * 0.45,
                                      ),
                                      child: Text(
                                        'Allez, viens! On est bien 😎',
                                        style: TextStyle(color: Color(0xFFFF008D)),
                                        )),
                          ),
                          SizedBox(height: screenHeight * 0.01,),
                          Image.asset('assets/images/seepy.png',
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.2
                          
                          ),

                      ],
                      ),
                  ),
                          ),
                        ),
                        //
                        Center(
                            child: Text("Enregistre-toi !",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (144 / screenHeight) * 100,
                                    fontFamily: 'Quicksand')))
                      ],
                    ),
                  )),
              Container(
                height: screenHeight * 0.02,
                color: Color(0xFFA3005A),
              ),
              Form(
                key: _formkey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Row(
                      children: [
                        Expanded(
                          //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: kinputdeco,
                              prefixIcon: Icon(FontAwesome.user,
                                  color: Color(0xFFFF008D)),
                              labelText: 'Nom',
                              labelStyle: const TextStyle(
                                color: Color(0xFFFF008D),
                                fontSize: 15,
                              ),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'obligatoire' : null,
                            onChanged: (val) =>
                                setState(() => currentFirstName = val),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.025,
                        ),
                        Expanded(
                          //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: kinputdeco,
                              labelText: 'Prénom',
                              isDense: true,
                              labelStyle: const TextStyle(
                                color: Color(0xFFFF008D),
                                fontSize: 15,
                              ),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'obligatoire' : null,
                            onChanged: (val) =>
                                setState(() => currentLastName = val),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40.0,
                      right: 40,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: kinputdeco,
                              prefixIcon: Icon(FontAwesome.home,
                                  color: Color(0xFFFF008D)),
                              labelText: 'Adresse',
                              labelStyle: const TextStyle(
                                color: Color(0xFFFF008D),
                                fontSize: 15,
                              ),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'obligatoire' : null,
                            onChanged: (val) =>
                                setState(() => currentAdress = val),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.025,
                        ),
                        Expanded(
                          //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: kinputdeco,
                              labelText: 'Code postal',
                              hintText: 'xxxx',
                              labelStyle: const TextStyle(
                                color: Color(0xFFFF008D),
                                fontSize: 15,
                              ),
                            ),
                            validator: (val) =>
                                isNumeric(val) != true || val.length != 4
                                    ? 'obligatoire'
                                    : null,
                            onChanged: (val) => setState(
                                () => currentCodePostal = int.parse(val)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    height: screenHeight * 0.09,
                    width: screenWidth * 0.78,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: kinputdeco,
                        prefixIcon:
                            Icon(FontAwesome.phone, color: Color(0xFFFF008D)),
                        labelText: 'Numéro de téléphone',
                        hintText: 'xxxxxxxxx',
                        labelStyle: const TextStyle(
                          color: Color(0xFFFF008D),
                          fontSize: 15,
                        ),
                      ),
                      validator: (val) => isNumeric(val) != true ||
                              val.length != 9
                          ? 'Numéro de téléphone obligatoire'
                          : null,
                      onChanged: (val) =>
                          setState(() => currentNumeroPhone = val),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Container(
                    height: screenHeight * 0.09,
                    width: screenWidth * 0.78,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: kinputdeco,
                        prefixIcon: Icon(FontAwesome.envelope,
                            color: Color(0xFFFF008D)),
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          color: Color(0xFFFF008D),
                          fontSize: 15,
                        ),
                      ),
                      validator: (val) => EmailValidator.validate(val) == false
                          ? 'Email obligatoire'
                          : null,
                      onChanged: (val) => setState(() => currentEmail = val),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    height: screenHeight * 0.09,
                    width: screenWidth * 0.78,
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: kinputdeco,
                        prefixIcon:
                            Icon(FontAwesome.lock, color: Color(0xFFFF008D)),
                        labelText: 'Mot de passe',
                        labelStyle: const TextStyle(
                          color: Color(0xFFFF008D),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
                  Container(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.7,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: Color(0xFFFF008D),
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            newUser.setFirstName(currentFirstName);
                            newUser.setLastName(currentLastName);
                            newUser.setNumeroPhone(currentNumeroPhone);
                            newUser.setEmail(currentEmail);
                            newUser.setCodePostal(currentCodePostal);
                            newUser.setAdress(currentAdress);
                            newUser.setFirstSign(true);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Car(
                                          newUser: newUser,
                                        )));
                          }
                        },
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.05,
                              fontFamily: 'Quicksand'),
                        )),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
