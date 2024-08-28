import 'package:flutter/material.dart';
import 'package:task/data/validator/validator.dart';
import 'package:task/main.dart';
import 'package:task/widget/custom_text.dart';
import 'package:task/widget/custom_text_form_field.dart';
import 'package:task/widget/custom_elevated_button.dart';
import 'package:task/screens/login_screen.dart';
import 'package:task/data/auth/app_authentication.dart' ;









class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController? mailRegisterController = TextEditingController();
  TextEditingController? passwordRegisterController = TextEditingController();
  TextEditingController? nameRegisterController = TextEditingController();
  TextEditingController? phoneRegisterController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isVisbilty = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Register'),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    controller: mailRegisterController,
                    validator: AppValidator.validateText,
                    prefixIcon: const Icon(Icons.mail),
                    hintText: 'Enter Mail',
                    label: 'Mail',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    controller: passwordRegisterController,
                    validator: AppValidator.validateText,
                    hintText: "Enter Password",
                    label: 'Password',
                    obscureText: isVisbilty,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: () {
                          isVisbilty = !isVisbilty;
                          setState(() {});
                        },
                        child: isVisbilty
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    controller: nameRegisterController,
                    validator: AppValidator.validateText,
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Enter Name',
                    label: 'Name',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    controller: phoneRegisterController,
                    validator: AppValidator.validateText,
                    prefixIcon: const Icon(Icons.phone),
                    hintText: 'Enter Phone',
                    label: 'Phone',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    child: CustomElevatedButton(
                      isLoading: isLoading,
                      textButton: 'Register',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          await AppAuthentication.register(
                            context: context,
                            mail: mailRegisterController!.text,
                            password: passwordRegisterController!.text,
                            name: nameRegisterController!.text,
                            phone: phoneRegisterController!.text,
                          ).then(
                                (success) {
                              setState(() {
                                isLoading = false;
                              });
                              if (success) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  MainScreen(),
                                  ),
                                      (route) => false,
                                );
                              }
                            },
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                                (route) => false,
                          );
                        },
                        child: const CustomText(
                          text: 'Already have account',
                          sizeText: 15,
                          colorText: Colors.blue,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}