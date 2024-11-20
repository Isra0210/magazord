abstract class Failure implements Exception {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class PermissionDeniedFailure extends Failure {
  PermissionDeniedFailure()
      : super(
          'Permissão negada pelo usuário. Por favor, conceda as permissões necessárias.',
        );
}

class LocationServiceDisabledFailure extends Failure {
  LocationServiceDisabledFailure()
      : super(
          'Serviço de localização está desabilitado. Ative-o para continuar.',
        );
}

class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure()
      : super(
          'Sem conexão com a internet. Verifique sua conexão e tente novamente.',
        );
}

class UnprocessedDataFailure extends Failure {
  UnprocessedDataFailure() : super('Erro ao processar os dados recebidos.');
}

class CityNotFound extends Failure {
  CityNotFound() : super('Cidade não encontrada.');
}

class UnknowFailure extends Failure {
  UnknowFailure(super.error);
}

