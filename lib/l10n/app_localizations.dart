import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @re_password.
  ///
  /// In en, this message translates to:
  /// **'Re-Enter Password'**
  String get re_password;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forget_password;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Have Account?'**
  String get dont_have_account;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already Have Account?'**
  String get already_have_account;

  /// No description provided for @welcome_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back ✨'**
  String get welcome_title;

  /// No description provided for @language_mode.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language_mode;

  /// No description provided for @language_ar.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get language_ar;

  /// No description provided for @language_en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language_en;

  /// No description provided for @theme_mode.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme_mode;

  /// No description provided for @theme_light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get theme_light;

  /// No description provided for @theme_dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get theme_dark;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @login_with_google.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get login_with_google;

  /// No description provided for @register_account.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register_account;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Maps'**
  String get map;

  /// No description provided for @love.
  ///
  /// In en, this message translates to:
  /// **'Love'**
  String get love;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @sport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get sport;

  /// No description provided for @birth_day.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birth_day;

  /// No description provided for @book_club.
  ///
  /// In en, this message translates to:
  /// **'Book Club'**
  String get book_club;

  /// No description provided for @meeting.
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get meeting;

  /// No description provided for @gaming.
  ///
  /// In en, this message translates to:
  /// **'Gaming'**
  String get gaming;

  /// No description provided for @holiday.
  ///
  /// In en, this message translates to:
  /// **'Holiday'**
  String get holiday;

  /// No description provided for @eating.
  ///
  /// In en, this message translates to:
  /// **'Eating'**
  String get eating;

  /// No description provided for @work_shop.
  ///
  /// In en, this message translates to:
  /// **'Work Shop'**
  String get work_shop;

  /// No description provided for @exhibition.
  ///
  /// In en, this message translates to:
  /// **'Exhibition'**
  String get exhibition;

  /// No description provided for @event_screen_appbar_title.
  ///
  /// In en, this message translates to:
  /// **'Create Event'**
  String get event_screen_appbar_title;

  /// No description provided for @event_title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get event_title;

  /// No description provided for @event_title_hint.
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get event_title_hint;

  /// No description provided for @event_name_empty_error.
  ///
  /// In en, this message translates to:
  /// **'Event Title cannot be empty'**
  String get event_name_empty_error;

  /// No description provided for @event_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get event_description;

  /// No description provided for @event_description_hint.
  ///
  /// In en, this message translates to:
  /// **'Event Description'**
  String get event_description_hint;

  /// No description provided for @event_description_empty_error.
  ///
  /// In en, this message translates to:
  /// **'Event Description cannot be empty \nor less than 20 character'**
  String get event_description_empty_error;

  /// No description provided for @event_date.
  ///
  /// In en, this message translates to:
  /// **'Event Date'**
  String get event_date;

  /// No description provided for @event_time.
  ///
  /// In en, this message translates to:
  /// **'Event Time'**
  String get event_time;

  /// No description provided for @event_choose_date.
  ///
  /// In en, this message translates to:
  /// **'Choose Date'**
  String get event_choose_date;

  /// No description provided for @event_choose_time.
  ///
  /// In en, this message translates to:
  /// **'Choose Time'**
  String get event_choose_time;

  /// No description provided for @event_location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get event_location;

  /// No description provided for @event_location_text.
  ///
  /// In en, this message translates to:
  /// **'Choose Event Location'**
  String get event_location_text;

  /// No description provided for @event_add_button_text.
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get event_add_button_text;

  /// No description provided for @event_toast_date_empty.
  ///
  /// In en, this message translates to:
  /// **'Date of Event cannot be empty'**
  String get event_toast_date_empty;

  /// No description provided for @event_toast_time_empty.
  ///
  /// In en, this message translates to:
  /// **'Time of Event cannot be empty'**
  String get event_toast_time_empty;

  /// No description provided for @event_toast_create_success.
  ///
  /// In en, this message translates to:
  /// **'Event Created Successfully'**
  String get event_toast_create_success;

  /// No description provided for @event_toast_create_error.
  ///
  /// In en, this message translates to:
  /// **'Cannot Create Events now try again Later!'**
  String get event_toast_create_error;

  /// No description provided for @event_details_screen_appbar_title.
  ///
  /// In en, this message translates to:
  /// **'Event Details'**
  String get event_details_screen_appbar_title;

  /// No description provided for @event_search_title.
  ///
  /// In en, this message translates to:
  /// **'Search for Event'**
  String get event_search_title;

  /// No description provided for @event_sheet_confirm_delete_header.
  ///
  /// In en, this message translates to:
  /// **'Sure wanna Delete this Event?'**
  String get event_sheet_confirm_delete_header;

  /// No description provided for @event_sheet_confirm_delete_cancel_text.
  ///
  /// In en, this message translates to:
  /// **'No, Cancel'**
  String get event_sheet_confirm_delete_cancel_text;

  /// No description provided for @event_sheet_confirm_delete_text.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get event_sheet_confirm_delete_text;

  /// No description provided for @event_sheet_confirm_toast_success.
  ///
  /// In en, this message translates to:
  /// **'Deleted Successfully'**
  String get event_sheet_confirm_toast_success;

  /// No description provided for @event_edit_screen_button_text.
  ///
  /// In en, this message translates to:
  /// **'Edit Event'**
  String get event_edit_screen_button_text;

  /// No description provided for @register_successfully_msg.
  ///
  /// In en, this message translates to:
  /// **'Account Successfully Created'**
  String get register_successfully_msg;

  /// No description provided for @register_weak_password_msg.
  ///
  /// In en, this message translates to:
  /// **'The password provided is too weak.'**
  String get register_weak_password_msg;

  /// No description provided for @register_email_already_in_use_msg.
  ///
  /// In en, this message translates to:
  /// **'The account already exists for that email.'**
  String get register_email_already_in_use_msg;

  /// No description provided for @login_successfully_msg.
  ///
  /// In en, this message translates to:
  /// **'Welcome you got successfully logged-in'**
  String get login_successfully_msg;

  /// No description provided for @login_invalid_credential_msg.
  ///
  /// In en, this message translates to:
  /// **'Invalid Credential'**
  String get login_invalid_credential_msg;

  /// No description provided for @login_unexpected_msg.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get login_unexpected_msg;

  /// No description provided for @login_screen_email_empty_msg.
  ///
  /// In en, this message translates to:
  /// **'Email Field cannot be Empty'**
  String get login_screen_email_empty_msg;

  /// No description provided for @login_screen_email_not_vaild_email_msg.
  ///
  /// In en, this message translates to:
  /// **'Please Enter a vaild Eamil'**
  String get login_screen_email_not_vaild_email_msg;

  /// No description provided for @login_screen_password_empty_msg.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be Empty'**
  String get login_screen_password_empty_msg;

  /// No description provided for @login_screen_password_not_valid_msg.
  ///
  /// In en, this message translates to:
  /// **'Password does not meet the requirements'**
  String get login_screen_password_not_valid_msg;

  /// No description provided for @password_confirmation_empty_msg.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation cannot be empty'**
  String get password_confirmation_empty_msg;

  /// No description provided for @password_confirmation_not_match_msg.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match, please check it'**
  String get password_confirmation_not_match_msg;

  /// No description provided for @password_empty_msg.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get password_empty_msg;

  /// No description provided for @password_not_valid_msg.
  ///
  /// In en, this message translates to:
  /// **'Password should be:\n* At least 8 characters long\n* Contain at least one uppercase letter\n* Contain at least one lowercase letter\n* Contain at least one digit\n* Contain at least one special character'**
  String get password_not_valid_msg;

  /// No description provided for @email_empty_msg.
  ///
  /// In en, this message translates to:
  /// **'Email field cannot be empty'**
  String get email_empty_msg;

  /// No description provided for @email_not_valid_msg.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get email_not_valid_msg;

  /// No description provided for @name_empty_msg.
  ///
  /// In en, this message translates to:
  /// **'Name cannot be empty'**
  String get name_empty_msg;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
