class HandlerState {
  final bool isLoading;
  final String? errorMessage;

  HandlerState({this.isLoading = false, this.errorMessage});

  HandlerState copyWith({bool? isLoading, String? errorMessage}) {
    return HandlerState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
