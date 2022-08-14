
# Overview

This project is using the [official Flutter localization](https://docs.flutter.dev/development/accessibility-and-localization/internationalization).

## Adding a new String

To add a new string, navigate to `lib/l10n/app_en.arb`.

```json
{
    "helloWorld": "Hello World!",
    "@helloWorld": {
      "description": "The conventional newborn programmer greeting"
    }
}
```

In here you can add another String and optionally also add metadata for that String.
For more information about the possible metadata check out [this article by localizely](https://localizely.com/flutter-arb/).


## Adding a new language

To add another language, simply copy the `app_en.arb` and change the `en` to the language tag you want to support.
Make sure you also translate all the string values in there :)

## Using localized Strings in the app

Type safe access to the localized Strings are generated on the fly by Flutter. To make access easier, this project includes
a util `S` class that makes accessing easier.

If you have a context (such as in the UI) simply do:

```dart
S.of(context).helloWorld
```

If you want to generate localized Strings inside the app logic, you can use the `LocalizedString` class.
When creating a state, for example, that should include some localized text, simply do:

```dart
state = MyErrorState(
   error: (localizations) => localizations.myError,
);
```

When consuming this state in the UI, you can access the String using:

```dart
Text(myState.error(S.of(context)),
```