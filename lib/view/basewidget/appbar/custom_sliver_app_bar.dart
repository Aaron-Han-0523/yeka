import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../util//images.dart';
import '../../screen/auth/auth_screen.dart';
import '../../screen/home/home_screens.dart';
import '../../screen/mypage/mypage_home_screen.dart';

class CustomSliverAppBar extends StatefulWidget {
  final String titleText;
  final bool isHome;
  final bool isMyPageHidden;
  final bool isLogoutHidden;

  CustomSliverAppBar(this.titleText, {this.isHome = false, this.isMyPageHidden = false, this.isLogoutHidden = false,});

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      leading: Container(
        padding: const EdgeInsets.fromLTRB(
          8.0,
          0.0,
          0.0,
          0.0,
        ),
        child: widget.isHome || widget.isLogoutHidden
            ? Container()
            : BackButton(
                color: Colors.black,
          onPressed: () {
            Navigator.maybePop(context,"value");
          },
              ),
      ),
      title: Center(
        child: widget.isHome
            ? Image.asset(
                Images.logo_b,
                height: 30,
              )
            : Text(
                widget.titleText,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 4.0, 4.0, 4.0),
            child: InkWell(
              onTap: () => {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => HomePage()),
                        (route) => false)
              },
              child: Icon(
                Icons.home,
                color: Colors.black,
                // size: 30.0,
              ),
            ),
          ),
        ),
        // Center(
        //   child: Padding(
        //     padding: const EdgeInsets.fromLTRB(12.0, 4.0, 4.0, 4.0),
        //     child: InkWell(
        //       onTap: () => {
        //         Provider.of<AuthProvider>(context, listen: false).clearUser()
        //       },
        //       child: Icon(
        //         Icons.login,
        //         color: Colors.green,
        //         // size: 30.0,
        //       ),
        //     ),
        //   ),
        // ),
        // Center(
        //   child: Padding(
        //     padding: const EdgeInsets.fromLTRB(12.0, 4.0, 4.0, 4.0),
        //     child: InkWell(
        //       onTap: () {
        //         Provider.of<AuthProvider>(context, listen: false).clearUser();
        //
        //         Navigator.of(context).pushAndRemoveUntil(
        //             MaterialPageRoute(builder: (_) => AuthScreen()),
        //             (route) => false);
        //       },
        //       child: Icon(
        //         Icons.logout,
        //         color: Colors.red,
        //         // size: 30.0,
        //       ),
        //     ),
        //   ),
        // ),
        widget.isMyPageHidden ? Container() : Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 4.0, 4.0, 4.0),
            child: InkWell(
              onTap: () {
                if (Provider.of<AuthProvider>(context, listen: false)
                    .isLoggedIn()) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyPageHomeScreen(),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => AuthScreen(),
                    ),
                  );
                }
              },
              child: Image.asset(
                Images.login_id,
                height: 17,
              ),
            ),
          ),
        ),
        widget.isLogoutHidden ? Container() : Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
            child: InkWell(
              onTap: () =>  {
                Provider.of<AuthProvider>(context, listen: false).clearUser(),
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AuthScreen(),
                  ),
                )
              },
              child: Image.asset(
                Images.mypage,
                height: 17,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
