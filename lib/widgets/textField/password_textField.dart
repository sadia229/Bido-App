import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class PasswordTextField extends StatefulWidget {
  final String label;
  final Icon icon;

  PasswordTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
  });

  TextEditingController controller = TextEditingController();

  @override
  State<PasswordTextField> createState() => _MaterialTextFieldState();
}

class _MaterialTextFieldState extends State<PasswordTextField> {
  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fillup';
          }
          return null;
        },
        obscureText: _passwordVisible,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          hintText: widget.label,
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black.withOpacity(0.5),
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.2), width: 1.0),
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.2), width: 2.0),
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }
}
