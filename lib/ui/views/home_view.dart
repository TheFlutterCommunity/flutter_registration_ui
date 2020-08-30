import 'package:flutter/material.dart';
import 'package:flutter_registration_ui/core/routing/routes.dart';
import 'package:flutter_registration_ui/ui/shared/custom_shape.dart';
import 'package:flutter_registration_ui/ui/shared/custom_text_form_field.dart';
import 'package:stepper/stepper.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = new TextEditingController();

  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              clipShape(),
              _buildSignUpStepper(),
              Container(
                height: _height,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 170,
                    ),
                    _buildWelcomeWidget(),
                    _buildWelcomeTextWidget(),
                    _buildEmailWidget(),
                    _buildNextButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpStepper() => Container(
        height: 72,
        margin: EdgeInsets.only(top: 40),
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

  Widget clipShape() {
    return Opacity(
      opacity: 0.75,
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeWidget() {
    return Container(
        margin: EdgeInsets.only(left: 12, top: 0),
        alignment: Alignment.centerLeft,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RichText(
            text: TextSpan(
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              text: 'Welcome to',
            ),
          ),
          SizedBox(
            height: 2,
          ),
          RichText(
            //textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                  text: 'GIN',
                ),
                TextSpan(
                  style: new TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                  text: ' Finans',
                ),
              ],
            ),
          ),
        ]) /*Text(
        'Welcome to\nGIN Finans',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),*/
        );
  }

  Widget _buildWelcomeTextWidget() {
    return Container(
      margin: EdgeInsets.only(left: 12, top: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        'Welcome to The Bank of The future.\nManage and track your accounts on \nthe go.',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Colors.black,
          letterSpacing: 0.17,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildEmailWidget() {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Form(
        key: _formKey,
        child: CustomTextFormField(
          keyboardType: TextInputType.emailAddress,
          textEditingController: _emailController,
          prefixIcon: Icons.email_outlined,
          hint: 'Email',
        ),
      ),
    );
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.SignUpRoute);
            },
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
