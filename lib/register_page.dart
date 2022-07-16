import 'package:flutter/material.dart';
import 'package:thien_220714/login_page.dart';

class register_page extends StatefulWidget {
  const register_page({Key? key}) : super(key: key);

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            }
                            );
                          },
                        ),
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
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    const login_page()));
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
    );
  }
}
