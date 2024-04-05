/// This file is to make a reference for assets instead of hardcoding it.
/// Come in handy when changing assets / deleting unused assets.
library;

/// Declare lottie animations
abstract class LocalAnimations {
  static const String login = 'assets/animations/login.json';
}

/// Declare images
abstract class LocalImages {
  static const String logo = 'assets/launcher/foreground.png';
  static const String scaffoldBg = 'assets/images/bg-gradient.png';
}

/// Declare svg icons
abstract class LocalIons {
  static const String product = 'assets/icons/icons_produk.svg';
  static const String profile = 'assets/icons/icons_profil.svg';
  static const String home = 'assets/icons/icons_sertifikat.svg';
}
