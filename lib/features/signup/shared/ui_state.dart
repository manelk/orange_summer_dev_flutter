sealed class UIState {
  const UIState();
}

class Idle extends UIState {
  const Idle();
}

class Loading extends UIState {
  const Loading();
}

class Success<T> extends UIState {
  final T data;

  const Success(this.data);
}

class ErrorState extends UIState {
  final String message;

  const ErrorState(this.message);
}
