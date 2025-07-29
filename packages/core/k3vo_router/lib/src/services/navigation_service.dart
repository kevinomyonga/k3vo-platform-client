import 'package:go_router/go_router.dart';

class NavigationService {
  NavigationService(this.router);

  final GoRouter router;

  void go(String location, {Map<String, String>? queryParams}) {
    final uri = Uri(path: location, queryParameters: queryParams);
    router.go(uri.toString());
  }

  void push(String location, {Map<String, String>? queryParams}) {
    final uri = Uri(path: location, queryParameters: queryParams);
    router.push(uri.toString());
  }

  void pushNamed(
    String name, {
    Map<String, String> pathParams = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
  }) {
    router.pushNamed(
      name,
      pathParameters: pathParams,
      queryParameters: queryParams,
    );
  }

  void pop() {
    router.pop();
  }
}
