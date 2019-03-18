import 'package:flutter/material.dart';


// 入口

/** 入口 */

class MovieCard extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MovieCardState();
  }
}



/** 整体样式 */

//添加控件

class MovieCardState extends State<MovieCard>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text('Movie Card'),
        backgroundColor: Colors.deepOrange,
      ),


      body: Card(
        child: Container(
          height: 200,
          color: Colors.amber,
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: theRowWidget,
          ),
        ),
      ),

    );
  }

}


/** 布局 */
// row and Column

Widget theRowWidget = Row(
  //主轴上设置居中
  mainAxisAlignment: MainAxisAlignment.start,
  //交叉轴(水平方向)设置从左开始
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    LayoutTwoLeft,
    LayoutTwoRightExpanded,

  ],
);



/** 控件 */


// 左边图片布局
Widget LayoutTwoLeft = Container(
  //这次使用裁剪实现圆角矩形
  child:ClipRRect(
    //设置圆角
    borderRadius: BorderRadius.circular(4.0),
    child: Image.network(
      'https://img3.doubanio.com//view//photo//s_ratio_poster//public//p2545472803.webp',
      width: 100.0,
      height: 150.0,
      fit:BoxFit.fill,
    ),

  ),
);


// 右边布局
//右布局
Widget LayoutTwoRightColumn = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    //电影名称
    Text(
      '流浪地球',
      style: getTextStyle(Colors.black, 20.0, true),
    ),

    //豆瓣评分
    Text(
      '豆瓣评分：7.9',
      style: getTextStyle(Colors.black54, 16.0, false),
    ),

    //类型
    Text(
      '类型：科幻、太空、灾难',
      style:getTextStyle(Colors.black54, 16.0, false),
    ),

    //导演
    Text(
      '导演：郭帆',
      style: getTextStyle(Colors.black54, 16.0, false),
    ),

    //主演
    Container(
      margin: EdgeInsets.only(top:8.0),
      child:Row(
        children: <Widget>[
          Text('主演：'),
          //以Row从左到右排列头像
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left:2.0),
                child: getCircleAvator('https://img3.doubanio.com//view//celebrity//s_ratio_celebrity//public//p1533348792.03.webp'),
              ),
              Container(
                margin: EdgeInsets.only(left:12.0),
                child: getCircleAvator('https://img3.doubanio.com//view//celebrity//s_ratio_celebrity//public//p1501738155.24.webp'),
              ),
              Container(
                margin: EdgeInsets.only(left:12.0),
                child: getCircleAvator('https://img3.doubanio.com//view//celebrity//s_ratio_celebrity//public//p1540619056.43.webp'),
              ),

            ],
          ),
        ],
      ),
    ),
  ],
);

//布局二 右布局 用Expanded占满剩余空间
Widget LayoutTwoRightExpanded = Expanded(
  child:Container(
    //距离左布局10
    margin:EdgeInsets.only(left:10.0),
    //高度
    height:150.0,
    child: LayoutTwoRightColumn,
  ),
);



/** 私有方法*/

//右下角圆形
CircleAvatar getCircleAvator(String image_url){
  //圆形头像
  return CircleAvatar(
    backgroundColor: Colors.white,
    backgroundImage: NetworkImage(image_url),
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
