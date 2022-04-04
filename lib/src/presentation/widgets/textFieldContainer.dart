import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: AppSize.s8, horizontal: AppSize.s14),
      padding: const EdgeInsets.symmetric(
          vertical: AppSize.s1_5, horizontal: AppSize.s1_5),
      decoration: BoxDecoration(
          // color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10),
          color:ColorManager.white),
      child: child,
    );
  }
}
