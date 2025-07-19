import 'package:get/get.dart';

class DrawerSubMenuMenuItem {
  final String title;
  final String route;
  final String parentTitle;
  final bool isVisible;
  final String iconUrl;
  int? notificationCount;
  RxBool isSelected;

  DrawerSubMenuMenuItem({
    required this.title,
    required this.parentTitle,
    this.notificationCount,
    required this.iconUrl,
    this.isVisible = true,
    RxBool? isSelected,
    required this.route,
  }) : isSelected = isSelected ?? false.obs;

  DrawerSubMenuMenuItem copyWith({String? parentTitle, String? title, String? route, bool? isVisible, String? iconUrl, RxBool? isSelected}) {
    return DrawerSubMenuMenuItem(
      parentTitle: parentTitle ?? this.parentTitle,
      notificationCount: notificationCount,
      title: title ?? this.title,
      route: route ?? this.route,
      isVisible: isVisible ?? this.isVisible,
      iconUrl: iconUrl ?? this.iconUrl,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toJson() => {
    'parentTitle': parentTitle,
    'title': title,
    'notificationCount': notificationCount,
    'route': route,
    'isVisible': isVisible,
    'iconUrl': iconUrl,
    'isSelected': isSelected.value,
  };

  factory DrawerSubMenuMenuItem.fromJson(Map<String, dynamic> json) {
    return DrawerSubMenuMenuItem(
      parentTitle: json['parentTitle'],
      title: json['title'],
      notificationCount: json['notificationCount'],
      route: json['route'],
      isVisible: json['isVisible'] ?? true,
      iconUrl: json['iconUrl'],
      isSelected: (json['isSelected'] ?? false).obs,
    );
  }
}
