import 'package:dio_with_clean/core/navigation/routes_constants.dart';
import 'package:dio_with_clean/features/todo/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final routes = GoRouter(
    initialLocation: RoutesConstants.home,
    routes: [
      GoRoute(
        path: RoutesConstants.home,
        builder: (context, state) => HomePage(),
      ),
    ],
  );
}
