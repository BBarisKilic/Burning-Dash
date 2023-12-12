import 'package:burning_dash/game/cubit/cubit.dart';
import 'package:burning_dash/l10n/l10n.dart';
import 'package:burning_dash/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import 'helpers.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    MockNavigator? navigator,
    LoadingCubit? preloadCubit,
    AudioCubit? audioCubit,
  }) {
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: preloadCubit ?? MockPreloadCubit()),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: navigator != null
              ? MockNavigatorProvider(navigator: navigator, child: widget)
              : widget,
        ),
      ),
    );
  }
}
