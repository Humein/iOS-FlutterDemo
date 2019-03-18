# iOS-FlutterDemo
iOS引入Flutter项目


# 使用

 *  先Clone下本项目代码
    * 也可以做成pod私有源引入
 
 *  Flutter 引入 现有 Native 工程
```
  flutter_application_path = "Flutter目录"
  eval(File.read(File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')), binding)
```

* pod install 



