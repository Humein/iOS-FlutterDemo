import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'chat_model.dart';
import 'package:flutter_module/MovieCard.dart';

class whatsapp_home extends StatefulWidget {

  //  这是widget的入口
//    @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return AddCustomState();
//  }

   @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyButtonState();
  }

}




// 添加各种控件

class MyButtonState extends State<whatsapp_home>{


  int counter = 0;
  List<String> strings = ['Flutter', 'is', 'cool', "and","awesome!"];
  String displayedString = "Hello World!";
  BuildContext _context;

// 事件
  void _onPressOfButton() {
    displayedString = strings[counter];
    counter = counter < 4 ? counter + 1 : 0;
  }




//  IOS 风格
//   @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return CupertinoPageScaffold(child: null);
//  }



//  安卓风格

   @override
  Widget build(BuildContext context) {
     _context = context;

     // TODO: implement build
    return Scaffold(

      appBar: new AppBar(

        title: Text('whatsAPP'),
        backgroundColor: Colors.lightGreenAccent,
      ),


//      body: Container(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(displayedString, style: new TextStyle(fontSize: 40.0)),
//            new Padding(padding: new EdgeInsets.all(10.0)),
//            new RaisedButton(
//              child: new Text(
//                "Press me",
//                style: new TextStyle(color: Colors.white),
//              ),
//              color: Colors.red,
//              onPressed: onPressOfButton,
//            )
//          ],
//        ),
//      ),


        /**比上面的好   Card 样式 */

        body: Card(
          child: Container(
              //高度
              height: 160.0,
              //颜色
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child:  Center(

                child: Column(
                  //主轴上设置居中
                  mainAxisAlignment: MainAxisAlignment.center,
                  //交叉轴(水平方向)设置从左开始
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    eventsButton(context),

                    //第一行
                    getPaddingfromLTRB(Text('Java synchronized原理总结',
                      style: getTextStyle(Colors.black, 16,true),
                    ),t:0.0),

                    //第二行
                    getPaddingfromLTRB(rowWidget,t:20.0),

                    //第三行
                    getPaddingfromLTRB(rowthreeWidget,l: 20),

                  ],
                ),
              )
          ),
        ),



    );
  }

}


/**  push pop  */
// 因为 context不能为空 而且不知道怎么传递出来， 只能先放在主体里面
Widget eventsButton(BuildContext context) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new RaisedButton(
          child: new Text(
            "Press me",
            style: new TextStyle(color: Colors.white),
          ),
          color: Colors.red,
          onPressed: (){
//            Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new MovieCard(),
                  ));
          },
        ),
]
  );

}




/**
*  Column  布局开始
*/


Widget ColumnWidget = Column(
  //主轴上设置居中
  mainAxisAlignment: MainAxisAlignment.center,
  //交叉轴(水平方向)设置从左开始
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[


    //第一行
    getPaddingfromLTRB(Text('Java synchronized原理总结',
      style: getTextStyle(Colors.black, 16,true),
    ),t:0.0),

    //第二行
    getPaddingfromLTRB(rowWidget,t:20.0),

    //第三行
    getPaddingfromLTRB(rowthreeWidget,l: 20),

  ],
);






/**第二行*/
Widget rowWidget = Row(


  //主轴左边对齐
  mainAxisAlignment: MainAxisAlignment.start,
  //交叉轴(竖直方向)居中
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[

    Text("分类:",
      style: getTextStyle(Colors.blue,14,true),

    ),

    getText("多线程", null),

    getText("Java深入", null),


  ],


);






/**第三行*/

Widget rowthreeWidget = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    new Expanded(
      child: Text(
        "作者:EnjoyMoving",
        style: getTextStyle(Colors.grey[400], 14, true),
      ),
    ),
    getPaddingfromLTRB(Text(
      '时间:2019-02-02',
      style: getTextStyle(Colors.black, 14, true),
    ), r :10.0),
    getPaddingfromLTRB(Icon(
      Icons.favorite_border,
      color:Colors.grey[400],
    ),r:0.0)
  ],
);









/**抽取第二行渐变text效果*/

Container getText(String text,LinearGradient linearGradient){
  return Container(
    //距离左边距离10dp
    margin: const EdgeInsets.only(left: 10),
    //约束 相当于直接制定了该Container的宽和高，且它的优先级要高于width和height
    constraints: new BoxConstraints.expand(
      width: 70.0, height: 30.0,),
    //文字居中
    alignment: Alignment.center,
    child: new Text(
      text,
      style:getTextStyle(Colors.white,14,false),
    ),
    decoration: new BoxDecoration(
      color: Colors.blue,
      //圆角
      borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
      //添加渐变
      gradient:linearGradient,
    ),
  );

}



/**
 * TextStyle:封装
 * colors:颜色
 * fontsizes：字体大小
 * isFontWeight：是否加粗
 */

TextStyle getTextStyle(Color colors,double fontsizes,bool isFontWeight){
  return TextStyle(
    color:colors,
    fontSize: fontsizes,
    fontWeight: isFontWeight == true ? FontWeight.bold : FontWeight.normal ,
  );
}

/**
 * 组件加上下左右padding
 * w:所要加padding的组件
 * all:加多少padding
 */
Widget getPadding(Widget w,double all){
  return Padding(
    child:w,
    padding:EdgeInsets.all(all),
  );
}

/**
 * 组件选择性加padding
 * 这里用了位置可选命名参数{param1,param2,...}来命名参数，也调用的时候可以不传
 *
 */
Widget getPaddingfromLTRB(Widget w,{double l,double t,double,r,double b}){
  return Padding(
    child:w,
    padding:EdgeInsets.fromLTRB(l ?? 0,t ?? 0,r ?? 0,b ?? 0),
  );
}
























//////////////////////////////////


class AddCustomState extends State{

  String _msg = '你';

  Widget get displayText {
    return Text(
      '$_msg',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget get  displayText1{
    return Text(
      '$_msg' + 'displayText1',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }


  //   return Scaffold/  new Material 为啥是必须的？  类似于 UIViewContrl UItabelView     build 是创建关键字

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Screenxsssssss')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            displayText,
            displayText1,
          ],
        ),
      ),

    );
  }


//
//  Widget _buildItem(BuildContext context, int index) {
//    return Material(
//      child: InkWell(
//        onTap: () {},
//        child: ListTile(
//          title: Text('Item #$index'),
//          subtitle: Text('Subtitle $index'),
//          trailing: const Icon(Icons.chevron_right),
//        ),
//      ),
//    );
//  }

}







//class ChatScreenState extends State<whatsapp_home> {
//  @override
//  Widget build(BuildContext context) {
//    return new ListView.builder(
//      itemCount: dummyData.length,
//      itemBuilder: (context, i) => new Column(
//        children: <Widget>[
//          new Divider(
//            height: 10.0,
//          ),
//          new ListTile(
//            leading: new CircleAvatar(
//              foregroundColor: Theme.of(context).primaryColor,
//              backgroundColor: Colors.grey,
//              backgroundImage: new NetworkImage(dummyData[i].avatarUrl),
//            ),
//            title: new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                new Text(
//                  dummyData[i].name,
//                  style: new TextStyle(fontWeight: FontWeight.bold),
//                ),
//                new Text(
//                  dummyData[i].time,
//                  style: new TextStyle(color: Colors.grey, fontSize: 14.0),
//                ),
//              ],
//            ),
//            subtitle: new Container(
//              padding: const EdgeInsets.only(top: 5.0),
//              child: new Text(
//                dummyData[i].message,
//                style: new TextStyle(color: Colors.grey, fontSize: 15.0),
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
//

