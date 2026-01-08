{settings, ...}: let
  locale = settings.locale.defaultLocale;
in {
  # Set your time zone.
  time.timeZone = settings.locale.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEUSONE = locale;
    LC_TIME = locale;
  };
}
