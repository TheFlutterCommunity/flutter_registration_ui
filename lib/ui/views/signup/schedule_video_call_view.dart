import 'package:flutter/material.dart';
import 'package:flutter_registration_ui/core/utils/Utils.dart';
import 'package:flutter_registration_ui/core/viewmodels/sign_up_viewmodel.dart';
import 'package:flutter_registration_ui/ui/shared/ripple_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ScheduleVideoCallView extends StatefulWidget {
  @override
  _ScheduleVideoCallViewState createState() => _ScheduleVideoCallViewState();
}

class _ScheduleVideoCallViewState extends State<ScheduleVideoCallView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      //height: _height-1,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            child: RipplesAnimationWidget(),
          ),
          SizedBox(
            height: 20,
          ),
          _buildScheduleVideoCallInfoWidget(),
          SizedBox(
            height: 20,
          ),
          _buildScheduleCallFormWidget(),
        ],
      ),
    );
  }

  Widget _buildScheduleVideoCallInfoWidget() {
    return Container(
      margin: EdgeInsets.only(
        left: 12,
      ),
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Schedule Video Call',
          style: TextStyle(
              color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0.17),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Choose the date and time that you preferred. we will send the link via email to make a video call on the '
          'scheduled date and time.',
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13, letterSpacing: 0.17),
        ),
      ]),
    );
  }

  Widget _buildScheduleCallFormWidget() {
    final model = Provider.of<SignUpViewModel>(context);
    return Container(
      margin: EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 12),
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              final date= await Utils.selectDate(context);
              if(date!=null) {
                model.date = date;
              }
            },
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
                        'Date',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        model.date != null ? model.date : '- Choose Date -',
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
            onTap: () async {
              final time= await Utils.selectTime(context);
              if(time!=null) {
                model.time = time;
              }
            },
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
                        'Time',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        model.time!=null?model.time:'- Choose Time -',
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
