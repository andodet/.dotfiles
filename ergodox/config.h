/*
  Set any config.h overrides for your specific keymap here.
  See config.h options at https://docs.qmk.fm/#/config_options?id=the-configh-file
*/
#define ORYX_CONFIGURATOR
#define USB_SUSPEND_WAKEUP_DELAY 0
#define FIRMWARE_VERSION u8"OYW9r/nv04R"

#ifdef TAPPING_TERM
#undef TAPPING_TERM
#define TAPPING_TERM 150
#endif // TAPPING_TERM
