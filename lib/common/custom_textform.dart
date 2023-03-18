import 'package:flutter/material.dart';

class CustomFormTextfield extends StatelessWidget {
  final TextInputType type;
  final String lableText;
  Widget? suffixIcon;
  final IconData prefix;
  final String hintText;
  final bool obscure;
  final controller;
  String? Function(String?)? Validator;

  // String? _errorMessage(String str) {
  //   switch (hintText) {
  //     case "Enter your UserName":
  //       return "Name is empty !";
  //     case "Enter your Phone":
  //       return "Phone is empty !";
  //     case "Enter your Email":
  //       return "Email is empty !";
  //     case "Enter your Password":
  //       return "Password is empty !";
  //   }
  // }

  CustomFormTextfield({
    super.key,
    required this.hintText,
    required this.lableText,
    required this.prefix,
    required this.type,
    required this.obscure,
    required this.controller,
    this.Validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: Validator,
      controller: controller,
      keyboardType: type,
      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: Icon(
          prefix,
          color: Colors.grey,
        ),
        labelText: lableText,
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
    );
  }
}

Widget defaultButton({
  required String text,
  double? height,
  void Function()? onTap,
}) =>
    latBotton(
      child: Container(
        width: 200,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 20, right: 20),
        height: 54,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [(new Color(0xffDC54FE)), new Color(0xff8A02AE)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xffEEEEEE),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

latBotton({required Container child}) {}
