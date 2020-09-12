import 'package:flutter/material.dart';
import 'package:flutter_registration_ui/provider_setup.dart';
import 'package:provider/provider.dart';

import 'core/di/locator.dart';
import 'core/routing/router.dart';
import 'core/routing/routes.dart';
import 'core/viewmodels/sign_up_viewmodel.dart';
import 'ui/styles/themes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String currentRoute = 'MyApp';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        initialRoute: Routes.HomeRoute,
        onGenerateRoute: PageRouter.generateRoute,
      ),
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignUpViewModel(),
        ),
        ...providers
      ],
    );
  }
}
