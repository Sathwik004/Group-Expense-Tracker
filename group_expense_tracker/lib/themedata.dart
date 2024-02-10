import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF31E997),
    primary: const Color(0xFF31E997),
    onPrimary: const Color.fromARGB(215, 0, 0, 0),
    secondary: const Color(0xFF315953),
    onSecondary: const Color(0xFFFAFAFA),
    onBackground: const Color(0xFF00120B),
    background:const Color(0xFFD8E4FF),);

final myTheme = ThemeData.dark().copyWith(colorScheme: colorScheme,useMaterial3: true,textTheme: GoogleFonts.notoSansDisplayTextTheme());
