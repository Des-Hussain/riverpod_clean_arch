import 'package:riverpod_clean_arch/common/enums/navigation_items.dart';
import 'package:riverpod_clean_arch/common/resources/drawables.dart';
import 'package:riverpod_clean_arch/common/resources/page_path.dart';
import 'package:riverpod_clean_arch/data/services/local_storage_service.dart';
import 'package:riverpod_clean_arch/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/navigation_button.dart';
import '../providers/auth_provider.dart';

class NavigationPanel extends StatefulWidget {
  const NavigationPanel(
      {super.key, required this.axis, required this.navigationShell});

  final Axis axis;
  final StatefulNavigationShell navigationShell;

  @override
  State<NavigationPanel> createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<NavigationPanel> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints(minWidth: 80),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: Responsive.isDesktop(context)
              ? const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
              : const EdgeInsets.all(10),
          child: widget.axis == Axis.vertical
              ? Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Hero(
                            tag: Drawables.logo,
                            child: Image.asset("assets/logo.png", height: 50)),
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: LocalStorageService
                                          .instance.user?.role ==
                                      'SuperAdmin'
                                  ? NavigationItemsSuperAdmin.values
                                      .map(
                                        (e) => NavigationButton(
                                          onPressed: () {
                                            setState(() {
                                              activeTab = e.index;
                                              if (e.name ==
                                                  NavigationItemsSuperAdmin
                                                      .logout
                                                      .toString()) {
                                                ref
                                                    .watch(isLoggedIn.notifier)
                                                    .update((state) => false);
                                                LocalStorageService.instance
                                                    .logoutUser();
                                                context.go(PagePath.Login);
                                                return;
                                              } else if (e.name ==
                                                  NavigationItemsSuperAdmin
                                                      .backup
                                                      .toString()) {
                                                debugPrint('BACKUP+++++++');
                                                return;
                                              }
                                              widget.navigationShell
                                                  .goBranch(e.index);
                                            });
                                          },
                                          icon: e.icon,
                                          isActive: e.index == activeTab,
                                        ),
                                      )
                                      .toList()
                                  : NavigationItems.values
                                      .map(
                                        (e) => NavigationButton(
                                          onPressed: () {
                                            setState(() {
                                              activeTab = e.index;
                                              print("this:${e.name}");
                                              if (e.name ==
                                                  NavigationItems.logout
                                                      .toString()) {
                                                ref
                                                    .watch(isLoggedIn.notifier)
                                                    .update((state) => false);
                                                LocalStorageService.instance
                                                    .logoutUser();
                                                context.go(PagePath.Login);
                                                return;
                                              }
                                              widget.navigationShell
                                                  .goBranch(e.index);
                                              // switch(e.index){
                                              //   case 0:
                                              //     context.go(PagePath.Home);
                                              //     break;
                                              //   case 1:
                                              //     context.go(PagePath.TeacherScreen);
                                              //     break;
                                              // }
                                              // .goBranch(e.index);
                                            });
                                          },
                                          icon: e.icon,
                                          isActive: e.index == activeTab,
                                        ),
                                      )
                                      .toList(),
                            );
                          },
                        ),
                        Container()
                      ],
                    ),
                    Container(
                      width: 20,
                      color: Colors.grey.shade50,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          // const SizedBox(height: 80, child: TopAppBar()),
                          // Container(
                          //   height: 40,
                          //   color: Colors.grey.shade50,
                          // ),
                          Expanded(child: widget.navigationShell),
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Hero(
                        tag: Drawables.logo,
                        child: Image.asset(Drawables.logo, height: 20)),
                    Row(
                      children: LocalStorageService.instance.user?.role ==
                              'SuperAdmin'
                          ? NavigationItemsSuperAdmin.values
                              .map(
                                (e) => NavigationButton(
                                  onPressed: () {
                                    setState(() {
                                      activeTab = e.index;
                                    });
                                  },
                                  icon: e.icon,
                                  isActive: e.index == activeTab,
                                ),
                              )
                              .toList()
                          : NavigationItems.values
                              .map(
                                (e) => NavigationButton(
                                  onPressed: () {
                                    setState(() {
                                      activeTab = e.index;
                                    });
                                  },
                                  icon: e.icon,
                                  isActive: e.index == activeTab,
                                ),
                              )
                              .toList(),
                    ),
                    Container()
                  ],
                ),
        ),
      ),
    );
  }
}
