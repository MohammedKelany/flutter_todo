import 'package:flutter/material.dart';
import 'package:new_app/view/widgets/customtext.dart';
class EmptyTask extends StatelessWidget {
  const EmptyTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:const [
          Icon(Icons.menu,size: 150,color: Colors.grey,),
          CustomText(text: "Please Add Some Tasks !!!", size: 20, color: Colors.grey,maxLines: 1,)
        ],
      ),
    );
  }
}
