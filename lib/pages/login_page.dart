import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late FToast fToast;

  bool isPasswordVisible = false;
  bool isShowPasswordError = false;
  bool isRemember = false;
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  // TITLE
                  title(),
                  // EMAIL TEXT INPUT
                  emailInput(),
                  // PASSWORD TEXT INPUT
                  passwordInput(),
                  // REMEMBER CHECKBOX
                  rememberCheckBox(),
                  // LOGIN BUTTON
                  loginButton(),
                  // SEPARATOR
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: Text(
                        'OR',
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semibold,
                        ),
                      ),
                    ),
                  ),
                  // ANOTHER SIGN IN METHOD
                  googleLoginButton(),
                ],
              ),
            ),
            // REGISTER BUTTON
            registerButton(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login to your\nAccount',
            style: blackTextStyle.copyWith(
              color: blackAccent,
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 90,
                height: 4,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: blackColor,
                ),
              ),
              Container(
                width: 9,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: blackColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget emailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 48),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteGrey,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration.collapsed(
          hintText: 'Email',
          hintStyle: greyTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
        ),
      ),
    );
  }

  Widget passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 32),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: whiteGrey,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password',
                    hintStyle: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: greyColor,
                  size: 24,
                ),
              )
            ],
          ),
        ),
        if (isShowPasswordError)
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              'Password Kamu Salah!',
              style: blackTextStyle.copyWith(color: redColor, fontSize: 12),
            ),
          )
      ],
    );
  }

  Widget rememberCheckBox() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: isRemember,
              onChanged: (value) {
                setState(() {
                  isRemember = value!;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Remember Me',
            style: blackTextStyle.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget loginButton() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });

          Future.delayed(const Duration(seconds: 3), () {
            setState(() {
              isLoading = false;
            });
            if (passwordController.text != 'harun') {
              setState(() {
                isShowPasswordError = true;
              });
              fToast.showToast(
                child: errorToast(),
                toastDuration: const Duration(seconds: 3),
                gravity: ToastGravity.BOTTOM,
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            }
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: blackAccent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: whiteColor,
                backgroundColor: greyColor,
              )
            : Text(
                'Login',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semibold,
                ),
              ),
      ),
    );
  }

  Widget googleLoginButton() {
    return GestureDetector(
      onTap: () {
        print('Login With Google');
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        width: double.infinity,
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/img_google.png', width: 24),
            const SizedBox(width: 12),
            Text(
              'Login with Google',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget registerButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: RichText(
        text: TextSpan(
          text: 'Don\'t have an account? ',
          style: greyTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
          children: [
            TextSpan(
              text: 'Register',
              recognizer: TapGestureRecognizer()
                ..onTap = () => print('Register Button Clicked'),
              style: blackTextStyle.copyWith(
                color: blueColor,
                fontSize: 16,
                fontWeight: semibold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget errorToast() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Password Salah',
        style: whiteTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semibold,
        ),
      ),
    );
  }
}
