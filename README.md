# flutter_cupertino_localizations

provider localization for cupertino.
just en and zh, because others is not finished yet.
and there is no plan to do it, because I can't those languages.

You can use it to fixed the error:
```The getter 'pasteButtonLabel' was called on null.```
if you wan't use ```DefaultCupertinoLocalizations```.


```CupertinoLocalizations``` 居然只提供英文的 ```DefaultCupertinoLocalizations```，真特么的想说脏话。

## Usage
```
MaterialApp(
  locale: Locale('zh', 'CH'),
  localizationsDelegates: [
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    const Locale('zh', 'CH'),
    const Locale('en', 'US'),
  ],
 ...
}
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our
[online documentation](https://flutter.io/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
