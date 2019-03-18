import 'package:flutter/material.dart';
import 'package:flutter_module/Repository.dart';

// This screen is used to add a new item to the list
class AddScreen extends StatefulWidget {
  @override
  AddScreenState createState() {
    return new AddScreenState();
  }
}

class AddScreenState extends State<AddScreen> {
  String _msg = '';

  // Call the addItem method to add a new item to the list
  // Returns the name just added which is displayed on the
  // screen below the button
  void addNewItem() {
    var addMsg = Repo.addItem();
    setState(() {
      _msg = addMsg;
    });
  }

  // The add button, when pressed adds an item
  // to the list
  Widget get addButton {
    return RaisedButton(
      onPressed: () => addNewItem(),
      child: Text('Add New Item'),
      color: Colors.blue,
      textColor: Colors.white,
    );
  }

  // The text below the button that displays
  // the item name after it is added
  Widget get displayText {
    return Text(
      '$_msg',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Screenx')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            addButton,
            displayText,
          ],
        ),
      ),
    );
  }
}
