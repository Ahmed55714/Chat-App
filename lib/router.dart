import 'dart:io';

import 'package:chat/common/widgets/error.dart';
import 'package:chat/features/group/screens/create_group_screen.dart';
import 'package:chat/features/landing/screens/auth/screens/login_screen.dart';
import 'package:chat/features/landing/screens/auth/screens/user_information_screen.dart';
import 'package:chat/features/select_contact/screens/select_contacts_screen.dart';
import 'package:chat/features/chat/screens/mobile_chat_screen.dart';
import 'package:chat/features/status/screens/confirm_status_screen.dart';
import 'package:chat/features/status/screens/status_screen.dart';
import 'package:flutter/material.dart';

import 'features/landing/screens/auth/screens/otp_screen.dart';
import 'model/status_model.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    case InformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const InformationScreen(),
      );
    case SelectContactsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SelectContactsScreen(),
      );
    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      final isGroupChat = arguments['isGroupChat'];
      final profilePic = arguments['profilePic'];
      return MaterialPageRoute(
        builder: (context) => MobileChatScreen(
          name: name,
          uid: uid,
          isGroupChat: isGroupChat,
          profilPic: profilePic,
        ),
      );
    case ConfirmStatusScreen.routeName:
      final file = settings.arguments as File;
      return MaterialPageRoute(
        builder: (context) => ConfirmStatusScreen(
          file: file,
        ),
      );
    case StatusScreen.routeName:
      final status = settings.arguments as Status;
      return MaterialPageRoute(
        builder: (context) => StatusScreen(
          status: status,
        ),
      );
    case CreateGroupScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateGroupScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(Error: 'This page doesn\'t exist'),
        ),
      );
  }
}
