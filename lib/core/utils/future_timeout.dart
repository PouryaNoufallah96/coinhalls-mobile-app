import 'dart:async';

Future<T?> futureTimeout<T>(
  Future<T> future,
  Duration limit,
  void Function() onTimeout,
) async {
  try {
    return await future.timeout(
      limit,
    );
  } on TimeoutException {
    onTimeout();
    return null;
  } catch (e, _) {
    onTimeout();
    return null;
  }
}
