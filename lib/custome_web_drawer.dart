library;

import 'package:flutter/material.dart';

import 'package:web_drawer/src/constant/drawer_colors.dart';
import 'package:web_drawer/src/model/drawer_menu_item.dart';
import 'package:web_drawer/src/widget/header_with_animation.dart';
import 'package:web_drawer/web_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.child,
    required this.onMenuTap,
    Widget? prefix,
    Widget? drawerIcon,
    Widget? drawerHeader,
    this.headerWidget,
    this.drawerIconSize = 24,
    this.menuItems = const [],
    this.drawerIconColor = DrawerColors.drawerIconColor,
    this.headerColor = DrawerColors.haderColor,
    this.drawerColor = DrawerColors.drawerBackground,
    this.drawerTextSelectedColor = DrawerColors.drawerIconColor,
    this.titleName,
    TextStyle? titleStyle,
    TextStyle? userNameStyle,
    TextStyle? userLatsNameStyle,
    Color? profileBackground,
    this.profileImageUrl,
    this.version,
    this.userFirstName,
    this.userEmail,
    this.userLastName,
    this.isSearchShow = false,
    this.isShowUserProfile = false,
    this.isShowClearIcon = false,
    this.isShowUserName = false,
    required this.onLogOutClick,
  }) : prefix = prefix ?? const SizedBox.shrink(),
       drawerIcon = drawerIcon ?? const Icon(Icons.menu),
       titleStyle = const TextStyle(color: Colors.white, fontSize: 20),
       userNameStyle = const TextStyle(color: Colors.white, fontSize: 16),
       userLatsNameStyle = const TextStyle(color: Colors.white, fontSize: 16),
       profileBackground = profileBackground ?? Colors.transparent,
       drawerHeader = drawerHeader ?? const SizedBox.shrink();

  /// Page to display left side of the drawer
  final Widget child;

  final Widget prefix;

  /// Drawer header
  final Widget? drawerHeader;

  /// Header widget
  final Widget? headerWidget;

  /// Drawer icon
  final Widget drawerIcon;

  /// Drawer header color
  final Color headerColor;

  /// Background color of the drawer
  final Color drawerColor;

  /// Background color of the profile
  final Color profileBackground;

  /// Selected text color of the drawer
  final Color drawerTextSelectedColor;

  /// Is show search to hanlde visibility of search box
  final bool isSearchShow;

  /// Is show profile to handle visibility of profile
  final bool isShowUserProfile;

  /// Is show user name to handle visibility of user name
  final bool isShowUserName;

  /// drawer icon size
  final double drawerIconSize;

  /// dawer icon color
  final Color drawerIconColor;

  /// Page title
  final String? titleName;

  /// Title TextStyle
  final TextStyle? titleStyle;

  // User name style
  final TextStyle? userNameStyle;

  /// User first name
  final String? userFirstName;

  /// User last name
  final String? userLastName;

  /// User email
  final String? userEmail;

  /// User profile image
  final String? profileImageUrl;

  /// Last name style
  final TextStyle? userLatsNameStyle;

  /// Version of the app
  final String? version;

  /// Menu items to display in the drawer
  final List<DrawerMenuItem> menuItems;

  /// on menu tap to handle navigation
  final Function(String menuPath) onMenuTap;

  /// on logout click to handle logout
  final Function onLogOutClick;

  final bool isShowClearIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WebDrawer(
          drawerTextSelectedColor: drawerTextSelectedColor,
          drawerBackground: drawerColor,
          menuItems: ValueNotifier(menuItems),
          isSearchShow: isSearchShow,
          onMenuTap: (String navigationRoute) {
            return onMenuTap(navigationRoute);
          },
          prefix: prefix,
          isShowClearIcon: isShowClearIcon,
          drawerIcon: drawerIcon,
          drawerIconColor: DrawerColors.drawerIconColor,
          drawerIconSize: drawerIconSize,
          onLogOutClick: onLogOutClick,
          profileBackground: profileBackground,
          version: version,
          name: userFirstName ?? "",
          lastName: userLastName ?? "",
          email: userEmail ?? "",
          drawerHeader: drawerHeader,
        ),
        Expanded(
          child: Column(
            children: [
              headerWidget ??
                  HeaderWithAnimation(
                    haderColor: drawerColor,
                    titile: titleName ?? "",
                    userFirstName: userFirstName ?? "",
                    userLastName: userLastName ?? "",
                    isShowUserProfile: isShowUserProfile,
                    isShowUserName: isShowUserName,
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    userNameStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    profileImage: profileImageUrl,
                  ),
              Expanded(child: child),
            ],
          ),
        ),
      ],
    );
  }
}
