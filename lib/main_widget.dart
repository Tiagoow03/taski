import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/todo');

    return MaterialApp.router(
      title: 'Taski To Do',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          primaryContainer: Color(0xFFF5F7F9),
          inversePrimary: Color(0xFFC6CFDC),
          primaryFixed: Color(0xFF8D9CB8),
          secondary: Color(0xFF3F3D56),
          tertiary: Color(0xFF007FFF),
          error: Color(0xFFFF5E5E),
        ),
        fontFamily: GoogleFonts.urbanist().fontFamily,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFC6CFDC),
          selectionColor: Color(0xFFC6CFDC),
          selectionHandleColor: Color(0xFFC6CFDC),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color(0xFF3F3D56),
              displayColor: Color(0xFF3F3D56),
              fontFamily: GoogleFonts.urbanist().fontFamily,
            ),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
