import 'package:flutter/widgets.dart';

typedef Widget StartLoadCallback();
typedef Widget ErrorLoadCallback([dynamic error]);
typedef Widget SuccessLoadingCallback({dynamic data});


enum LoadingState { Error, Loading, Success }

class LoadingDialog extends StatefulWidget {

  final StartLoadCallback startLoad;
  final SuccessLoadingCallback successLoad;
  final ErrorLoadCallback errorLoad;

  LoadingDialog(
      {Key key,
      this.startLoad,
      this.successLoad,
      this.errorLoad,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new LoadingDialogState();
}

class LoadingDialogState extends State<LoadingDialog> {

  var _loadingState = LoadingState.Loading;
  dynamic _data;
  dynamic _error;

  @override
  void initState() {
    super.initState();

    if (!mounted) return;
    setState(() {
      _loadingState = LoadingState.Loading;
    });
  }

  reloadSucessState(dynamic data) {
    if (!mounted) return;
    setState(() {
      _data = data;
      _loadingState = LoadingState.Success;
    });
  }

  reloadFailedState(Exception e) {
    if (!mounted) return;
    setState(() {
      _error = e;
      _data = null;
      _loadingState = LoadingState.Error;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (_loadingState == LoadingState.Loading) return widget.startLoad();

    if (_loadingState == LoadingState.Error) return widget.errorLoad(_error);

    return widget.successLoad(data: _data);
  }
}
