// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n/localizations.dart';

abstract class GlobalCupertinoLocalizations implements CupertinoLocalizations {
  GlobalCupertinoLocalizations({@required this.locale}) {
    GlobalMaterialLocalizations.delegate.load(locale).then((value) => _localizations = value);
  }

  final Locale locale;
  MaterialLocalizations _localizations;

  /// A [LocalizationsDelegate] that uses [GlobalCupertinoLocalizations.load]
  /// to create an instance of this class.
  ///
  /// Most internationalized apps will use [GlobalCupertinoLocalizations.delegates]
  /// as the value of [MaterialApp.localizationsDelegates] to include
  /// the localizations for both the material and widget libraries.
  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _CupertinoLocalizationsDelegate();

  /// A value for [MaterialApp.localizationsDelegates] that's typically used by
  /// internationalized apps.
  ///
  /// ## Sample code
  ///
  /// To include the localizations provided by this class and by
  /// [GlobalWidgetsLocalizations] in a [MaterialApp],
  /// use [GlobalCupertinoLocalizations.delegates] as the value of
  /// [MaterialApp.localizationsDelegates], and specify the locales your
  /// app supports with [MaterialApp.supportedLocales]:
  ///
  /// ```dart
  /// new MaterialApp(
  ///   localizationsDelegates: GlobalCupertinoLocalizations.delegates,
  ///   supportedLocales: [
  ///     const Locale('en', 'US'), // English
  ///     const Locale('he', 'IL'), // Hebrew
  ///   ],
  ///   // ...
  /// )
  /// ```
  static const List<LocalizationsDelegate<dynamic>> delegates = <LocalizationsDelegate<dynamic>>[
    GlobalCupertinoLocalizations.delegate,
  ];

  @override
  String get alertDialogLabel => _localizations.alertDialogLabel;

  @override
  String get anteMeridiemAbbreviation => _localizations.anteMeridiemAbbreviation;

  @override
  String get copyButtonLabel => _localizations.copyButtonLabel;

  @override
  String get cutButtonLabel => _localizations.cutButtonLabel;

  @override
  String get pasteButtonLabel => _localizations.pasteButtonLabel;

  @override
  String get postMeridiemAbbreviation => _localizations.postMeridiemAbbreviation;

  @override
  String get selectAllButtonLabel => _localizations.selectAllButtonLabel;

  @override
  String datePickerMediumDate(DateTime date) {
    return _localizations.formatMediumDate(date);
  }

  @override
  String datePickerYear(int yearIndex) {
    return "$yearIndex";
  }

  @override
  String datePickerMonth(int monthIndex) {
    return "$monthIndex";
  }

  @override
  String datePickerDayOfMonth(int dayIndex) {
    return "$dayIndex";
  }

  @override
  String datePickerHour(int hour) {
    return "$hour".padLeft(2, "0");
  }

  @override
  String datePickerMinute(int minute) {
    return "$minute".padLeft(2, "0");
  }

  @override
  String timerPickerHour(int hour) {
    return "$hour".padLeft(2, "0");
  }

  @override
  String timerPickerMinute(int minute) {
    return "$minute".padLeft(2, "0");
  }

  @override
  String timerPickerSecond(int second) {
    return "$second".padLeft(2, "0");
  }
}

class _CupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _CupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => kSupportedLanguages.contains(locale.languageCode);

  static final Map<Locale, Future<CupertinoLocalizations>> _loadedTranslations = <Locale, Future<CupertinoLocalizations>>{};

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    assert(isSupported(locale));
    return _loadedTranslations.putIfAbsent(locale, () {
      final String localeName = intl.Intl.canonicalizedLocale(locale.toString());

      assert(locale.toString() == localeName, 'comparing "$locale" to "$localeName"');

      return SynchronousFuture<CupertinoLocalizations>(getCupertinoTranslation(
        locale,
      ));
    });
  }

  @override
  bool shouldReload(_CupertinoLocalizationsDelegate old) => false;

  @override
  String toString() => 'GlobalCupertinoLocalizations.delegate(${kSupportedLanguages.length} locales)';
}
