import 'package:flutter/material.dart';

class CreatePersonalView extends StatefulWidget {
  @override
  _CreatePersonalViewState createState() => _CreatePersonalViewState();
}

class _CreatePersonalViewState extends State<CreatePersonalView> {
  final _formKey = GlobalKey<FormState>();

  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blueAccent,
      //height: _height-1,
      child: Column(
        children: <Widget>[
          _buildPersonalInfoWidget(),
          SizedBox(
            height: 20,
          ),
          _buildPersonalInfoFormWidget(),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoWidget() {
    return Container(
      margin: EdgeInsets.only(left: 12, top: 10),
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Personal Information',
          style: TextStyle(
              color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0.17),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Please fill in the information below and your goal for digital saving.',
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13, letterSpacing: 0.17),
        ),
      ]),
    );
  }

  Widget _buildPersonalInfoFormWidget() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 12),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 48,
              padding: EdgeInsets.only(left: 12, top: 6, right: 12, bottom: 6),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Goal for activation',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '- Choose Option -',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
                      )
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 48,
              padding: EdgeInsets.only(left: 12, top: 6, right: 12, bottom: 6),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monthly income',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '- Choose Option -',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
                      )
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 48,
              padding: EdgeInsets.only(left: 12, top: 6, right: 12, bottom: 6),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monthly expense',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '- Choose Option -',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
                      )
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
