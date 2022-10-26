// ignore_for_file: non_constant_identifier_names, library_prefixes

import 'package:flutter/material.dart' as MaterialColor;

@override
MaterialColor.Color Color(String hex) =>
    MaterialColor.Color(int.parse('0XFF$hex'));
