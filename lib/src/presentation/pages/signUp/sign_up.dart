import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/helper/inputValidationMixin.dart';
import 'package:dev_guide/src/core/responsiveUi.dart';
import 'package:dev_guide/src/core/routesName.dart';
import 'package:dev_guide/src/domain/bloc/signUp/sign_up_bloc.dart';
import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/fontManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:dev_guide/src/presentation/widgets/roundedButton.dart';
import 'package:dev_guide/src/presentation/widgets/roundedInputField.dart';
import 'package:dev_guide/src/presentation/widgets/roundedPasswordField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with InputValidationMixin {
  late ThemeData _theme;
  String _email = "", _password = "", _fullName = "";

  late double _width, _pixelRatio;

  late bool _xlarge;
  final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    _pixelRatio = MediaQuery.of(context).devicePixelRatio;

    _xlarge = ResponsiveWidget.isScreenXLarge(_width, _pixelRatio);
    _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: AppSize.s60,
              ),
              Center(
                child: Text(
                  "Dev Guid",
                  style: _theme.textTheme.headline5,
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Form(
                key: _formGlobalKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: AppMargin.m12,
                    ),
                    RoundedInputField(
                      onChanged: (value) => _fullName = value,
                      valueText: _fullName,
                      hintText:
                          AppLocalizations.of(context)!.translate("fullName")!,
                      inputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      icon: Icons.person,
                      validator: (fullName) {
                        if (!isEmpty(fullName)) {
                          return null;
                        } else {
                          return AppLocalizations.of(context)!
                              .translate("required")!;
                        }
                      },
                    ),
                    RoundedInputField(
                      onChanged: (value) => _email = value,
                      valueText: _email,
                      hintText:
                          AppLocalizations.of(context)!.translate("email")!,
                      inputType: TextInputType.emailAddress,
                      icon: Icons.email,
                      textInputAction: TextInputAction.next,
                      validator: (email) {
                        if (isEmailValid(email)) {
                          return null;
                        } else if (isEmpty(email)) {
                          return AppLocalizations.of(context)!
                              .translate("required")!;
                        } else if (!isEmailValid(email)) {
                          return AppLocalizations.of(context)!
                              .translate("invalidEmailAddress")!;
                        }
                      },
                    ),
                    RoundedPasswordField(
                      onChanged: (value) => _password = value,
                      hintText:
                          AppLocalizations.of(context)!.translate("password")!,
                      icon: Icons.lock,
                      validator: (password) {
                        if (!isEmpty(password)) {
                          return null;
                        } else {
                          return AppLocalizations.of(context)!
                              .translate("required")!;
                        }
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    BlocConsumer<SignUpBloc, SignUpState>(
                        listener: (context, state) {
                      if (state is SignUpRegistered) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutesName.mainPage, (route) => false);
                      }
                      if (state is SignUpError) {

                        Fluttertoast.showToast(
                            msg: state.message,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: _theme.primaryColor,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    }, builder: (context, state) {
                      return RoundedButton(
                        text:
                            AppLocalizations.of(context)!.translate("signUp")!,
                        isLoading: state is SignUpLoading,
                        width: AppSize.s180,
                        press: () {
                          if (_formGlobalKey.currentState!.validate()) {
                            _formGlobalKey.currentState!.save();
                            BlocProvider.of<SignUpBloc>(context).add(
                                SignUpByEmail({
                              "email": _email,
                              "password": _password,
                              "fullName": _fullName
                            }));
                          }
                        },
                        color: ColorManager.primary,
                      );
                    }),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                                  .translate("alreadyHaveAnAccount?")! +
                              " ",
                          style: _theme.textTheme.headline4,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.login);
                          },
                          child: Text(
                              AppLocalizations.of(context)!
                                  .translate("signIn")!,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: ColorManager.primary,
                                  fontSize: FontSize.s16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorManager.primary)),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Icon(FontAwesomeIcons.facebook,
                                color: ColorManager.primary, size: AppSize.s40),
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.s20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorManager.primary)),
                          child: const Padding(
                            padding: EdgeInsets.all(AppPadding.p8),
                            child: Icon(FontAwesomeIcons.googlePlus,
                                size: AppSize.s40),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s40,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: Text(
                            AppLocalizations.of(context)!.translate("terms")!,
                            style: _theme.textTheme.headline4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
