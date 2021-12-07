import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInInput extends StatefulWidget {
  const LogInInput(
      {Key? key,
      this.prefix,
      this.suffix,
      this.hint,
      required this.nextOrDone,
      required this.obscured,
      required this.inputType})
      : super(key: key);

  final IconData? prefix;
  final bool? suffix;
  final String? hint;
  final bool nextOrDone;
  final bool obscured;
  final TextInputType inputType;
  @override
  _LogInInputState createState() => _LogInInputState();
}

class _LogInInputState extends State<LogInInput> {
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
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 5),
      child: TextFormField(
        textInputAction:
            widget.nextOrDone ? TextInputAction.next : TextInputAction.done,
        keyboardType: widget.inputType,
        style: TextStyle(color: Colors.black),
        obscureText: obscured,
        obscuringCharacter: '*',
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(),
            prefixIcon: Icon(widget.prefix!),
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
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white))),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.hint == "Phone Number"
                ? "Enter Your Phone Number"
                : "Enter The Password";
          }
          return null;
        },
      ),
    );
  }
}
