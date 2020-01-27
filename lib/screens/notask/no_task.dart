import 'package:flutter/cupertino.dart';

class NoTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Image.asset('images/notask.png'),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'No tasks',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Color(0xff554E8F)),
                ),
                Text(
                  'You have no task to do.',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff82A0B7)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
