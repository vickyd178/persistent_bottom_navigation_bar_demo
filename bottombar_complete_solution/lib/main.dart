import 'package:bottombar_complete_solution/home_page.dart';
import 'package:bottombar_complete_solution/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() {
  runApp(const MyApp());
  //add these lines to main method.
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  initialization();

}
void initialization() async {
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // initialization();
    return GetMaterialApp(
      title: 'Bottom app bar demo',
      home: ProvidedStylesExample(
        menuScreenContext: context,
      ),
      initialRoute: "/",
      theme: ThemeData(primaryColor: Colors.blue),
      routes: {
        "/first": (final context) =>
            Container(
              child: Center(
                child: TextButton(
                  child: Text("Go to second screen"),
                  onPressed: () {},
                ),
              ),
            ),
        "/second": (final context) =>
            Container(
              child: Center(
                child: TextButton(
                  child: Text("Go back"),
                  onPressed: () {},
                ),
              ),
            ),
      },
    );
  }
}

class ProvidedStylesExample extends StatefulWidget {
  const ProvidedStylesExample({final Key? key, required this.menuScreenContext})
      : super(key: key);
  final BuildContext menuScreenContext;

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() =>
      [
        HomePage(),
        MainScreen(
          menuScreenContext: widget.menuScreenContext,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        MainScreen(
          menuScreenContext: widget.menuScreenContext,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        MainScreen(
          menuScreenContext: widget.menuScreenContext,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        MainScreen(
          menuScreenContext: widget.menuScreenContext,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() =>
      [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: "Home",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.search),
          title: "Search",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.white,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => mainScreen2(),
              "/second": (final context) => mainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add),
          title: "Add",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.white,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => mainScreen2(),
              "/second": (final context) => mainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.message),
          title: "Messages",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.white,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => mainScreen2(),
              "/second": (final context) => mainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: "Settings",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.white,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => mainScreen2(),
              "/second": (final context) => mainScreen3(),
            },
          ),
        ),
      ];

  @override
  Widget build(final BuildContext context) =>
      Scaffold(
        body: PersistentTabView(

          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery
              .of(context)
              .viewInsets
              .bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          /* onWillPop: (final context) async {
            await showDialog(
              context: context!,
              useSafeArea: true,
              builder: (final context) => Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: ElevatedButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
            return false;
          },*/
          selectedTabScreenContext: (final context) {},
          backgroundColor: Colors.black,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOutCubicEmphasized,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            curve: Curves.linear,
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle
              .style19, // Choose the nav bar style with this property
        ),
      );
}

mainScreen2() {
  return Container(
    child: Center(
      child: TextButton(
        child: Text("Go to second screen"),
        onPressed: () {},
      ),
    ),
  );
}

mainScreen3() {
  return Container(
    child: Center(
      child: TextButton(
        child: Text("Back"),
        onPressed: () {},
      ),
    ),
  );
}
