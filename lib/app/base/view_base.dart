import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_app/app/base/cubit_base.dart';
import 'package:qoute_app/app/base/state_base.dart';

abstract class BlocView<B extends BaseBloc<S>, S extends BaseState>
    extends StatelessWidget {
  /// check has listener
  final bool hasListener;

  /// check has builder
  final bool hasBuilder;

  /// init function callback
  /// Use parent bloc if init is null
  final B Function(BuildContext)? init;

  const BlocView({
    super.key,
    required this.hasListener,
    required this.hasBuilder,
    this.init,
  });

  /// build UI
  Widget render(BuildContext context);

  /// handle listen
  void listener(BuildContext context, S state);

  /// handle listen conditions
  bool listenWhen(S old, S curr);

  /// handle build conditions
  bool buildWhen(S old, S curr);

  @override
  Widget build(BuildContext context) {
    if (init == null) {
      return _BlocViewBridge<B, S>(
        hasListener: hasListener,
        hasBuilder: hasBuilder,
        render: render,
        buildWhen: buildWhen,
        listenWhen: listenWhen,
        listener: listener,
      );
    }
    return BlocProvider<B>(
      create: (context) => init!(context),
      lazy: false,
      child: _BlocViewBridge<B, S>(
        hasListener: hasListener,
        hasBuilder: hasBuilder,
        render: render,
        buildWhen: buildWhen,
        listenWhen: listenWhen,
        listener: listener,
      ),
    );
  }
}

class _BlocViewBridge<B extends BlocBase<S>, S extends BaseState>
    extends StatelessWidget {
  final bool hasListener;
  final bool hasBuilder;
  final Widget Function(BuildContext) render;
  final bool Function(S, S) buildWhen, listenWhen;
  final void Function(BuildContext, S) listener;

  const _BlocViewBridge({Key? key,
    required this.hasListener,
    required this.hasBuilder,
    required this.render,
    required this.buildWhen,
    required this.listenWhen,
    required this.listener,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hasListener) {
      return BlocListener<B, S>(
        listener: listener,
        listenWhen: listenWhen,
        child: hasBuilder ? BlocBuilder<B, S>(
          buildWhen: buildWhen,
          builder: (context, state) => render(context),
        ) : render(context),
      );
    }
    if (hasBuilder) {
      return BlocBuilder<B, S>(
        buildWhen: buildWhen,
        builder: (context, state) => render(context),
      );
    }
    return render(context);
  }
}



