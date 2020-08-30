import 'package:flutter_registration_ui/core/viewmodels/sign_up_viewmodel.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {

  //GetIt.I.registerSingleton<UserRepository>(UserRepository());

  // ViewModels
  //locator.registerSingleton<SignUpViewModel>(SignUpViewModel());
  locator.registerLazySingleton(() => SignUpViewModel());
}
