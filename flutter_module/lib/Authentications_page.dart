import 'package:flutter/material.dart';

class Authentications_page extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyButtonState();
  }

}


// 添加各种控件

class MyButtonState extends State<Authentications_page> {

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    // TODO: implement build
    return Scaffold(

      appBar: new AppBar(

        title: Text('实名认证'),
        backgroundColor: Colors.blue,
      ),

      body: Card(
        child: Container(
          height: 200,
          color: Colors.white,
          padding: EdgeInsets.all(10),
//          child: Center(
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                eventsButton(context, ""),
//                SizedBox(width:110,),
                eventsButton(context, "添加身份证反面照片"),
                eventsButton(context, "添加个人照片认证"),


              ],

            )
//          ),
        ),

      ),

    );
  }
}

Widget eventsButton(BuildContext context ,String container) {
  return Row(
//      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new RaisedButton(
          child: new Text(
            container,
            style: new TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          onPressed: (){
            Navigator.push(
                context,
                new MaterialPageRoute(
                ));
          },
        ),
      ]
  );

}
