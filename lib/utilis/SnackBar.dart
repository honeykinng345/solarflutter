import 'package:flutter/material.dart';


 class SnacBar extends StatelessWidget {
    String message ;

   SnacBar({required this.message});

   @override
  Widget build(BuildContext context) {
     return Container(
       child:  _showSnackBar(context,message),
     );
  }

  _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Incremented"),
        duration: Duration(milliseconds: 300),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () => debugPrint('Performing dummy UNDO operation')),
      ),
    );
  }

}
