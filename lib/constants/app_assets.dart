class AppAsset {
  static const svg = _Svg();
  static const img = _Img();
}

class _Img {
  const _Img();

  String get profilePlaceholder => 'assets/img/profile_placeholder.jpg';
}

class _Svg {
  const _Svg();

  String get logo => 'assets/svg/logo.svg';
}
