import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationInput extends StatefulWidget {
  const RegistrationInput(
      {Key? key,
      this.prefix,
      this.suffix,
      required this.hint,
      required this.nextOrDone,
      required this.obscured,
      required this.inputType})
      : super(key: key);

  final IconData? prefix;
  final bool? suffix;
  final String hint;
  final bool nextOrDone;
  final bool obscured;
  final TextInputType inputType;

  @override
  _RegistrationInputState createState() => _RegistrationInputState();
}

class _RegistrationInputState extends State<RegistrationInput> {
  final formKey = GlobalKey<FormState>();

  bool obscured = true;

  @override
  void initState() {
    obscured = widget.obscured;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        textInputAction:
            widget.nextOrDone ? TextInputAction.next : TextInputAction.done,
        keyboardType: widget.inputType,
        style: TextStyle(color: Colors.white),
        obscureText: obscured,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold),
          prefixIcon: Icon(widget.prefix),
          suffixIcon: widget.suffix!
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscured = !obscured;
                    });
                  },
                  icon: obscured
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off))
              : null,
          fillColor: Colors.white,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.hint == "User Name"
                ? "Enter Your UserName"
                : widget.hint == "Phone Number"
                    ? "Enter The PhoneNumber"
                    : widget.hint == "Password"
                        ? "Enter The Password"
                        : widget.hint == "Confirm Password"
                            ? "Enter The Password Again"
                            : "Enter Your Address";
          }
          return null;
        },
      ),
    );
  }
}
