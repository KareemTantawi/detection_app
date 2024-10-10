class AppState {}

  class AppInitialState extends AppState {}

class AppLoadingState extends AppState {}

class AppSuccessState extends AppState {}


class AppErrorState extends AppState {

  final String message;

  AppErrorState({required this.message});
}


class AppVisibilityState extends AppState {
  final bool obscureText;
  AppVisibilityState(this.obscureText);
}
