import 'package:apptestai/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool isChecked = false;
  TextEditingController email =
      TextEditingController(text: 'batungx271@gmail.com');
  TextEditingController password = TextEditingController(text: '12345678');

  late Box box1;

  @override
  void initState() {
    //
    super.initState();
    createBox();
  }

  void createBox() async {
    box1 = await Hive.openBox('logininfo');
    getdata();
  }

  void getdata() async {
    if (box1.get('email') != null) {
      email.text = box1.get('email');
      isChecked = true;
      setState(() {});
    }
    if (box1.get('password') != null) {
      password.text = box1.get('password');
      isChecked = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: email,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: password,
                            style: const TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Remember Me",
                                style: TextStyle(color: Colors.black),
                              ),
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  isChecked = !isChecked;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return HomePage();
                                          },
                                        ),
                                      );
                                      login();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    if (isChecked) {
      box1.put('email', email.text);
      box1.put('password', password.text);
    }
    print(box1);
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import 'animation/fade_animation.dart';
// class LoginPage2 extends StatefulWidget {
//   const LoginPage2({super.key});
//
//   @override
//   _LoginPage2State createState() => _LoginPage2State();
// }
// class _LoginPage2State extends State<LoginPage2> {
//   @override
//   Widget build(BuildContext context) {
//     var wid = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               Container(
//                 color: const Color(0xfff96d34),
//                 // color: const Color(0xFFC73800),
//                 width: wid,
//                 height: 350,
//                 child: SvgPicture.asset(
//                   "images/wave8.svg",
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               // ! 0x00FFFFFF
//               const Positioned(
//                 top: 100,
//                 left: 45,
//                 child: FadeAnimation(
//                   2,
//                   Text(
//                     "Yoovi ™",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 50,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 2,
//                         fontFamily: "Lobster"),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           // ! Here input
//
//           Expanded(
//             child: Container(
//               color: const Color(0xfff96d34),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Column(
//                   children: [
//                     FadeAnimation(
//                       2,
//                       Container(
//                           width: double.infinity,
//                           height: 240,
//                           margin: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 20),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 5),
//                           decoration: const BoxDecoration(
//                             // border: Border.all(
//                             //     color: const Color(0xff4f1ed2), width: 1),
//                             // boxShadow: const [
//                             //   BoxShadow(
//                             //       color: Color(0xff4f1ed2),
//                             //       blurRadius: 10,
//                             //       offset: Offset(1, 1)),
//                             // ],
//                               color: Colors.white,
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(20))),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   const Icon(Icons.person_outline),
//                                   Expanded(
//                                     child: Container(
//                                       margin: const EdgeInsets.only(left: 10),
//                                       child: TextFormField(
//                                         maxLines: 1,
//                                         decoration: const InputDecoration(
//                                           label: Text(" User-Name ..."),
//                                           border: InputBorder.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Divider(
//                                 height: 5,
//                                 thickness: 3,
//                                 indent: 50,
//                                 endIndent: 50,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   const Icon(Icons.email_outlined),
//                                   Expanded(
//                                     child: Container(
//                                       margin: const EdgeInsets.only(left: 10),
//                                       child: TextFormField(
//                                         maxLines: 1,
//                                         decoration: const InputDecoration(
//                                           label: Text(" E-mail ..."),
//                                           border: InputBorder.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Divider(
//                                 height: 5,
//                                 thickness: 3,
//                                 indent: 50,
//                                 endIndent: 50,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   const Icon(Icons.password_outlined),
//                                   Expanded(
//                                     child: Container(
//                                       margin: const EdgeInsets.only(left: 10),
//                                       child: TextFormField(
//                                         maxLines: 1,
//                                         decoration: const InputDecoration(
//                                           label: Text(" Password ..."),
//                                           border: InputBorder.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     FadeAnimation(
//                       2,
//                       Container(
//                         margin: const EdgeInsets.only(left: 22, right: 22),
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                               foregroundColor: const Color(0xff4f1ed2), shadowColor: const Color(0xff4f1ed2),
//                               elevation: 18,
//                               padding: EdgeInsets.zero,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15))),
//                           child: Ink(
//                             decoration: BoxDecoration(
//                               gradient: const LinearGradient(colors: [
//                                 Color(0xff4f1ed2),
//                                 Color(0xff4f1ed2)
//                               ]),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Container(
//                               width: wid - 20,
//                               height: 50,
//                               alignment: Alignment.center,
//                               child: const Text(
//                                 'Login',
//                                 style: TextStyle(
//                                   fontSize: 30,
//                                   color: Colors.white,
//                                   letterSpacing: 2,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(top: 30),
//                       child: const Text(
//                         "SingUp if don't have account ",
//                         style: TextStyle(
//                           color: Colors.white,
//                           letterSpacing: 2,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }}