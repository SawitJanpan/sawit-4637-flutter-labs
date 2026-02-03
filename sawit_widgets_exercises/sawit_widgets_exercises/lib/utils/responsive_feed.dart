// AI DOCUMENTATION
// - I use chatgpt 5.2 for research any widget for see example how use 
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-03

class Responsive {
  // breakpoints
  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 900;

  // layout helpers
  static bool isMobile(double width) {
    return width < tabletBreakpoint;
  }

  static bool isTablet(double width) {
    return width >= tabletBreakpoint && width < desktopBreakpoint;
  }

  static bool isDesktop(double width) {
    return width >= desktopBreakpoint;
  }

  // Get column count based on screen width
  static int getColumnCount(double width) {
    if (isMobile(width)) {
      return 1;
    } else if (isTablet(width)) {
      return 2;
    } else {
      return 3;
    }
  }
}
