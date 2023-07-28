import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({Key? key, required this.validationString, required this.labelText, required this.icon, required this.control, required this.onTap}) : super(key: key);
  final String validationString,labelText ;
  final Icon icon;
  final TextEditingController control;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: icon,
          labelText: labelText,
          border:const OutlineInputBorder(),
        ),
        validator: (String? value) {
          if(value.toString().isEmpty){
            return validationString;
          }
        },
        controller: control,
        onTap: (){
          onTap();
        },
      ),
    );
  }
}
