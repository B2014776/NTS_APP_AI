import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../controllers/auth/AuthController.dart';
import '../../home/home.dart';

class VerifyScreen extends StatefulWidget {
  final VerifyArg? arg;
  final SignupInfo? signupInfo;

  const VerifyScreen({super.key, this.arg, this.signupInfo});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  final _keyTimer = GlobalKey<CustomTimerState>();

  bool isRemember = false;
  String code = "";

  listenForSms() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void initState() {
    super.initState();
    listenForSms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text(
          'Xác thực thông tin người dùng',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              widget.arg?.isPhone == true
                  ? Image.asset(
                      "assets/mobile-lock-icon-design-vector.jpg",
                      height: 200,
                    )
                  : Image.asset(
                      "assets/MailGuard.png",
                      height: 200,
                    ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.arg?.isPhone == true
                    ? "Xác thực số điện thoại để đăng ký tài khoản"
                    : "Xác thực email để đăng ký tài khoản",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3,
              ),
              const Text(
                "mã xác thực gồm 6 kí tự đã được gửi tới",
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.arg?.isPhone == true ? "+" : ""}${widget.arg?.value ?? " "} ",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.blue, width: 1))),
                      child: const Text(
                        "thay đổi",
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                    onTap: () {
                      /// TODO: Change phone number or email
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              PinFieldAutoFill(
                decoration: BoxLooseDecoration(
                  radius: Radius.circular(5),
                  strokeColorBuilder: FixedColorBuilder(Colors.blue),
                  bgColorBuilder: FixedColorBuilder(Colors.white),
                ),
                onCodeChanged: (value) {
                  code = value ?? "";
                },
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Text(
                    "- Mã xác nhận(OTP) sẽ hết hạn sau ",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  CustomTimer(
                      key: _keyTimer,
                      duration: Duration(minutes: 10),
                      onTimerFinish: () {
                        /// TODO: Timer finish
                      })
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "- ",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      children: [
                        const Text(
                          "Không nhận được mã xác nhận? ",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        InkWell(
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.blue, width: 1))),
                            child: const Text(
                              "Gửi lại",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          onTap: () async {
                            Map<String, dynamic> result =
                                await signUpController.sendVerificationCode();
                            if (result.containsKey('error')) {
                              print(
                                  'Gửi mã xác thực thất bại: ${result['error']}');
                            } else {
                              _keyTimer.currentState
                                  ?.setTimer(duration: Duration(minutes: 10));
                              _keyTimer.currentState?.startTimer();
                              print(
                                  "Mã xác thực đã được gửi lại và timer đã reset");
                            }
                          },
                        ),

                        // Text(
                        //   " hoặc ",
                        //   style: TextStyle(
                        //       fontSize: 16,
                        //       color: Colors.grey
                        //   ),
                        // ),
                        // InkWell(
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           border: Border(
                        //               bottom: BorderSide(
                        //                   color: Colors.blue,
                        //                   width: 1
                        //               )
                        //           )
                        //       ),
                        //       child: Text(
                        //         "Send to Email",
                        //         style: TextStyle(
                        //             fontSize: 16,
                        //             color: Colors.blue
                        //         ),
                        //       ),
                        //     ),
                        //     onTap: () {
                        //       /// TODO: Send code to email
                        //
                        //     }
                        // )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const Center(
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                  onTap: () async {
                    String phoneOrEmail = widget.arg?.value ?? "";

                    print("Code entered: $code");
                    print("PhoneOrEmail have to verify: $phoneOrEmail");

                    // Xác thực mã OTP
                    Map<String, dynamic> result = await signUpController.verifyCode(code);

                    if (result.containsKey('error')) {
                      // Hiển thị modal thông báo lỗi và nút quay về trang xác thực
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Xác thực thất bại'),
                            content: Text(result['error']),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Quay lại trang xác thực'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Map<String, dynamic> signUpResult = await signUpController.sendSignUpRequest();

                      if (signUpResult.containsKey('error')) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Đăng ký thất bại'),
                              content: Text(signUpResult['error']),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Thử lại'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Xác thực thành công'),
                              content: const Text('Bạn đã xác thực và đăng ký thành công!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                    );
                                  },
                                  child: const Text('Đến trang chủ'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  }


              ),

              SizedBox(
                height: 5,
              ),
              // Row(
              //   children: [
              //     Checkbox(
              //         activeColor: Colors.blue,
              //         visualDensity: VisualDensity(
              //             horizontal: -4,
              //             vertical: -4
              //         ),
              //         value: isRemember,
              //         onChanged: (value) {
              //           setState(() {
              //             isRemember = value ?? false;
              //           });
              //         }
              //     ),
              //     Text(
              //       "Remember this device. ",
              //       style: TextStyle(
              //           fontSize: 16,
              //           color: Colors.grey
              //       ),
              //     ),
              //     InkWell(
              //         child: Container(
              //           decoration: BoxDecoration(
              //               border: Border(
              //                   bottom: BorderSide(
              //                       color: Colors.blue,
              //                       width: 1
              //                   )
              //               )
              //           ),
              //           child: Text(
              //             "Learn More",
              //             style: TextStyle(
              //                 fontSize: 16,
              //                 color: Colors.blue
              //             ),
              //           ),
              //         ),
              //         onTap: () {
              //           /// TODO: Learn more
              //
              //         }
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }
}

class CustomTimer extends StatefulWidget {
  final Duration duration;
  final Function? onTimerFinish;

  const CustomTimer({super.key, required this.duration, this.onTimerFinish});

  @override
  State<CustomTimer> createState() => CustomTimerState();
}

class CustomTimerState extends State<CustomTimer> {
  int minutes = 0;
  int seconds = 0;

  setTimer({Duration? duration}) {
    if (duration != null) {
      minutes = duration.inMinutes;
      seconds = duration.inSeconds.remainder(60);
    } else {
      minutes = widget.duration.inMinutes;
      seconds = widget.duration.inSeconds.remainder(60);
    }
  }

  startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        timer.cancel();
        widget.onTimerFinish?.call();
      } else if (seconds == 0) {
        setState(() {
          minutes--;
          seconds = 59;
        });
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  initState() {
    super.initState();
    setTimer();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$minutes:${seconds < 10 ? "0$seconds" : seconds}",
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class VerifyArg {
  final bool isPhone;
  final String value;

  VerifyArg({required this.isPhone, required this.value});
}

class SignupInfo {
  final String fullName;
  final String phoneOrEmail;
  final String password;
  final String confirmPassword;

  SignupInfo({
    required this.fullName,
    required this.phoneOrEmail,
    required this.password,
    required this.confirmPassword,
  });

  @override
  String toString() {
    return 'SignupInfo(fullName: $fullName, phoneOrEmail: $phoneOrEmail, password: $password, confirmPassword: $confirmPassword)';
  }
}
