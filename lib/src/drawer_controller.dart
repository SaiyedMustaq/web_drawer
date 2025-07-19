import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/drawer_menu_item.dart';

class CustomDrawerController extends GetxController {
  final RxList<DrawerMenuItem> mainMenuItem = <DrawerMenuItem>[].obs;
  final RxList<DrawerMenuItem> filerManuList = <DrawerMenuItem>[].obs;
  RxBool isLoading = false.obs;
  RxBool isMenuOpen = false.obs;
  RxBool isDrawerExpand = false.obs;
  Timer? debounce;
  TextEditingController searchController = TextEditingController();

  void drawerStateChange() {
    isDrawerExpand.value = !isDrawerExpand.value;
    Future.delayed(const Duration(milliseconds: 500), () {
      isMenuOpen.value = !isMenuOpen.value;
    });
  }

  void searchMenu(String query) {
    if (debounce?.isActive ?? false) debounce!.cancel();
    List<DrawerMenuItem> result = [];
    debounce = Timer(const Duration(milliseconds: 500), () {
      final lowerQuery = query.toLowerCase();
      result = mainMenuItem
          .where((menu) {
            String menuTitle = menu.title.toLowerCase();
            final isMainMatch = menuTitle.startsWith(lowerQuery);
            final matchingSubMenus = menu.subCategories?.where((subMenu) => subMenu.parentTitle.toLowerCase().startsWith(lowerQuery)).toList();
            return isMainMatch || (matchingSubMenus != null && matchingSubMenus.isNotEmpty);
          })
          .map((menu) {
            final matchingSubMenus = menu.subCategories?.where((subMenu) => subMenu.parentTitle.toLowerCase().startsWith(lowerQuery)).toList();
            return DrawerMenuItem(
              isSelected: menu.isSelected,
              title: menu.title,
              route: menu.route,
              iconUrl: menu.iconUrl,
              isExpanded: menu.isExpanded,
              subCategories: matchingSubMenus,
            );
          })
          .toList();
      print("Result $result");
      filerManuList.value = result;
    });
  }

  void changeMenu(String? title, String? childTitle, DrawerMenuItem item, Function(String route) onTap, bool isExpanded) {
    for (var menu in filerManuList) {
      // Reset top-level menu selection and expansion
      menu.isSelected.value = false;
      menu.isExpanded.value = false;

      // Top-level menu clicked
      if (childTitle == null && menu.title == title) {
        // If it has no submenus, mark as selected
        if (menu.subCategories == null || menu.subCategories!.isEmpty) {
          menu.isSelected.value = true;
        }
        // Expand/collapse the menu
        menu.isExpanded.value = isExpanded;

        // Keep any previously selected submenu (do not reset here)
        onTap(menu.route);
        continue;
      }

      // Handle submenu selection
      bool submenuMatched = false;

      if (menu.subCategories != null && menu.subCategories!.isNotEmpty) {
        for (var subMenu in menu.subCategories!) {
          if (subMenu.title == childTitle) {
            subMenu.isSelected.value = true;
            menu.isExpanded.value = true;
            submenuMatched = true;
            onTap(subMenu.route);
          } else {
            subMenu.isSelected.value = false;
          }
        }

        // If any submenu matched, make sure parent menu is not selected
        if (submenuMatched) {
          menu.isSelected.value = false;
        }
      }
    }
  }
}
