import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final Color boxColor;
  final Function onChange;

  String fieldName;
  CustomTextFormField({
    this.hint,
    this.textEditingController,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.fieldName,
    this.boxColor,
    this.onChange,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  Color suffixIconColor=Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      elevation: 0,
      color: Colors.grey[100],
      child: TextFormField(
        controller: widget.textEditingController,
        textInputAction: TextInputAction.done,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        maxLines: 1,
        onChanged: (value){
          if(value!=null && value.trim().length>0) {
            setState(() {
              suffixIconColor=Colors.blue;
            });
          } else {
            setState(() {
              suffixIconColor=Colors.grey;
            });
          }
          widget.onChange(value);
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon!=null?Icon(
            widget.prefixIcon,
            color: Colors.grey,
            size: 20,
          ):null,
          suffixIcon: widget.suffixIcon!=null?Icon(
            widget.suffixIcon,
            color: suffixIconColor,
            size: 20,
          ):null,
          hintText: widget.hint,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                  color: widget.boxColor != null ? widget.boxColor : Colors.transparent,
                  width: 3)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.transparent,
              )),
          contentPadding: EdgeInsets.only(left: 20,right: 20)
        ),
      ),
    );
  }
}
