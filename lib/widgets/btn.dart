import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final Function _action;
  final String _label;
  final Color bgColor;
  final Color lblColor;

  Btn(this._action, this._label, {this.bgColor = null, this.lblColor = null});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 40, right: 40, top: 30),
      height: 50,
      child: FlatButton(
        color: bgColor == null ? Theme.of(context).primaryColor : bgColor,
        child: Text(
          _label,
          style: TextStyle(fontSize: 20),
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10)),
        textColor: lblColor == null ? Colors.white : lblColor,
        onPressed: () => _action(context),
      ),
    );
  }
}
