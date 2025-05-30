import 'package:flutter/material.dart';

class HeaderWithAnimation extends StatelessWidget {
  const HeaderWithAnimation({
    super.key,
    required this.haderColor,
    TextStyle? titleStyle,
    TextStyle? userNameStyle,
    this.profileImage,
    this.isShowUserProfile = true,
    this.isShowUserName = true,
    required this.titile,
    this.userFirstName,
    this.userLastName,
  }) : titleStyle = titleStyle ?? const TextStyle(color: Colors.white),
       userNameStyle = userNameStyle ?? const TextStyle(color: Colors.white);

  final Color haderColor;
  final TextStyle? titleStyle;
  final TextStyle? userNameStyle;
  final String titile;
  final String? userFirstName;
  final String? userLastName;
  final String? profileImage;
  final bool isShowUserProfile;
  final bool isShowUserName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: haderColor,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: haderColor,
        title: Text(titile, style: titleStyle),
        centerTitle: false,
        actions: [
          if (isShowUserName)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userFirstName ?? "",
                  style: userNameStyle,
                  textAlign: TextAlign.start,
                ),
                Text(
                  userLastName ?? "",
                  style: userNameStyle,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          if (isShowUserProfile)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: profileImage != null
                    ? (profileImage!.contains("http")
                        ? NetworkImage(profileImage!)
                        : AssetImage(profileImage!)) as ImageProvider
                    : null,
                radius: 30,
              ),
            ),
        ],
      ),
    );
  }
}
