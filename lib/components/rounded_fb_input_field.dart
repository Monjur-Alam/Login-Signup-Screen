
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/utils/constants.dart';

class RoundedFbInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const RoundedFbInputField({Key key,this.hintText, this.onChanged}):super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(Icons.facebook,color: kPrimaryColor,),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
