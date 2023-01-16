import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AdaptiveFlatButon extends StatelessWidget {
  final String text;
  final Function handler;
   AdaptiveFlatButon(this.text,this.handler);

  @override
  Widget build(BuildContext context) {
    return  Platform.isIOS ? CupertinoButton(
                        child:  Text(
                          text,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ), onPressed:() =>  handler() ) 
                    :TextButton(
                        onPressed: () =>  handler(),
                        child: Text(
                          text,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ));
  }
}