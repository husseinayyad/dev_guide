
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:flutter/material.dart';


class NoResultsFound extends StatelessWidget {
  final String text;

  final IconData icon;

  const NoResultsFound({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: Theme.of(context).textTheme.subtitle2,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: AppSize.s28,
          ),
        )
      ],
    );
  }
}
