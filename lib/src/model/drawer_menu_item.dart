import 'package:get/get.dart';
import 'package:web_drawer/src/model/drawer_sub_menu.dart';

class DrawerMenuItem {
  final String title;
  final String route;
  final bool isVisible;
  final String iconUrl;
  int? notificationCount;
  RxBool isSelected;
  RxBool isExpanded;
  List<DrawerSubMenuMenuItem>? subCategories;

  DrawerMenuItem({
    required this.title,
    required this.route,
    this.notificationCount,
    required this.iconUrl,
    this.isVisible = true,
    RxBool? isSelected,
    RxBool? isExpanded,
    this.subCategories,
  }) : isSelected = isSelected ?? false.obs,
       isExpanded = isExpanded ?? false.obs;

  DrawerMenuItem copyWith({
    String? title,
    String? route,
    int? notificationCount,
    bool? isVisible,
    String? iconUrl,
    RxBool? isSelected,
    RxBool? isExpanded,
    List<DrawerSubMenuMenuItem>? subCategories,
  }) {
    return DrawerMenuItem(
      notificationCount: notificationCount ?? this.notificationCount,
      title: title ?? this.title,
      route: route ?? this.route,
      isVisible: isVisible ?? this.isVisible,
      iconUrl: iconUrl ?? this.iconUrl,
      isSelected: isSelected ?? this.isSelected,
      isExpanded: isExpanded ?? this.isExpanded,
      subCategories: subCategories ?? this.subCategories,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'notificationCount': notificationCount,
    'route': route,
    'isVisible': isVisible,
    'iconUrl': iconUrl,
    'isSelected': isSelected.value,
    'isExpanded': isExpanded.value,
    'subCategories': subCategories,
  };

  factory DrawerMenuItem.fromJson(Map<String, dynamic> json) {
    return DrawerMenuItem(
      title: json['title'],
      notificationCount: json['notificationCount'] ?? 0,
      route: json['route'],
      isVisible: json['isVisible'] ?? true,
      iconUrl: json['iconUrl'],
      isSelected: (json['isSelected'] ?? false).obs,
      isExpanded: (json['isExpanded'] ?? false).obs,
      subCategories: json['subCategories'], // handle parsing if needed
    );
  }
}
