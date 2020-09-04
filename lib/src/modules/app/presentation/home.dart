import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/module.dart';
import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:app/src/modules/order/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Modular.get<AuthController>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () => scaffoldKey.currentState.openDrawer(),
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                ),
                title: Text('Log out'),
                onTap: () async {
                  Modular.to.popUntil((r) => r.isFirst);
                  await _controller.addEvent(AuthEvent.logout());
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.currentUser.isSurveyFilled
                ? OrderModule.toOrderScreen()
                : AuthModule.toSurveyScreen();
          },
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Center(
                child: Text(
              "I'm hungry",
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontFamily: 'Georgia',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ),
    );
  }
}

// onPressed: () async {
//   Modular.to.popUntil((r) => r.isFirst);
//   await _controller.addEvent(AuthEvent.logout());
// },
