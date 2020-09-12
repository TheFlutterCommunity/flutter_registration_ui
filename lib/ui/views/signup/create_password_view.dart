import 'package:flutter/material.dart';
import 'package:flutter_registration_ui/core/utils/Utils.dart';
import 'package:flutter_registration_ui/core/viewmodels/sign_up_viewmodel.dart';
import 'package:flutter_registration_ui/ui/shared/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class CreatePasswordView extends StatefulWidget {
  @override
  _CreatePasswordViewState createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      //height: _height-1,
      child: Column(
        children: <Widget>[
          _buildTitleWidget(),
          SizedBox(
            height: 20,
          ),
          _buildPasswordWidget(),
          SizedBox(
            height: 20,
          ),
          _buildCompatibilityWidget(),
        ],
      ),
    );
  }

  Widget _buildTitleWidget() {
    return Container(
      margin: EdgeInsets.only(left: 12, top: 10),
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Create Password',
          style: TextStyle(
              color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0.17),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Password will be used to login to account',
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13, letterSpacing: 0.17),
        ),
      ]),
    );
  }

  Widget _buildPasswordWidget() {
    final model = Provider.of<SignUpViewModel>(context);
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
          obscureText: model.obscureText,
          suffixIcon: Icons.visibility,
          hint: 'Create Password',
          suffixPressed: () {
            model.obscureText = !model.obscureText;
          },
          onChange: (String value) {
            if (value.trim().length == 0) {
              model.label = '';
            }
            model.setPasswordComplexity(value);
          },
        ),
      ),
    );
  }

  Widget _buildCompatibilityWidget() {
    final model = Provider.of<SignUpViewModel>(context);
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
                  model.label != null && model.label.trim().length > 0 ? model.label : '',
                  style: TextStyle(
                      color: model.labelColor != null ? model.labelColor : Colors.white, fontWeight: FontWeight.bold),
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
                      model.isLowerCase
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
                      model.isUpperCase
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
                      model.isNumberCase
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
                      model.isSpecialSymbolCase
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
}
