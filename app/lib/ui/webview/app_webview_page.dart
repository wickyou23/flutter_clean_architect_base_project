import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../app.dart';
import '../../base/base_page_cubit_state.dart';
import '../../base/bloc/value_cubit.dart';
import 'bloc/app_webview_cubit.dart';

@RoutePage()
class AppWebviewPage extends StatefulWidget {
  const AppWebviewPage({
    required this.url,
    super.key,
  });

  final Uri url;

  @override
  State<StatefulWidget> createState() {
    return _AppWebviewPageState();
  }
}

class _AppWebviewPageState
    extends BasePageCubitState<AppWebviewPage, AppWebviewPageCubit> {
  final _progressCubit = ValueCubit.value(0);

  late final WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            Log.d(progress.toString());
            _progressCubit.value = progress;
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(widget.url);

    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        elevation: 8.0,
        text: widget.url.toString(),
        titleSpacing: 0,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          BlocBuilder(
            bloc: _progressCubit,
            builder: (context, state) {
              return Visibility(
                visible: _progressCubit.value != 100,
                child: SizedBox(
                  width: AppDimen.of(context).screenWidth *
                      (_progressCubit.value / 100),
                  height: Dimens.d2.responsive(),
                  child: const ColoredBox(
                    color: AppColors.appColor,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
