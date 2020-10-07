import 'package:app/src/common/buttons/button.dart';
import 'package:app/src/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () => Modular.to.pop(),
          ),
          title: Text(
            "Review your meal",
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    'DID YOU ENJOYED YOUR BLIND MEAL ?',
                    style: TextStyle(
                      color: Color(0xffacacac),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  RatingBar(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              ),
              SizedBox(height: 60),
              Column(
                children: [
                  Text(
                    'WRITE A REVIEW',
                    style: TextStyle(
                      color: Color(0xffacacac),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Descripe your feeling here ...',
                      hintStyle: TextStyle(
                        color: Color(0xffacacac),
                        fontFamily: 'Roboto',
                        fontSize: 14,
                      ),
                    ),
                    minLines: 5,
                    maxLines: 10,
                  ),
                ],
              ),
              Spacer(),
              Button(
                onPressed: () => Modular.to.pop(),
                style: BUTTON_STYLE.DONE,
              )
            ],
          ),
        ),
      ),
    );
  }
}
