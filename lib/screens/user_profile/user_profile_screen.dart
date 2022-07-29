import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:myapp/components/appbar.dart';
import 'package:myapp/components/bottom_nav.dart';
import 'package:myapp/http/httpconnectuserprofile.dart';

import 'package:myapp/model/user.dart';
import 'package:myapp/pallate.dart';
import 'package:myapp/screens/user_profile/components/body.dart';
import 'package:shake/shake.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);
  static String routeName = "/user_profile";

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNav(),
      appBar: buildAppBar(context, "Your Profile"),
    );
  }
}
