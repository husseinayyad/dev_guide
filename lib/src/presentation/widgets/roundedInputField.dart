import 'package:dev_guide/src/presentation/resources/fontManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:dev_guide/src/presentation/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final String? valueText;
  final bool? enabled;
  final int? maxLines;
  final IconData? icon;
  final TextInputType? inputType;

  final TextInputAction? textInputAction;
  final dynamic validator;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const RoundedInputField(
      {Key? key, this.hintText,
      this.icon,
      this.onChanged,
      this.valueText,
      this.inputType,
      this.enabled,
      this.textInputAction,
      this.validator,
      this.maxLines,
      this.onTap,
      this.helperText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: TextFieldContainer(

          child: TextFormField(
            textInputAction: textInputAction,
            onChanged: onChanged,
            enabled: enabled ?? true,
            validator: validator,
            onTap: onTap,
            readOnly: onTap != null,
            maxLines: maxLines,
            style: const TextStyle(color: Colors.black, fontSize: FontSize.s14),
            keyboardType: inputType ?? TextInputType.text,
            decoration: InputDecoration(
                // suffixIcon: icon != null
                //     ? Icon(
                //         icon,
                //       )
                //     : const Text(""),

                // labelStyle:  TextStyle(color: Colors.black,fontSize: 11.sp),
                //
                //
                labelText: hintText,
                helperText: helperText == null ? null : helperText!
                //
                // contentPadding: EdgeInsets.all(6.sp),
                //
                //
                //
                // hintStyle: TextStyle(color:Colors.black,fontSize: 11.sp),
                //
                // border: InputBorder.none,
                ),
          ),
        ));
  }
}
