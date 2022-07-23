import 'package:flutter/material.dart';
import 'package:thien_220714/key_board.dart';
import 'package:thien_220714/login_page.dart';
import 'package:thien_220714/main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isObscure = true;
  bool isIconVisible = false;
  var user1 = UserInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {
            hideKeyBoardAndUnFocus(BuildContext, context);
          },
          behavior: HitTestBehavior.translucent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                          width: 300,
                          child: Image.asset('assets/starcity_logo.png')),
                      TextField(
                        onChanged: (value) {
                          user1.userName = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Họ & Tên",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        onChanged: (value) {
                          user1.userPhoneNumber = value;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Số điện thoại",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              isIconVisible = false;
                            });
                          } else {
                            setState(() {
                              isIconVisible = true;
                            });
                          }
                          user1.userPassWord = value;
                        },
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          suffixIcon: isIconVisible ? IconButton(
                            icon: Icon(isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              }
                              );
                            },
                          ) : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Mật khẩu",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                child: const Text('Register'),
                                onPressed: () {
                                  showDialog(
                                      context: context, builder: (context) =>
                                      AlertDialog(
                                        title: const Text('Đăng kí thành công'),
                                        content: const Text(
                                            "Nhấn 'Đồng Ý' để quay lại màn hình đăng nhập"),
                                        actions: [
                                          ElevatedButton(child: Text('Đồng Ý'),
                                            onPressed: () {
                                            // Navigator.popUntil(context, (route) {
                                            //   return route.settings.name == "abc";
                                            // });
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                      const LoginPage()));
                                            },)
                                        ],
                                      ));
                                },
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              RichText(
                text: const TextSpan(
                    text: 'Hotline: ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: '1800 1186',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
