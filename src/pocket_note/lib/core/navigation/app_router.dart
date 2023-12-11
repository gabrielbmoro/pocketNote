import 'package:auto_route/auto_route.dart';

import '../../ui/screens/addpowerbill/add_power_bill_screen.dart';
import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/powerbill/power_bill_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: PowerBillRoute.page,
        ),
        AutoRoute(
          page: AddPowerBillRoute.page,
        )
      ];
}
