

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';




void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Nunito"
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
          print("Keyboard State Changed : $visible");
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch(_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);

        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Colors.blueAccent;
        _headingColor = Colors.white;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = _keyboardVisible ? 40 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Colors.blueAccent;
        _headingColor = Colors.white;

        _headingTop = 80;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;

        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 55 : 270;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        break;
    }

    return Stack(
      children: <Widget>[
        AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
                milliseconds: 1000
            ),
            color: _backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(
                              milliseconds: 1000
                          ),
                          margin: EdgeInsets.only(
                            top: _headingTop,
                          ),
                          child: Text(
                            "24/7 Customer care and fast delivery.",
                            style: TextStyle(
                                color: _headingColor,
                                fontSize: 12
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.symmetric(
                              horizontal: 5
                          ),
                          child: Text(
                            "For lightning fast delivery we are here to assist you.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _headingColor,
                                fontSize: 12
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 40
                  ),
                  child: Center(
                    child: Image.asset("images/p.png"),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if(_pageState != 0){
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(7),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(16),
          width: _loginWidth,
          height: _loginHeight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
              milliseconds: 1000
          ),
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white60.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Login To Continue",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Enter Email...",
                  ),
                  SizedBox(height: 16,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter Password...",
                  )
                ],
              ),
              Column(
                children: <Widget>[


                  PrimaryButton(
                    btnText: "Login",

                    ),

                    SizedBox(
                    height: 16,
                    ),
                    GestureDetector(
                    onTap: () {
                    setState(() {
                    _pageState = 2;
                    });
                    },
                    child: OutlineBtn(
                    btnText: "Create New Account",
                    ),
                    )
                    ],
                    ),
                    ],
                    ),
                    ),
                    AnimatedContainer(
                    height: _registerHeight,
                    padding: EdgeInsets.all(16),
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: Duration(
                    milliseconds: 1000
          ),
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Create a New Account",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Enter Email...",
                  ),
                  SizedBox(height: 16,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter Password...",
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  PrimaryButton(
                    btnText: "Create Account",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: OutlineBtn(
                      btnText: "Back To Login",
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  String hint;
  InputWithIcon({this.icon, this.hint});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black,
              width: 2
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Color(0xFFBB9B9B9),
              )
          ),

          Expanded(
            child: TextField(

              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: widget.hint

              ),
            ),
          )
        ],
      ),
    );


  }
}


class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({this.btnText});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => trackOrderPage()),
      );
    },
      
      child: Container(

        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50)
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            widget.btnText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          ),
        ),
      ),
    );
  }
}

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFFB40284A),
              width: 2
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Colors.black,
              fontSize: 10
          ),
        ),
      ),
    );
  }
}



class TrackOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: trackOrderPage(),
    );
  }
}
class trackOrderPage extends StatefulWidget {
  @override
  _trackOrderPageState createState() => _trackOrderPageState();
}

class _trackOrderPageState extends State<trackOrderPage> {
  int currentTabIndex=0;

 onTapped(int index){
   setState(() {
     currentTabIndex=index;
   });
 }

  final ScrollController _ScrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    switch(currentTabIndex){
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pickUpTimePage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => trackOrderPage())
            );
          },
        ),
        title: Text("Track Order", style: TextStyle(
            color: Colors.black
        ),),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
          )
        ],
      ),

      body: SingleChildScrollView(

        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order Number 1001"),
                Text("Order confirmed. Ready to pick"),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 1,
                  color: Colors.grey,
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 13, top: 50),
                      width: 4,
                      height: 400,
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        statusWidget('confirmed', "Confirmed", true),
                        statusWidget('onBoard2', "Picked Up", false),
                        statusWidget('servicesImg', "In Pricess", false),
                        statusWidget('shipped', "Shipped", false),
                        statusWidget('Delivery', "Delivered", false),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 1,
                  color: Colors.grey,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.redAccent,
                          )
                      ),
                      child: Text("Cancel Order"),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                        color: Colors.redAccent,

                      ),
                      child: Text("My Orders"),
                    ),
                  ],
                ),

              ],
            ),
          ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
        iconSize: 30,

        items: [
          BottomNavigationBarItem(

              icon: Icon(Icons.track_changes),
              title: Text("Track Order")

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              title: Text("Place Orders")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }

  Container statusWidget(String img, String status, bool isActive)
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,

            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isActive) ? Colors.redAccent : Colors.white,
                border: Border.all(
                    color: (isActive) ? Colors.transparent : Colors.redAccent,
                    width: 3
                )
            ),
          ),
          SizedBox(width: 50,),
          Column(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/images/$img.png"),
                        fit: BoxFit.contain
                    )
                ),
              ),
              Text(status)
            ],
          )
        ],
      ),
    );
  }
}

class PickUpTimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pickUpTimePage(),
    );
  }
}
class pickUpTimePage extends StatefulWidget {
  @override
  _pickUpTimePageState createState() => _pickUpTimePageState();
}

class _pickUpTimePageState extends State<pickUpTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => trackOrderPage()),
            );
          },
        ),

        title: Text("Select Date & Time", style: TextStyle(
            color: Colors.black
        ),),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
          )
        ],
      ),

      body:Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pick up Date"),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  dateWidget("Wed", "07 Aug", true),
                  dateWidget("Thu", "08 Aug", false),
                  dateWidget("Fri", "09 Aug", false),
                  dateWidget("Sat", "10 Aug", false),
                  dateWidget("Mon", "12 Aug", false),
                  dateWidget("Tue", "13 Aug", false)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 10,),
            Text("Pick up Time"),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  timeWidget("10:00 AM to 12:00 PM", false),
                  timeWidget("12:00 PM to 02:00 PM", true),
                  timeWidget("02:00 PM to 04:00 PM", false),
                  timeWidget("04:00 PM to 06:00 PM", false),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text("Delivery Date"),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  dateWidget("Wed", "10 Aug", true),
                  dateWidget("Thu", "11 Aug", false),
                  dateWidget("Fri", "12 Aug", false),
                  dateWidget("Sat", "13 Aug", false),
                  dateWidget("Mon", "14 Aug", false),
                  dateWidget("Tue", "15 Aug", false)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 10,),
            Text("Delivery Time"),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  timeWidget("10:00 AM to 12:00 PM", false),
                  timeWidget("12:00 PM to 02:00 PM", true),
                  timeWidget("02:00 PM to 04:00 PM", false),
                  timeWidget("04:00 PM to 06:00 PM", false),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount Payable"),
                Text("\$225"),
              ],
            ),
            SizedBox(height: 10,),

               Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(

                ),
                child: Center(
                  child: Text("PLACE ORDER"),

                ),
              ),

          ],
        ),
      ),
      );

  }
  Container dateWidget(String day, String date, bool isActive)
  {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: (isActive) ? Colors.redAccent : Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day),
          Text(date)
        ],
      ),
    );
  }
  Container timeWidget(String time, bool isActive)
  {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: (isActive) ? Colors.redAccent : Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time),

        ],
      ),
    );
  }
}
class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title:Text("Home"),
      backgroundColor: Colors.deepPurple,
      elevation: 0,
      leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => trackOrderPage()),
        );
      },

    ),
    ),
    body: Stack(
      children: <Widget>[
    AnimatedContainer(
    curve: Curves.fastLinearToSlowEaseIn,
      duration: Duration(
          milliseconds: 1000
      ),
      color: Colors.red,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

       Container(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                  milliseconds: 1000
              ),
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                "24/7 Customer care and fast delivery.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
                ),
              ),
            ),
            AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                  milliseconds: 1000
              ),
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                "For lightning fast delivery we are here to assist you.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
                ),
              ),
            ),
            AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                  milliseconds: 1000
              ),
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                "Contact Customer Service:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
                ),
              ),
            ),
            AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                  milliseconds: 1000
              ),
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                "Phone no:911233****",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(
                  horizontal: 5
              ),
              child: Text(
                "Email id:customerservice123@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12
                ),
              ),

            ),
          ],
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(
         horizontal: 20
           ),
          child: Center(
           child: Image.asset("images/p.png"),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    );
  }
}


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Widget _greenColors() {
    return Positioned(
      top: 0,
      child: Container(
        color: Colors.redAccent,
        height: 250,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget _getInfo() {
    return Positioned(
      top: 100,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 260,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("User information:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("SS_Flutter"),
                  SizedBox(
                    width: 20,
                  ),

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Email:"),
                  SizedBox(
                    width: 20,
                  ),
                  Text("ssflutter@gmail.com")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userAdress() {
    return Positioned(
      top: 380,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "User Address:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Village:"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Bhubaneswar"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("District:"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("District: Odisha"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Province:"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(" India"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => trackOrderPage()),
            );
          },
        ),
        actions: <Widget>[IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.black),onPressed: (){},),],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _greenColors(),
            _getInfo(),
            _userAdress(),
          ],
        ),
      ),
    );
  }
}
