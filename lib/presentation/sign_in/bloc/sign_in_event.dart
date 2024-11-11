abstract class SignInEvent {}

class PostSignInEvent extends SignInEvent {
  final String accountId, password;

  PostSignInEvent({
    required this.accountId,
    required this.password,
  });
}
