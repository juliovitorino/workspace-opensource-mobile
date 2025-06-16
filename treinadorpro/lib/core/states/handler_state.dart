class HandlerState<T> {
  final bool isLoading;
  final String? errorMessage;
  final T? objectResponse;

  HandlerState( {this.objectResponse, this.isLoading = false, this.errorMessage});

  HandlerState<T> copyWith({bool? isLoading, String? errorMessage, T? objectResponse}) {
    return HandlerState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      objectResponse: objectResponse
    );
  }
}
