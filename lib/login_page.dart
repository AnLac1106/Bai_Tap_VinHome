import 'package:flutter/material.dart';
import 'package:thien_220714/register_page.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
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
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
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
                          child: TextButton(
                            child: const Text('Register'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const register_page()));
                            },
                          ),
                        ),
                        Expanded(
                            child: ElevatedButton(
                          child: const Text('Login'),
                          onPressed: () {
                            showDialog(context: context, builder: (context) => AlertDialog(
                              title: Text('Thành Công'),
                              content: Text ('Đăng nhập thành công'),
                              actions: [
                                ElevatedButton(child: Text('OK'), onPressed: () {
                                  Navigator.pop(context);
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
