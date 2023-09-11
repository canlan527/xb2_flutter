import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(255, 179, 0, 1);
const primaryColorDark = Color.fromRGBO(255, 179, 0, 1);
// const primaryColorDark = Color.fromRGBO(121, 85, 72, 1);

const secondaryColor = Color.fromRGBO(255, 111, 0, 1);
const secondaryColorDark = Color.fromRGBO(255, 111, 0, 1);

const primaryTextColor = Colors.black54;
const primaryTextColorDark = Color.fromARGB(136, 255, 255, 255);

const secondaryTextColor = Color.fromRGBO(97, 97, 97, 1);
const secondaryTextColorDark = Color.fromRGBO(97, 97, 97, 1);

const primaryBackgroundColor = Colors.white;
const primaryBackgroundColorDark = Color.fromRGBO(33, 33, 33, 1);

// 图标主题
const iconTheme = IconThemeData(
  color: secondaryColor,
);

const iconThemeDark = IconThemeData(
  color: secondaryColorDark,
);

// 文本主题
const textTheme = TextTheme(
  bodyLarge: TextStyle(
    color: Color.fromRGBO(35, 35, 35, 1),
  ),
  bodyMedium: TextStyle(
    color: Color.fromRGBO(35, 35, 35, 1),
  ),
  bodySmall: TextStyle(
    color: Color.fromRGBO(35, 35, 35, 1),
  )
);

const textThemeDark = TextTheme(
  bodyLarge: TextStyle(
    color: Color.fromRGBO(147, 147, 147, 1),
  ),
  bodyMedium: TextStyle(
    color: Color.fromRGBO(147, 147, 147, 1),
  ),
  bodySmall: TextStyle(
    color: Color.fromRGBO(147, 147, 147, 1),
  )
);

// 应用栏主题
const appBarTheme = AppBarTheme(
  elevation: 1,
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(
    color: Colors.black
  ), 
  toolbarTextStyle: TextStyle(
    color: Colors.black,
    fontSize: 20,
  )
);

const appBarThemeDark = AppBarTheme(
  elevation: 1,
  backgroundColor: Color(0xff2e2e2e),
  iconTheme: IconThemeData(
    color: Colors.grey
  ), 
  toolbarTextStyle: TextStyle(
    color: Colors.grey,
    fontSize: 20,
  )
);

// 标签栏主题
const tabBarTheme = TabBarTheme(
  labelColor: Colors.black,
  indicatorSize: TabBarIndicatorSize.label,
  indicator: BoxDecoration(
    border: Border(
      bottom: BorderSide(
        width: 1,
        color: Colors.black,
      )
    )
  ), 
);

const tabBarThemeDark = TabBarTheme(
  labelColor: Colors.grey,
  indicatorSize: TabBarIndicatorSize.label,
  indicator: BoxDecoration(
    border: Border(
      bottom: BorderSide(
        width: 1,
        color: Colors.grey,
      )
    )
  ), 
);

// 底部导航栏样式
const bottomNavigationBarTheme = BottomNavigationBarThemeData(
  elevation: 1,
  showSelectedLabels: true,
  type: BottomNavigationBarType.fixed,
  unselectedItemColor: Colors.black,
  selectedItemColor: primaryColor,
);

final bottomNavigationBarThemeDark = bottomNavigationBarTheme.copyWith(
  unselectedItemColor: Colors.grey,
  selectedItemColor: primaryColorDark,
); 

// 底部提示栏 snackbar样式
const snackBarTheme = SnackBarThemeData(
  backgroundColor: Colors.black87,
);

const snackBarThemeDark = SnackBarThemeData(
  backgroundColor: Colors.black87,
  contentTextStyle: TextStyle(
    color: primaryTextColorDark
  )
);



class AppTheme {
  // 亮色主题
  static ThemeData light = ThemeData(
    primaryColor: primaryColor,
    hintColor: secondaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    scaffoldBackgroundColor: primaryBackgroundColor,
    textTheme: textTheme,
    appBarTheme: appBarTheme,
    tabBarTheme: tabBarTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    snackBarTheme: snackBarTheme,
    // iconTheme: iconTheme,
  );
  // 暗色主题
  static ThemeData dark = ThemeData(
    primaryColor: primaryColorDark,
    hintColor: secondaryColorDark,
    colorScheme: const ColorScheme.dark(
      primary: primaryColorDark,
      secondary: secondaryColorDark,
    ),
    scaffoldBackgroundColor: primaryBackgroundColorDark,
    iconTheme: iconThemeDark,
    textTheme: textThemeDark,
    appBarTheme: appBarThemeDark,
    tabBarTheme: tabBarThemeDark,
    bottomNavigationBarTheme: bottomNavigationBarThemeDark,
    snackBarTheme: snackBarThemeDark,
  );
}