class SplashState {
  bool isLoading;
  bool isWaiting;
  double width;
  double height;

  SplashState(
      {this.isLoading = false,
      this.isWaiting = false,
      this.width = 1/10,
      this.height = 1/20});

  factory SplashState.init() => SplashState(isLoading: true, isWaiting: true);

  SplashState copyWith({
      bool? isWaiting,
      bool? isLoading,
    double? width,
    double? height,
  }) =>
      SplashState(
          isLoading: isLoading ?? this.isLoading,
          isWaiting: isWaiting ?? this.isWaiting,

      width: width?? this.width,height: height?? this.height,);

}
