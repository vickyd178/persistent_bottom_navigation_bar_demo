import 'package:bottombar_complete_solution/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen(
      {final Key? key,
      required this.menuScreenContext,
      required this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);
  final BuildContext menuScreenContext;
  final VoidCallback onScreenHideButtonPressed;
  final bool hideStatus;

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Home"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Test Text Field"),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      NavController.navigate(
                          context: context,
                          screen: Scaffold(
                            appBar: AppBar(),
                            body: Center(
                              child: TextButton(
                                  onPressed: () {
                                    NavController.navigate(context: context, screen: Scaffold(body: Container(child: Center(child: Text("New Screen")),)), name: "newScreen");

                                  },
                                  child: Text("Second Screen")),
                            ),
                          ),
                          name: "first");
                    },
                    child: const Text(
                      "Go to Second Screen ->",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        useRootNavigator: true,
                        builder: (final context) => Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Exit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Push bottom sheet on TOP of Nav Bar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        useRootNavigator: false,
                        builder: (final context) => Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Exit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Push bottom sheet BEHIND the Nav Bar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      PersistentNavBarNavigator.pushDynamicScreen(context,
                          screen: SampleModalScreen(), withNavBar: true);
                    },
                    child: const Text(
                      "Push Dynamic/Modal Screen",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: onScreenHideButtonPressed,
                    child: Text(
                      hideStatus
                          ? "Unhide Navigation Bar"
                          : "Hide Navigation Bar",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(menuScreenContext).pop();
                    },
                    child: const Text(
                      "<- Main Menu",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      );
}

class SampleModalScreen extends ModalRoute<void> {
  SampleModalScreen();

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => "null";

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    final BuildContext context,
    final Animation<double> animation,
    final Animation<double> secondaryAnimation,
    // This makes sure that text and other content follows the material style
  ) =>
      Material(
        type: MaterialType.transparency,
        // make sure that the overlay content is not cut off
        child: SafeArea(
          child: _buildOverlayContent(context),
        ),
      );

  Widget _buildOverlayContent(final BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.3,
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "This is a modal screen",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Return",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
}
