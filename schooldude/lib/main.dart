import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
import './dashboard.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String SCHOOLDUDE_BASE_URL = "https://schooldudeapp-staging.azurewebsites.net/";
  static String LOGIN_URL =
      SCHOOLDUDE_BASE_URL + "api/TokenAuth/AuthenticateUserMobileApp";
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  TextEditingController phoneNumberControler = new TextEditingController();
  TextEditingController passwordControler = new TextEditingController();

  
    

//   void getResponse() async {
//     String URL = LOGIN_URL + "?userName="+phoneNumberControler.text+"&password="+passwordControler.text;
//     http.Response loginResponse = await http.post(URL);
//     if (loginResponse.statusCode == 200) {
//     var jsonResponse = convert.jsonDecode(loginResponse.body);
//   print('Response ==== '+jsonResponse.toString());
//   } else {
//     print('Request failed with status: ${loginResponse.statusCode}.');
//   }
// }  

  @override
  Widget build(BuildContext context) {
      final TextField phoneNumberField = TextField(
      controller: phoneNumberControler,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Enter your Phone Number",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      keyboardType: TextInputType.number,
      maxLength: 10,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
    );

    final passwordField = TextField(
      controller: passwordControler,
      obscureText: true,
      style: style,
      maxLength: 16,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Enter your Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Color(0xff000000),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.yellow, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 300.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 0.0), //40 size
                phoneNumberField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
} 