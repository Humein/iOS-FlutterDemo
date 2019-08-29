import 'package:flutter/material.dart';
import 'package:flutter_module/AddScreen.dart';
//import 'package:flutter_module/SimpleScreen.dart';
import 'package:flutter_module/Repository.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:flutter_module/whatsapp_home.dart';
import 'package:flutter_module/MovieCellDetail.dart';
import 'package:flutter_module/Authentications_page.dart';
void main() {

  debugPaintSizeEnabled = false;

  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ListViewApp
  (
  )
  ,
  )
  );
}


class ListViewApp extends StatefulWidget {
  // 没用呀
//  ListViewApp({Key key}) : super(key: key);

  @override
  _ListViewState createState() => new _ListViewState();
}

class _ListViewState extends State<ListViewApp> {
  // tap an item in the list to display the
  // item in a separate screen

  // cell 点击事件
  void _onTapListTile(int ndx) {
    print(ndx);

    if (ndx == 1) {
      Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) => new whatsapp_home(),
          ));
    } if (ndx == 0){
      Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) => new MovieCellDetail(),
          ));

    } else {
      Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) => new Authentications_page(),
          ));
//      Navigator.push(
//          context,
//          new MaterialPageRoute(
//            builder: (BuildContext context) =>
//            new SimpleScreen(Repo.items[ndx]),
//          ));
    }
  }


  // tap the floating action button to add a new item
  // 跳转到添加cell页面
  void _onClickedFAB() =>
      Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            print('push the addView');
            return AddScreen();
          }));


  // the text displayed in the list
  Widget listViewTitle(int ndx) {
    return Text('${Repo.items[ndx].name}');
  }


  // the leading text displayed in the list
  Widget listViewLeadingText(int ndx) {
    return Text('${Repo.items[ndx].id}',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
            fontSize: 36.0,
            color: Colors.red.withOpacity(1.0)));
  }


  @override
  void initState() {
    super.initState();
    setState(() {
      Repo.initializeList();
    });
  }


  @override
  Widget build(BuildContext context) {
    final title = 'Item List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: Repo.items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(Repo.items[index].name),
              onDismissed: (direction) {
                setState(() {
                  Repo.items.removeAt(index);
                });

                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("${Repo.items[index].name} dismissed")));
              },
              background: Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.red,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
              ),
              child: ListTile(
                onTap: () => _onTapListTile(index),
                leading: listViewLeadingText(index),
                title: listViewTitle(index),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onClickedFAB,
          backgroundColor: Colors.blue,
          mini: false,
          child: new Icon(Icons.add),
        ),
      ),
    );
  }


}
