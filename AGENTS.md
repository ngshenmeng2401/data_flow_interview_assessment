# Flutter App Agent Guide

## Scope

- Applies to this folder.
- Inherits root rules unless overridden here.

## General Rules

* Before using any new package from pub.dev, suggest it first and get user approval.
* Do not create new top-level or `lib` folders when an existing folder already fits.

## Naming and Dart Style

* Use snake_case for file name.
* Use camelCase for variable/function name.
* Use PascalCase for class name.
* Prefer single quotes for strings, imports, and other literals; use double quotes only when single quotes are not available or when double quotes avoid escaping and make the code more readable.
* Add `Async` suffix to every async function or method name, except framework overrides or third-party API methods whose names are fixed.
* Always use braces for all control flow.
* Single-line `if`, `else`, `try`, `catch`, and similar shorthand forms are not allowed.
* Multiline control flow only.
* All params/properties must have explicit types.
* Avoid `dynamic` unless explicitly justified.
* Use `const` where possible.

## Navigation and Constants

* Use `go_router` only.
* Keep all routes in `lib/app_router.dart`.
* Do not create per-enum files or enum subfolders.
* Every enum must stay in `lib/constants/enums.dart`.

## State Management

* Do not use `setState`.
* Widget-level state must use `ValueNotifier`.
* Screen-level state must use `Obx`.
* Use GetX controller only for global/shared state when necessary.
* For screen refreshes, use `Obx` and wrap only the smallest UI part that actually updates.

## UI and Localization

* No business logic in widgets.
* UI must be deterministic from state.
* No hardcoded user-facing string text.
* All user-facing text must use i18n.
* Use `Lang.of(context).xxx` to get localized messages. Do not determine the current language manually or return hardcoded strings based on language checks.
* Always search existing localized strings and reuse them if available; only add new localization keys when no suitable existing string exists.
* When adding text for localization, only add it to `.arb` files.
* Do not add dummy, seed, temporary, or fake data payload values to `.arb` localization files; if temporarily displayed, mark the code with `// TODO dummy data / flow` and `// TODO translate` as needed.
* Do not modify `@@locale` values in `.arb` files.
* Always check and add new localization keys to the English `.arb` file first, then add the same keys to other language `.arb` files.
* Do not add prefixes or suffixes to localization keys unless they are really needed, such as to avoid duplicates or distinguish title-case strings with `_title`.
* For normal text such as `Register now`, use a direct key such as `register_now`.
* For title-case text such as `Register` / `Register Now` / `OK`, use a title-specific key such as `register_title` / `register_now_title` / `ok_title`.
* Exception: if temporary generated code must contain unlocalized user-facing text, add `// TODO translate` and do not treat it as production-ready.
* After adding new `.arb` entries, ask the user before running any command such as `flutter pub run intl_utils:generate`.
* No hardcoded styles; use theme/constants.
* For short label-style `Text` widgets, set `maxLines: 1` and use the built-in `overflow: TextOverflow.ellipsis` by default when the user does not specify otherwise.
* For naturally multi-line content such as descriptions, remarks, terms, addresses, messages, API errors, or validation text, choose a reasonable `maxLines` value based on the surrounding UI pattern. Ask the user only when the expected line count is unclear or affects layout behavior.
* Text inside grid item widgets must not scale with the system font size setting. Set `textScaler: TextScaler.noScaling` on those `Text` widgets.
* Before adding new values to `lib/utils/app_theme_config.dart` or `lib/constants/dimensions.dart`, ask the user for permission unless the user explicitly told you to add them.
* Use existing const dimension tokens before adding new numeric UI values that are shared by multiple widgets; if a value is only used by a single widget, keep it local instead of adding a new shared dimension token.
* Prefer `kSpacing` and `kPadding` for spacing and padding values.
* For spacing-only adjustments, use `kSpacing` / `kPadding` with simple calculation patterns such as `kSpacing * 1.3`, `kSpacing * 0.6`, `kPadding * 2`.
* Prefer a flattened widget tree pattern inside `build()` or local builders. Only extract private widgets and private functions when they are reused, repeated, or clearly improve readability.
* In widget trees, a single collection `if` is allowed. Avoid combining `if` and `else` in the widget tree; move the branch into a helper widget or builder method.
* For text in grid item or list item widgets, if the parent container has fixed height, avoid setting vertical padding on the text; align the text to the vertical center instead, or only set top padding for the text.
* Minimum touch target size must not be smaller than 48x48.
* Default image aspect ratio is 1:1 unless another aspect ratio is explicitly justified.
* Use `BoxFit.contain` for `Image` widgets by default unless another fit is explicitly justified.
* Prefer early exit with `if (!mounted) { return; }` after async gaps unless the flow is complicated and must run even if unmounted.

## Screen Structure

* This section applies to screens that do not extend `BaseScreenViewDataState`.
* In screen state classes, order members as: variables; override functions except `build`; public/private logic functions that are not widget-related; `build`; widget/UI-related functions; View/screen private data model classes.
* Always use `Scaffold` for screens.
* If the screen can navigate back, check for and reuse an existing shared app bar widget with a back button when available; otherwise use Flutter's `AppBar` widget with a back button.
* Wrap the screen body with a scroll view by default.
* For vertical scrolling, use `ClampingScrollPhysics` to avoid overscroll effects.
* For horizontal scrolling, use `BouncingScrollPhysics` to keep the bounce overscroll effect.
* If a scroll widget does not support the required physics, follow the widget capability and keep the closest matching behavior.
* Default page size for list and grid pagination is 10.
* If the screen needs startup API data and page loading/error state, prefer `BaseScreenViewDataState` instead of manually creating `Rx<ViewModel<T>>`, `AppViewBuilder`, and `addPostFrameCallback`.
* For screens that intentionally do not use `BaseScreenViewDataState`, keep startup fetch code explicit in the screen and avoid adding fake view data models just to satisfy a base state.
* When submitting form data, unfocus first to hide the soft keyboard.
* Before submitting form data, check whether the form is already loading; if it is loading, skip the submit.
* Save the form and perform validation before calling any async task.
* Show the loading dialog with `DialogManager` from `lib/widgets/dialogs/manager/dialog_manager.dart` before the async task starts.
* Perform submit async tasks, such as repository calls, inside a `try/catch/finally` block.
* On submit success, show a success alert dialog with `DialogManager`.
* If the response message is null, blank, or `OK` case-insensitive, use `Lang.of(context).data_saved_success` as the success message.
* In `catch`, log the original caught exception first with `LogService` from `lib/utils/services/log_service.dart`.
* After logging, convert the caught exception by calling `resolveViewModelException` when the screen state extends `BaseScreenState` from `lib/screens/base/base_screen_state.dart`; this returns a `ViewModelException` for UI display.
* Show the resolved exception string with `DialogManager` alert dialog.
* In `finally`, set the form loading state to false.
* The loading dialog closes itself if an alert dialog is shown; otherwise close the loading dialog manually.

## Base Screen View Data State Pattern

* Prefer `BaseScreenViewDataState` from `lib/screens/base/base_screen_view_data_state.dart` for screens that need standardized startup view data loading, `ViewModel<T>` state, retry, exception handling, and stale request protection.
* `BaseScreenViewDataState` owns only typed `viewData` and `reloadPageDataAsync`; it must not own scaffold, safe area, app bar, refresh UI, or build wrappers.
* Screens extending `BaseScreenViewDataState` must keep `build()` explicit and usually pass `viewData` into `AppScreenViewBuilder`.
* Use `AppScreenViewBuilder` in the screen `build()` method for common scaffold, safe area, app view state, background image, and refresh wrapper structure.
* When `AppScreenViewBuilder` enables pull-to-refresh or load-more, its `builder` must directly return the primary scroll widget such as `ScrollView`, `ListView`, `GridView`, or `CustomScrollView`. Do not return a private wrapper widget that contains the scroll widget, because pull-to-refresh requires the scroll widget to be supplied directly.
* Implement `loadPageDataAsync()` for the startup/retry data request. Put first-page API calls and view data composition there.
* Configure page-load unauthorized and error-modal behavior through `ScreenViewDataStateConfigs`.
* For screens with pull-to-refresh, call `reloadPageDataAsync` from the refresh handler and keep the `RefreshController` in the screen.
* For screens with pagination, keep page index, total count, stale page request serial, append/replace behavior, and load-more handling in the screen. Do not create another paged base state.
* For screens with mixed data, keep the custom private view data model in the screen and use `BaseScreenViewDataState`.
* Do not use `BaseScreenViewDataState` for pure form/action screens that have no startup API data. Extend `BaseScreenState` directly instead.
* Use `submitActionAsync` or `runActionAsync` for submit/action flows instead of duplicating progress dialog, try/catch, logging, and exception modal logic.
* Screen-level view model, view data, field model, and submission model classes must be private when they are only used in the same screen file. Example: use `_RegisterViewModel`, `_ScreenData`, `_LoginFieldModel`, or `_RegisterSubmissionModel`.
* Keep model classes public only when they are intentionally shared with other files/widgets or belong under `lib/core/models`.
* For public + authorized screens, set page-load unauthorized behavior explicitly through `ScreenViewDataStateConfigs.showPageLoadSkipLoginButton`.
* For screens using pull-to-refresh with slivers, keep the primary sliver scroll widget visible in the screen builder.

## API and Async Flow

* Use async/await; do not use `.then`.
* Wrap all API calls with `try/catch`.
* Return typed models only; do not return raw `Map`.
* All API URLs must be stored in `lib/core/api/core_api_const.dart`.
* Before adding or using an API URL, check `lib/core/api/core_api_const.dart` for an existing constant.
* If the API URL does not exist, add it to `lib/core/api/core_api_const.dart` first and reuse that constant.

## Error Handling

* Use `rethrow` only in repository and service layers.
* At screen level, if a function returns the error to another function in the same file, `rethrow` is allowed.
* At screen level, if the error is not being returned to another function in the same file, log the original caught exception first, then convert exceptions with `resolveViewModelException` when available, and display the resolved exception through the UI flow.
* Use `base_screen_state` `resolveViewModelException`.

## Models

* All DTO, request, and response models must use `json_serializable`.
* Dart model property names must stay camelCase.
* JSON keys must be snake_case by using `@JsonSerializable(fieldRename: FieldRename.snake)` where applicable.
* Use typed models only.
* After adding a new model or amending an existing model in `lib/core/models`, ask the user before running any command such as `fvm dart run build_runner build --delete-conflicting-outputs` to generate the `.g.dart` files.
* Default values for non-nullable model fields:

  * string = `''`
  * int = `0`
  * double = `0.0`
  * boolean = `false`
  * list = `[]`; prefer nullable constructor params with `field = field ?? []` for list fields.
* Nullable model fields may stay nullable with no default when `null` is meaningful, such as optional fields.

## Security

* Do not put secrets and sensitive data in code.
* No logging sensitive data.
* Use `dart-define-from-file` or injected config.

## Encoding

* Use UTF-8 consistently.
* Always use CRLF (`\r\n`) line endings.
* Do not output `\uXXXX` unless required.
* Do not use smart quotes or garbled text.
* Keep text human-readable and avoid over-escaped JSON.
* If the user does not specify an encoding, always check the file's encoding before reading or writing with PowerShell.
* If the file is UTF-8, enforce PowerShell UTF-8 for both read and write operations.
* For any file containing non-ASCII text or structured key/value data, do not rely on terminal-rendered mojibake when editing. Verify the text with an encoding-aware read, preserve the file's existing ordering/sorting conventions, make one clean change, and confirm the final diff has no corrupted text, duplicate keys, or unintended reordering before finishing.

## Code Generation Notes

* When generating or modifying code, add TODO comments only on code that still needs user retouching, review, replacement, or completion before it is production-ready.
* Do not add TODO comments to finished code just to explain what the code does.
* For dummy or demo data and temporary flow, add comment `// TODO dummy data / flow`.
* For user-facing text that still needs localization later, add comment `// TODO translate`.
* For incomplete or assumption-based code that needs a user decision, add comment `// TODO need user revisit / complete`.
* The next comment line after `// TODO need user revisit / complete` must state exactly what the user needs to retouch, confirm, replace, or complete.

## File Organization

* Keep project-level files and folders in their existing roles:
* `android` and `ios` for platform-specific project files only.
* `assets/icons` and `assets/images` for static app assets.
* `environments` for environment configuration files.
* `test` for tests.
* `tools` for project scripts and helper tooling.
* Keep app source under `lib`:
* `lib/constants` for shared constants and enums.
* `lib/controllers` for shared/global GetX controllers.
* `lib/core/api` for API constants and API-related helpers.
* `lib/core/models` for DTO, request, and response models.
* `lib/generated` for generated localization files.
* `lib/l10n` for `.arb` localization files only.
* `lib/repositories` as middleman for functions and API endpoint calls.
* `lib/screens` for screen-related code.
* `lib/utils` for shared utilities and helpers.
* `lib/widgets` for shared components.
* `lib/app_router.dart` for all routes.
* `lib/firebase_options.dart` for generated Firebase options.
* `lib/main.dart` for app entry point.
* `lib/root_app.dart` for root app composition.
