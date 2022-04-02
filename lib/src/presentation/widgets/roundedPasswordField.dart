import 'package:dev_guide/src/presentation/resources/fontManager.dart';
import 'package:flutter/material.dart';

import '../resources/valuesManager.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final IconData? icon;
  final dynamic validator;

  const RoundedPasswordField(
      {Key? key,
      required this.onChanged,
      required this.hintText,
      required this.validator,
      this.icon})
      : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  late ThemeData _theme;

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: TextFormField(
        obscureText: _showPassword ? false : true,
        onChanged: widget.onChanged,
        cursorColor: _theme.primaryColor,
        validator: widget.validator,
        style: const TextStyle(color: Colors.black, fontSize: FontSize.s14),
        decoration: InputDecoration(
          labelText: widget.hintText,
          // prefixIcon: widget.icon!=null?Icon(
          //   widget.icon,
          //   color: _theme.primaryColor,
          //   size: 22.sp,
          // ):const Text(""),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                if (_showPassword) {
                  _showPassword = false;
                } else {
                  _showPassword = true;
                }
              });
            },
            child: Icon(
              Icons.visibility,
              color: _theme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
