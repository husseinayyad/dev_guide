import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:flutter/material.dart';


class ErrorFetchData extends StatelessWidget {
  const ErrorFetchData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.translate("somethingsWentWrong")!,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
