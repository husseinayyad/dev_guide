part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class ChangeTheme extends AppState{
  ChangeTheme();

}
class ChangeLanguage extends AppState {
 ChangeLanguage();
}