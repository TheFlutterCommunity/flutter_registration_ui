import 'package:flutter/material.dart';
import 'package:flutter_registration_ui/core/routing/routes.dart';
import 'package:flutter_registration_ui/core/utils/Utils.dart';
import 'package:flutter_registration_ui/ui/shared/custom_text_form_field.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = new TextEditingController();

  double _height;
  double _width;

  String _label;
  Color _labelColor;
  bool _isLowerCase = false;
  bool _isUpperCase = false;
  bool _isNumberCase = false;
  bool _isSpecialSymbolCase = false;

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
        child: Container(
          height: _height,
          child: Column(
            children: <Widget>[
              _buildSignUpStepper(),
              SizedBox(
                height: 20,
              ),
              _buildTitleWidget(),
              SizedBox(
                height: 20,
              ),
              _buildPasswordWidget(),
              SizedBox(
                height: 20,
              ),
              _buildCompatibilityWidget(),
              _buildNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpStepper() => Container(
        height: 72,
        child: Theme(
          data: ThemeData(
            canvasColor: Colors.blueAccent.withOpacity(0.6),
            //primaryColor: Colors.blueAccent
          ),
          child: Stepper(
              type: StepperType.horizontal,
              physics: ClampingScrollPhysics(),
              steps: [
                Step(
                  isActive: false,
                  state: StepState.indexed,
                  title: Text(""),
                  content: Text(''),
                ),
                Step(
                  isActive: false,
                  state: StepState.indexed,
                  title: Text(""),
                  content: Text(''),
                ),
                Step(
                  isActive: false,
                  state: StepState.indexed,
                  title: Text(""),
                  content: Text(''),
                ),
                Step(
                  isActive: false,
                  state: StepState.indexed,
                  title: Text(""),
                  content: Text(''),
                ),
              ],
              // currentStep: _stepperIndex,
              onStepTapped: (index) {
                /*setState(() {
                  _stepperIndex = index;
                });*/
              },
              onStepCancel: () {
                //_updateStepperPrevState(_stepperIndex);
              },
              onStepContinue: () {
                //_updateStepperNextState(_stepperIndex);
              },
              controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Container();
              }),
        ),
      );

  Widget _buildTitleWidget() {
    return Container(
      margin: EdgeInsets.only(left: 12, top: 10),
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Create Password',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          'Password will be used to login to account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ]),
    );
  }

  Widget _buildPasswordWidget() {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        //color: Colors.white,
      ),
      child: Form(
        key: _formKey,
        child: CustomTextFormField(
          keyboardType: TextInputType.visiblePassword,
          textEditingController: _passwordController,
          prefixIcon: null,
          obscureText: true,
          suffixIcon: Icons.visibility,
          hint: 'Create Password',
          onChange: (value) {
            setState(() {
              _label = Utils.getPasswordComplexityLabel(value);
              _labelColor = Utils.getPasswordComplexityLabelColor(value);
              _isLowerCase = Utils.isLowerCase(value);
              _isUpperCase = Utils.isUpperCase(value);
              _isNumberCase = Utils.isNumberCase(value);
              _isSpecialSymbolCase = Utils.isSpecialSymbolCase(value);
            });
          },
        ),
      ),
    );
  }

  Widget _buildCompatibilityWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Complexity:',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  _label != null && _label.trim().length > 0 ? _label : '',
                  style:
                      TextStyle(color: _labelColor != null ? _labelColor : Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _isLowerCase
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.lightGreenAccent,
                            )
                          : Text(
                              'a',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                      Text(
                        'Lowercase',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    children: [
                      _isUpperCase
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.lightGreenAccent,
                            )
                          : Text(
                              'A',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                      Text(
                        'Uppercase',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    children: [
                      _isNumberCase
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.lightGreenAccent,
                            )
                          : Text(
                              '123',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                      Text(
                        'Number',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    children: [
                      _isSpecialSymbolCase
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.lightGreenAccent,
                            )
                          : Text(
                              '9+',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                      Text(
                        'Characters',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
              ],
            )
          ],
        ));
  }

  Widget _buildNextButton() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 40,
          margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: RaisedButton(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            onPressed: () {},
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Container(
              alignment: Alignment.center,
              color: Colors.blueAccent.withOpacity(0.7),
              padding: const EdgeInsets.all(12.0),
              child: Text('Next', style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),
        ),
      ),
    );
  }
}
