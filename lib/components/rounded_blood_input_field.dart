
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/utils/constants.dart';

class RoundedBloodInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const RoundedBloodInputField({Key key,this.hintText, this.onChanged}):super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(Icons.bloodtype,color: kPrimaryColor,),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
