## 0.0.1

* TODO: initial release.
  
## 0.0.2
* TODO: Small Bug fix
* TODO: On smaller screen sizes, the drawer seamlessly switches to an overlay mode to enhance usability and preserve screen space.
* 
## 0.0.3
* TODO: Small Bug fix UI

## [0.0.4] - 2025-07-19

### ✨ What's New
- Integrated `GetX` for state management (`get: ^4.7.2`)
- Added support for reactive properties in `DrawerMenuItem` and `DrawerSubMenuMenuItem` (e.g., `RxBool` for `isSelected` and `isExpanded`)
- Improved menu selection logic to better handle submenu behavior
- UI optimizations: smoother submenu toggling, and safe handling of overflow and layout issues

### 🛠 Improvements
- Optimized code for submenu and top-level menu selection
- Prevented state update issues during widget build using `addPostFrameCallback`
- Fixed layout overflow error in `Row` widget by using constraints and `Expanded`/`Flexible`
