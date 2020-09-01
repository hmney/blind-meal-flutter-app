import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Modular.get<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            FlatButton(
              child: Text('Log out'),
              onPressed: () async {
                Modular.to.popUntil((r) => r.isFirst);
                await _controller.addEvent(AuthEvent.logout());
              },
            )
          ],
        ),
      ),
    );
  }
}
