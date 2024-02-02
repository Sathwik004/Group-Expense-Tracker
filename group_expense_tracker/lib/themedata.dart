import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF31E981),
    primary: const Color(0xFF31E981),
    onPrimary: const Color(0xFF000000),
    secondary: const Color(0xFF35605A),
    onSecondary: const Color(0xFFFAFAFA),
    background: const Color(0xFFD8E4FF),
    onBackground:const Color(0xFF00120B),);

final myTheme = ThemeData.light().copyWith(colorScheme: colorScheme,useMaterial3: true,textTheme: GoogleFonts.notoSansDisplayTextTheme());
