library;

import 'package:flutter/material.dart';
import 'package:web_drawer/src/constant/drawer_colors.dart';
import 'package:web_drawer/src/model/drawer_menu_item.dart';
import 'package:web_drawer/src/widget/header_with_animation.dart';
import 'package:web_drawer/web_drawer.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
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
    this.expandedIconColor = DrawerColors.expandIconColor,
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

  /// The main content widget displayed beside the drawer (typically the main page).
  final Widget child;

  /// Widget displayed as a prefix in the drawer (e.g., logo or avatar).
  final Widget prefix;

  /// Optional widget for the drawer header (e.g., user info or branding).
  final Widget? drawerHeader;

  /// Optional widget that appears above the drawer items (e.g., custom title).
  final Widget? headerWidget;

  /// Widget used as the icon to toggle the drawer open/close.
  final Widget drawerIcon;

  /// Background color for the header section of the drawer.
  final Color headerColor;

  /// Background color of the entire drawer panel.
  final Color drawerColor;

  /// Background color for the user profile section (if displayed).
  final Color profileBackground;

  /// Text color applied to the selected drawer item.
  final Color drawerTextSelectedColor;

  /// Whether to show the search box in the drawer.
  final bool isSearchShow;

  /// Whether to display the user profile section.
  final bool isShowUserProfile;

  /// Whether to display the user name in the profile section.
  final bool isShowUserName;

  /// Size of the drawer icon.
  final double drawerIconSize;

  /// Color of the drawer icon.
  final Color drawerIconColor;

  /// Color of the expand/collapse icon.
  final Color expandedIconColor;

  /// Optional title text to display at the top of the page.
  final String? titleName;

  /// Text style for the title.
  final TextStyle? titleStyle;

  /// Text style for the user's first name.
  final TextStyle? userNameStyle;

  /// User's first name (used in profile section).
  final String? userFirstName;

  /// User's last name (used in profile section).
  final String? userLastName;

  /// User's email address.
  final String? userEmail;

  /// URL of the user's profile image.
  final String? profileImageUrl;

  /// Text style for the user's last name.
  final TextStyle? userLatsNameStyle;

  /// App version to be displayed (usually in drawer footer).
  final String? version;

  /// List of menu items shown in the drawer.
  final List<DrawerMenuItem> menuItems;

  /// Callback triggered when a drawer menu item is tapped.
  ///
  /// Passes the `menuPath` string to navigate accordingly.
  final Function(String menuPath) onMenuTap;

  /// Callback triggered when the logout option is tapped.
  final Function onLogOutClick;

  /// Whether to show the clear icon (usually for search input).
  final bool isShowClearIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                      haderColor: headerColor,
                      titile: titleName ?? "",
                      userFirstName: userFirstName ?? "",
                      userLastName: userLastName ?? "",
                      isShowUserProfile: isShowUserProfile,
                      isShowUserName: isShowUserName,
                      titleStyle: const TextStyle(color: Colors.white, fontSize: 20),
                      userNameStyle: const TextStyle(color: Colors.white, fontSize: 16),
                      profileImage: profileImageUrl,
                    ),

                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
