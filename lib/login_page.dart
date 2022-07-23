import 'package:flutter/material.dart';
import 'package:thien_220714/home_page.dart';
import 'package:thien_220714/key_board.dart';
import 'package:thien_220714/main.dart';
import 'package:thien_220714/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  bool isIconVisible = false;
  late String? inputPhoneNumber;
  late String? inputPassWord;

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
                        onChanged: (index) {
                          inputPhoneNumber = index;
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
                          hintText: "0123456789",
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
                          inputPassWord = value;
                        },
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          suffixIcon: isIconVisible
                              ? IconButton(
                                  icon: Icon(isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                )
                              : null,
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
                            child: TextButton(
                              child: const Text('Register'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage(), ));
                              },
                            ),
                          ),
                          Expanded(
                              child: ElevatedButton(
                                  child: const Text('Login'),
                                  onPressed: () {
                                    if(inputPhoneNumber == UserInfo().userPhoneNumber && inputPassWord == UserInfo().userPassWord) {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const HomePage()),
                                              (route) => false);
                                    } else {
                                      showDialog(
                                          context: context, builder: (context) =>
                                          AlertDialog(
                                            title: const Text('Đăng nhập không thành công'),
                                            content: const Text(
                                                "Sai tên đăng nhập hoặc mật khẩu"),
                                            actions: [
                                              ElevatedButton(child: Text('Đồng Ý'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },)
                                            ],
                                          ));
                                    }
                                  }
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
