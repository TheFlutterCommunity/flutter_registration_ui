import 'package:flutter/material.dart';
import 'package:flutter_registration_ui/core/routing/routes.dart';
import 'package:flutter_registration_ui/core/utils/Utils.dart';
import 'package:flutter_registration_ui/core/viewmodels/sign_up_viewmodel.dart';
import 'package:flutter_registration_ui/ui/shared/custom_text_form_field.dart';
import 'package:flutter_registration_ui/ui/shared/ripple_animation_widget.dart';
import 'package:flutter_registration_ui/ui/views/signup/schedule_video_call_view.dart';
import 'package:provider/provider.dart';

import 'create_password_view.dart';
import 'create_personal_view.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text('Create Account'),
        centerTitle: false,
      ),
      backgroundColor: Colors.blueAccent,
      body: Container(
        height: _height,
        child: Column(
          children: <Widget>[
            _buildSignUpStepper(),
            SizedBox(
              height: 0,
            ),
            Expanded(
              child: Stack(
                children: [
                  Consumer<SignUpViewModel>(
                    builder: (ctx, signUpModel, _) {
                      if (signUpModel.selectedIndex == 0) {
                        return CreatePasswordView();
                      } else if (signUpModel.selectedIndex == 1) {
                        return CreatePersonalView();
                      } else if (signUpModel.selectedIndex == 2) {
                        return ScheduleVideoCallView();
                      } else if (signUpModel.selectedIndex == 3) {
                        return Container(
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(
                              'No view added!',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        );
                      }
                      return CreatePasswordView();
                    },
                  ),
                  Align(alignment: Alignment.bottomCenter, child: _buildNextButton()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpStepper() {
    final model = Provider.of<SignUpViewModel>(context);
    return Container(
      height: 72,
      child: Theme(
        data: ThemeData(
            canvasColor: Colors.blueAccent,
            applyElevationOverlayColor: false,
            primarySwatch: Colors.green,
            appBarTheme: AppBarTheme(elevation: 0)
            //primaryColor: Colors.blueAccent
            ),
        child: Stepper(
            type: StepperType.horizontal,
            physics: ClampingScrollPhysics(),
            steps: [
              Step(
                isActive: model.selectedIndex == 0 ? true : false,
                state: StepState.indexed,
                title: Text(""),
                content: Text(''),
              ),
              Step(
                isActive: model.selectedIndex == 1 ? true : false,
                state: StepState.indexed,
                title: Text(""),
                content: Text(''),
              ),
              Step(
                isActive: model.selectedIndex == 2 ? true : false,
                state: StepState.indexed,
                title: Text(""),
                content: Text(''),
              ),
              Step(
                isActive: model.selectedIndex == 3 ? true : false,
                state: StepState.indexed,
                title: Text(""),
                content: Text(''),
              ),
            ],
            currentStep: model.selectedIndex,
            onStepTapped: (index) {
              model.selectedIndex = index;
            },
            onStepCancel: () {},
            onStepContinue: () {
              model.selectedIndex = model.selectedIndex + 1;
            },
            controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Container();
            }),
      ),
    );
  }

  Widget _buildNextButton() {
    final model = Provider.of<SignUpViewModel>(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 40,
        margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
        child: RaisedButton(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          onPressed: () {
            if(model.selectedIndex<3) {
              model.selectedIndex = model.selectedIndex + 1;
            }
          },
          textColor: Colors.white,
          padding: EdgeInsets.all(0.0),
          child: Container(
            alignment: Alignment.center,
            color: Colors.blueAccent.withOpacity(0.6),
            padding: const EdgeInsets.all(12.0),
            child:
                Text(model.selectedIndex == 3 ? 'Finish' : 'Next', style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ),
      ),
    );
  }
}
