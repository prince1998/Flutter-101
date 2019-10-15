import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) =>
      new ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          home: new ThisIsMyHome()
        );
      },

    );
  }
}


class ThisIsMyHome extends StatefulWidget {
  @override
  _ThisIsMyHomeState createState() => _ThisIsMyHomeState();

}

class _ThisIsMyHomeState extends State<ThisIsMyHome> {
  String myStr = "Hello World";
  void changeBrightness(BuildContext context)
  {
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is my title'),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('$myStr',style:TextStyle(fontSize: 20),
                ),Image.asset('assets/cutePuppy.jpg',scale: 5,)
              ],



            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: (Colors.red),
        child: Icon(Icons.cached),
        onPressed: (){
          setState(() {
            changeBrightness(context);
          });
        },
      ),
    );
  }
}

//Widget: C amelCase
//CLass, Variable : PAscalCase
