import 'package:flutter/material.dart';
import 'package:notes2/widget/const/const.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    this.controller,
    this.hint,
    required this.prefixIcon,
    this.keyboard,
    this.showObscure,
    this.obscure = false,
  });
  final TextEditingController? controller;
  final String? hint;
  final IconData prefixIcon;
  final TextInputType? keyboard;
  final bool? showObscure;
  late bool? obscure;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(5),
      //   border: Border.all(
      //     color: Colors.white,
      //     width: 2,
      //   ),
      // ),
      child: TextFormField(
        textCapitalization: TextCapitalization.characters,
        validator: (value) {
          if (value == '') {
            return ' Required Field ${widget.hint} '.toLowerCase();
          } else if (value!.length < 6) {
            return 'field provided is too weak';
          } else {
            return null;
          }
        },
        keyboardType: widget.keyboard,
        obscureText: widget.obscure!,
        obscuringCharacter: '*',
        controller: widget.controller,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          labelText: widget.hint,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: colorLogo,
          ),
          suffixIcon: widget.showObscure == true
              ? IconButton(
                  onPressed: () {
                    widget.obscure = !widget.obscure!;
                    setState(() {});
                  },
                  icon: Icon(
                    widget.obscure! ? Icons.visibility_off : Icons.visibility,
                    color: colorLogo,
                  ),
                )
              : null,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.blueGrey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: colorLogo,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: colorLogo,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
