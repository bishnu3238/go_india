class HomeState {
  final int navbarIndex;
  final bool onlineStatus;
  final String? message;
  final String? errorMessage;

  const HomeState(
      {this.navbarIndex = 0,
      this.onlineStatus = false,
      this.message,
      this.errorMessage});

  HomeState copyWith({
    int? navbarIndex,
    bool? onlineStatus,
    String? message,
    String? errorMessage,
  }) {
    return HomeState(
      navbarIndex: navbarIndex ?? this.navbarIndex,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
    );
  }
}
