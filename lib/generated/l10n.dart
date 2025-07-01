// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `RC`
  String get RC {
    return Intl.message(
      'RC',
      name: 'RC',
      desc: '',
      args: [],
    );
  }

  /// `₽`
  String get rub {
    return Intl.message(
      '₽',
      name: 'rub',
      desc: '',
      args: [],
    );
  }

  /// `Назад`
  String get back {
    return Intl.message(
      'Назад',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Программа`
  String get ref_program {
    return Intl.message(
      'Программа',
      name: 'ref_program',
      desc: '',
      args: [],
    );
  }

  /// `Реферальная`
  String get ref_referral {
    return Intl.message(
      'Реферальная',
      name: 'ref_referral',
      desc: '',
      args: [],
    );
  }

  /// `Приглашай друзей, чтобы играть\nи развиваться на сервере вместе!\nПриведенный реферал засчитывается,\nкогда он набрал 3-й игровой уровень`
  String get ref_description {
    return Intl.message(
      'Приглашай друзей, чтобы играть\nи развиваться на сервере вместе!\nПриведенный реферал засчитывается,\nкогда он набрал 3-й игровой уровень',
      name: 'ref_description',
      desc: '',
      args: [],
    );
  }

  /// `Твой код`
  String get ref_your_turn {
    return Intl.message(
      'Твой код',
      name: 'ref_your_turn',
      desc: '',
      args: [],
    );
  }

  /// `%d% от доната`
  String get ref_donate_procent {
    return Intl.message(
      '%d% от доната',
      name: 'ref_donate_procent',
      desc: '',
      args: [],
    );
  }

  /// `Улучшить до %d%`
  String get ref_upgrade {
    return Intl.message(
      'Улучшить до %d%',
      name: 'ref_upgrade',
      desc: '',
      args: [],
    );
  }

  /// `Улучшено на макс.`
  String get ref_max_upgraded {
    return Intl.message(
      'Улучшено на макс.',
      name: 'ref_max_upgraded',
      desc: '',
      args: [],
    );
  }

  /// `Приведенных рефералов`
  String get ref_referrers {
    return Intl.message(
      'Приведенных рефералов',
      name: 'ref_referrers',
      desc: '',
      args: [],
    );
  }

  /// `Накоплено`
  String get ref_accumulated {
    return Intl.message(
      'Накоплено',
      name: 'ref_accumulated',
      desc: '',
      args: [],
    );
  }

  /// `Забрать`
  String get ref_claim {
    return Intl.message(
      'Забрать',
      name: 'ref_claim',
      desc: '',
      args: [],
    );
  }

  /// `Вы пригласили:`
  String get ref_you_invite {
    return Intl.message(
      'Вы пригласили:',
      name: 'ref_you_invite',
      desc: '',
      args: [],
    );
  }

  /// `Чел.`
  String get ref_persons {
    return Intl.message(
      'Чел.',
      name: 'ref_persons',
      desc: '',
      args: [],
    );
  }

  /// `Получить`
  String get ref_get {
    return Intl.message(
      'Получить',
      name: 'ref_get',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
