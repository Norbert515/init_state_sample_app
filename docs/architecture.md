
# Architecture

This document outlines the architectural decisions and best practices in the codebase.


## General Architecture Philosophy

This project uses a data driven and reactive architecture. This means, there should always only
be one single source of truth and most of the state should be derived from that. For example this
could mean that there is a database that exposes a stream of the current user. Instead of caching
this user and potentially modifying stale copies, everything (including the UI) should be driven by
this stream. A single source of truth is one of the best ways to ensure consitency and a bug free app.

In addition, this project uses a layered architecture, this means every piece of code has a designated layer it
is written in.

#### UI Layer 

The UI layer is strictly for UI. No logic should be ever written inside a widget. Logic is defined as anything
that could potentially benefit from a unit test.


>:x: **DO NOT**
>```dart
Container(
    child: Text(user.firstName + ' ' + user.secondName)
)
>```

Even though, this 'logic' is very light, things like these accumulate. To test this code, a full-blown
widget tests is needed. To test the same code in the user object, a unit test is enough.
Furthermore, any other feature in the project that needs to access the formatted full name of the user
doesn't have to re-implement it.

>:white_check_mark: **DO**
>```dart
Container(
    child: Text(user.getFullName())
)
>```

#### Application Layer

The application layer is also commonly known as 'state management'. For this layer, [Riverpod](https://riverpod.dev/) we use.
Check it its documentation for further information, but in essence it allows us to expose reactive state to the UI
based on the business and data layer.

Providers should be small and plentiful and only implement a single thing if it might be reused.

#### Business Layer

The business layer is just the rules that make up the app. The business layer is mostly pure functions that process data
and return something new. Examples of business layer code is:

- Helper methods on objects (`user.getFullName`)
- Collection of pure functions that process objects (`user.getFavoriteSubscription(subscriptionState)`)

The point of these methods is that they are easy to write, read, test and maintain.

#### Data Layer

The data layer is the lowest layer of the application, it's point is to provide simple access to reactive data from
some sort of database (for example firebase).

Things like offline support etc. should be implemented on this layer.

## Folder Structure

This project uses a recursive folder structure.

```
- l10n/
- modules/
    - module_name/
        - widgets/
        - utils/
        - state/
        - modules/
        - module_main_page.dart
    - module2_name/
- style/
- utils/
- app.dart
- main.dart
```

The top level contains a couple of files and folder used by every part of the app. Apart from that, every module of the app
has its own folder containing a full slice of the layers (grouping by feature). Every module can itself have submodules,
this allows for big features to be split up into further smaller modules that can live independently.

Modules are allowed to reference each other, but should stay withing its own boundaries most of the time.