import 'package:admin_panel/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/dashboard_page.dart';
import '../presentation/logiin_page.dart';

List<String>routesNameList=[RouteNames.ordersPagePath,RouteNames.customersPagePath,RouteNames.businessProfilePagePath,RouteNames.storePagePath,RouteNames.categoryPagePath, RouteNames.partnerPagePath,RouteNames.bowsersPagePath,RouteNames.driversPagePath,RouteNames.transactionsPagePath,RouteNames.appSettingPagePath,RouteNames.rolePermissionsPagePath,RouteNames.teamPagePath,RouteNames.paymentMethodPagePath];

final GoRouter routerConfig = GoRouter(
  initialLocation: RouteNames.loginPagePath,

  routes: <RouteBase>[

    GoRoute(
      path: RouteNames.loginPagePath,
      pageBuilder: (context, state) =>const  MaterialPage(child: LoginPage()),),

    StatefulShellRoute.indexedStack(
        builder: (BuildContext context,GoRouterState state,StatefulNavigationShell shell){
          return DashBoardPage(navigationShell: shell);
        },
        branches: [
          for(int i=0;i<pageList.length;i++)...[
            StatefulShellBranch(routes: [
              GoRoute(
                path:routesNameList[i],
                pageBuilder: (context, state) =>MaterialPage(child: pageList[i]),),
            ]),
          ]
          // StatefulShellBranch(routes: [
          //   GoRoute(
          //     path: RouteNames.ordersPagePath,
          //     pageBuilder: (context, state) =>MaterialPage(child: OrderPage()),),
          // ]),
          // StatefulShellBranch(routes: [
          //   GoRoute(
          //     path: RouteNames.dashboardPagePath,
          //     pageBuilder: (context, state) =>MaterialPage(child: DashboardPage()),),
          // ]),
          // StatefulShellBranch(routes: [
          //   GoRoute(
          //     path: RouteNames.aboutPagePath,
          //     pageBuilder: (context, state) =>MaterialPage(child: AboutPage()),),
          // ]),

        ]),


  ],
);