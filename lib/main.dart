import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Calculadora'),
    );
  }
}

String strInput = "";
final txtEntrada = TextEditingController();
final txtResultado = TextEditingController();
final Color color_form = Color.fromRGBO(157, 207, 150, 1);
final Color color_text1 = Color.fromRGBO(31, 159, 53, 1);
final Color color_container = Color.fromRGBO(206, 232, 202, 1);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    txtEntrada.addListener(() {});
    txtResultado.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_form,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "0",
                    hintStyle: TextStyle(
                      fontSize: 40,
                      fontFamily: '',
                    )),
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: '',
                ),
                textAlign: TextAlign.right,
                controller: txtEntrada,
                onTap: () =>
                    FocusScope.of(context).requestFocus(new FocusNode()),
              )),
          new Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "",
                    hoverColor: color_container,
                    hintStyle: TextStyle(fontFamily: '')),
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 42, fontFamily: '', fontWeight: FontWeight.bold
                    // color: Colors.deepPurpleAccent
                    ),
                textAlign: TextAlign.right,
                controller: txtResultado,
              )),
          SizedBox(height: 20.0),
          new Container(
            height: 450,
            child: Column(
              children: [
                new Container(
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34.0),
                        topRight: Radius.circular(34.0)),
                    color: color_container,
                  ),
                  child: Column(
                    children: [
                      Divider(),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          btnAC('C', const Color.fromRGBO(166, 212, 160, 1)),
                          boton('+/-', Color.fromRGBO(166, 212, 160, 1)),
                          boton(
                            '%',
                            Color.fromRGBO(166, 212, 160, 1),
                          ),
                          boton(
                            '/',
                            Color.fromRGBO(166, 212, 160, 1),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          boton('7', color_container),
                          boton('8', color_container),
                          boton('9', color_container),
                          boton(
                            '*',
                            const Color.fromRGBO(166, 212, 160, 1),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          boton('4', color_container),
                          boton('5', color_container),
                          boton('6', color_container),
                          boton(
                            '-',
                            const Color.fromRGBO(166, 212, 160, 1),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          boton('1', color_container),
                          boton('2', color_container),
                          boton('3', color_container),
                          boton('+', const Color.fromRGBO(166, 212, 160, 1)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          boton('0', color_container),
                          boton('', color_container),
                          boton('.', color_container),
                          btnIgual(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.0,
          )
        ],
      ),
    );
  }

  Widget boton(String btntxt, Color btnColor) {
    Color color_tex = Colors.green;
    switch (btntxt) {
      case '%':
        {
          color_tex = Colors.white;
          // statements;
        }
        break;

      case '+/-':
        {
          color_tex = Colors.white;
          //statements;
        }
        break;
      case '/':
        {
          color_tex = Colors.white;
          //statements;
        }
        break;
      case '+':
        {
          color_tex = Colors.white;
          //statements;
        }
        break;
      case '-':
        {
          color_tex = Colors.white;
          //statements;
        }
        break;
      case '*':
        {
          color_tex = Colors.white;
          //statements;
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }

    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btntxt,
          style: TextStyle(fontSize: 30.0, color: color_tex, fontFamily: ''),
        ),
        onPressed: () {
          setState(() {
            txtEntrada.text = txtEntrada.text + btntxt;
          });
        },
        color: btnColor,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.green,
      ),
    );
  }

  Widget btnAC(btntext, Color btnColor) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btntext,
          style: TextStyle(fontSize: 28.0, color: Colors.white, fontFamily: ''),
        ),
        onPressed: () {
          setState(() {
            txtEntrada.text = "";
            txtResultado.text = "";
          });
        },
        color: btnColor,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.black,
      ),
    );
  }

  Widget btnBorrar() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Icon(Icons.backspace, size: 35, color: Colors.blueGrey),
        onPressed: () {
          txtEntrada.text = (txtEntrada.text.length > 0)
              ? (txtEntrada.text.substring(0, txtEntrada.text.length - 1))
              : "";
        },
        color: const Color(0xFFF5F7F9),
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.black,
      ),
    );
  }

  Widget btnIgual() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          '=',
          style: TextStyle(fontSize: 28.0, color: Colors.white, fontFamily: ''),
        ),
        onPressed: () {
          Parser p = new Parser();
          ContextModel cm = new ContextModel();
          Expression exp = p.parse(txtEntrada.text);
          setState(() {
            txtResultado.text =
                exp.evaluate(EvaluationType.REAL, cm).toString();
          });
        },
        color: Colors.green,
        padding: EdgeInsets.all(16.0),
        splashColor: Colors.black,
      ),
    );
  }
}
