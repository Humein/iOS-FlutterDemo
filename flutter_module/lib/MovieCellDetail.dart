import 'package:flutter/material.dart';

/** 入口 */

class MovieCellDetail extends StatefulWidget{

  State<StatefulWidget> createState() {
    // TODO: implement createState

    return MovieCardState();
  }
}

/** 整体样式 */
/** 初始化list数据 */

//列表要显示的数据
List list = new List();
//是否正在加载 刷新
bool isfresh = false;
//这个方法只会调用一次，在这个Widget被创建之后，必须调用super.initState()

class MovieCardState extends State<MovieCellDetail>{




  @override
  void initState(){
    super.initState();
    //初始化数据
    initData();
  }

  //延迟3秒后刷新
  Future initData() async{
    await Future.delayed(Duration(seconds: 3),(){
      setState(() {
        //用生成器给所有元素赋初始值
        list = List.generate(20, (i){
          return i;
        });
      });
    });
  }   //ListView Item



  Widget _itemColumn(BuildContext context,int index){
    if(index <list.length){
      return Column(
        children: <Widget>[
          LayoutThreeColumn,
        ],
      );

    }

  }




  //下拉刷新方法
  Future<Null> _onRefresh() async {
    //写逻辑 延迟3秒后执行刷新
    //刷新把isfresh改为true
    print('fresh====' + isfresh.toString());
    isfresh = true;
    print('fresh====' + isfresh.toString());
    await Future.delayed(Duration(seconds: 3),(){
      setState(() {
        //数据清空再重新添加8条数据
        list.clear();
        list.addAll(List.generate(1, (i){
          return i;
        }));
      });
    });
  }







  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text('Movie Card'),
        backgroundColor: Colors.deepOrange,
      ),





      body: RefreshIndicator(
        //ListView提供一个builder属性
        child: ListView.builder(
          //数目
            itemCount: list.length,
            //itemBuilder是一个匿名回调函数，有两个参数，BuildContext 和迭代器index
            //和ListView的Item项类似 迭代器从0开始 每调用一次这个函数，迭代器就会加1
            itemBuilder: _itemColumn,
//            itemBuilder: (BuildContext context,int index){
//              return Column(
//                children: <Widget>[
//                  LayoutThreeColumn,
//                ],
//              );
//            }

        ),
        onRefresh: _onRefresh,),
    );


  }

}


/** 布局 */

//布局三整合
Widget LayoutThreeColumn = Column(
  //主轴上设置居中
  mainAxisAlignment: MainAxisAlignment.center,
  //交叉轴(水平方向)设置从左开始
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    //第一行
    LayoutThreeOne,
    //第二行
    getPaddingfromLTRB(Text('Android Monitor使用介绍',
      style:getTextStyle(Colors.black, 18, false),
    ),t:10.0),
    //第三行
    getPaddingfromLTRB(LayoutThreeThree,t:10.0),
  ],

);



/** 控件 */

//布局三开始第一行
Widget LayoutThreeOne = Row(
  children: <Widget>[
    Expanded(
        child: Row(
          children: <Widget>[
            Text('作者：'),
            Text('HuYounger',
              style: getTextStyle(Colors.redAccent[400], 14, false),
            ),
          ],
        )
    ),
    //收藏图标
    getPaddingfromLTRB(Icon(Icons.favorite,color: isfresh ? Colors.red :  Colors.grey),r:10.0),
    //分享图标
    Icon(Icons.share,color:Colors.black),
  ],
);


//布局三开始第三行
Widget LayoutThreeThree = Row(
  children: <Widget>[
    Expanded(
      child: Row(
        children: <Widget>[
          Text('分类:'),
          getPaddingfromLTRB(Text('开发环境/Android',
              style:getTextStyle(Colors.deepPurpleAccent, 14, false)),l:8.0),
        ],
      ),
    ),
    Text('发布时间：2018-12-13'),
  ],
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
