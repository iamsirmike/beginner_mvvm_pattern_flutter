import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';

typedef Operation<T> = Future<T> Function();

abstract class OperationRunnerState<T extends StatefulWidget> extends State<T> {
  @protected
  // ignore: avoid_shadowing_type_parameters
  Future<T?> runOperation<T>(
    String name,
    Operation operation, {
    BuildContext? contextE,
    bool showLoader = true,
  }) async {
    contextE ??= context;

    try {
      if (showLoader) context.loaderOverlay.show();

      final result = await operation();

      if (showLoader) context.loaderOverlay.hide();

      return result as T;
    } on DioError {
      if (showLoader) context.loaderOverlay.hide();

      // await showSnackMessage(context, e.message, isError: true);
    }

    return null;
  }
}
