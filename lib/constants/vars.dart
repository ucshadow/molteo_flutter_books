import 'dart:typed_data';

import 'package:flutter/material.dart';

class Vars {
  static const ROOT_PATH = "https://gong2.herokuapp.com";
  // static const ROOT_PATH = "http://192.168.1.196:8000";
  static const ADMIN_KEY = "b7dc61cb-024b-4ed4-bcff-911929a74734";
  static const ADMIN_APP_KEY = "b683c3c2-8461-45c7-b891-3410b597843c";
  static const DEFAULT_APP_KEY = "f9921179-c3e1-4b9d-998a-431f59853b5c";

  static const AUCTION_PAGE_SIZE = 10;
  static const NOTIFICATION_PAGE_SIZE = 15;
  static const CHAT_TOPIC_PAGE_SIZE = 10;
  static const SUPPLIER_PAGE_SIZE = 10;
  static const PAGINATION_REQUEST_TIMEOUT = 2;
  static const CARD_BID_REQUEST_TIMEOUT = 60 * 10; // 10 minutes
  static String notificationToken = "";
}

class StColors {
  // static const green = const Color(0xFF0EE592);
  static const green = Colors.green;
  static const red = Colors.red;
  static const orange = Colors.orange;
  static const blue = const Color(0xFF3767B0);
  static const deepMetallicBlue = const Color(0xFF001a00);
  static const lightMetallicBlue = const Color(0xFF0099cc);
  static const categoryFillColor = Color.fromRGBO(76, 90, 107, .2);
  static const pageGrayBackground = Color.fromRGBO(76, 90, 107, .1);
  static const pageNoBackground = Color.fromRGBO(255,255,255,1);

  /// CHAT
  static const chatUserYou = Color.fromRGBO(215, 228, 251, 1);
  static const chatUserYouQuote = Color.fromRGBO(175, 191, 236, 1);
  static const chatUserYouTopicLine = Color.fromRGBO(100, 155, 252, 1);

  static const chatUserBidder = Color.fromRGBO(234, 234, 233, 1);
  static const chatUserBidderQuote = Color.fromRGBO(204, 204, 204, 1);
  static const chatUserBidderTopicLine = Color.fromRGBO(204, 204, 204, 1);

  static const chatUserOwner = Color.fromRGBO(255, 221, 221, 1);
  static const chatUserOwnerQuote = Color.fromRGBO(255, 167, 167, 1);
  static const chatUserOwnerTopicLine = Color.fromRGBO(230, 57, 70, 1);

  /// Handyman card status colors
  static const acceptedFontColor = Color.fromRGBO(86, 171, 55, 1);
  static const acceptedFontColorBackground = Color.fromRGBO(189, 255, 170, 1.0);

  static const pendingFontColor = Color.fromRGBO(255, 156, 12, 1.0);
  static const pendingFontColorBackground = Color.fromRGBO(255, 233, 203, 1.0);

  static const rejectedFontColor = Color.fromRGBO(215, 21, 21, 1.0);
  static const rejectedFontColorBackground = Color.fromRGBO(255, 146, 146, 1.0);
}

class StSettings {
  static const appTitle = "Gong";

  static const kGoogleApiKey = "12345";

  static const defLang = 'en';

  static const languages = ['en', 'ro'];

  static const Iterable<Locale> supportedLocales = const <Locale>[
    Locale('en', ''),
    Locale('ro', '')
  ];
}

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
