
import 'package:dev_guide/src/presentation/resources/fontManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final bool isLoading;
  final Color color, textColor;
  final double? width;
     const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
       required this.color ,
       required this.isLoading,
    this.textColor = Colors.white, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSize.s12),
      width: width ?? size.width * 0.9,

      child: ElevatedButton(
        // style: TextButton.styleFrom(
        //   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
        //
        //   backgroundColor: color
        // ),

        onPressed: isLoading?null:press,


        child:  Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: isLoading?const CircularProgressIndicator():Text(
          text,
          style: TextStyle(color: textColor,fontSize: FontSize.s14),
        ),
        )
      ),
    );
  }
}
