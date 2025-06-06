import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF357cbd);
const kPrimaryLightColor = Color(0xFF89f7ff);
const String kFontFamily = 'OpenSans';

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

const kHintTextStyle = TextStyle(color: Colors.white54, fontFamily: kFontFamily);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(color: Colors.black26, blurRadius: 6.0, offset: Offset(0, 2)),
  ],
);

final kWelcomeUserMessageTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

final kCircleAvatarTextStyle =  TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
);

final kHeading = TextStyle(fontWeight: FontWeight.bold);

final kHeadingName = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

final kSectionTitleTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
