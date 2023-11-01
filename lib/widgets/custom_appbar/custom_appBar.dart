import 'package:flutter/material.dart';

customAppBar({Color color = Colors.white, double height = 0}) => PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        backgroundColor: color,
        elevation: 0,
      ),
    );
