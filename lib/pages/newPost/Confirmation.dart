import 'package:bulldog_eats/pages/Post.dart';
import 'package:flutter/material.dart';
import 'package:bulldog_eats/pages/Feed.dart';

class Confirmation extends StatefulWidget {
  Confirmation({Key key}) : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Confirmation", style: TextStyle(
                  //fontWeight: FontWeight.w200,
                  fontSize: 30,
                  fontFamily: 'Roboto'
              ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Thank you!",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto'
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Your submission has been received and will now show up in the feed. You can always come back to edit your post while it's still active!",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto'
                  ),
                  maxLines: 3,
                ),
              ),
              SizedBox(
                height: 300,
              ),
              RaisedButton(
                onPressed: (){
                  nextPage();
                },
                color: Colors.white,
                child: Text('Back to Home', style: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );


    /*return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Confirmation", style: TextStyle(
              fontSize: 40,
              fontFamily: 'Roboto'
            ),
            ),
            Text(
                "Thank You!\n\nYour submission has been received and will now show up in the feed. You can always come back to edit your post while it's still active!",
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.italic)
            ),
            SizedBox(
              height: 100,
            ),
            RaisedButton(
              color: Colors.white,
              child: Text('Back to Home', style: TextStyle(fontSize: 20)),
              onPressed: (){
                nextPage();
              },
            )
          ],
        )
        ),
    );*/
  }

  void nextPage(){
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new Feed()),
    );
  }
}
