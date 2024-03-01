import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF233761),
    primary: const Color(0xFF5488D3),
    onPrimary: const Color(0xFFFAFAFA),
    secondary: const Color(0xFF233761),
    onSecondary: const Color(0x33D8E4FF),
    background: const Color(0xFF8A8D9B),
    onBackground:const Color(0xFFD8E4FF),);

final myTheme = ThemeData.dark().copyWith(colorScheme: colorScheme,useMaterial3: true,textTheme: GoogleFonts.notoSansDisplayTextTheme());
