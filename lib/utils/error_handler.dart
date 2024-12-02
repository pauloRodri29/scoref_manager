enum AppErrorType {
  network,
  server,
  authentication,
  timeout,
  unknown,
}

class ErrorHandler {
  /// Retorna uma mensagem amigável ao usuário com base no tipo de erro.
  static String getErrorMessage(AppErrorType errorType) {
    switch (errorType) {
      case AppErrorType.network:
        return 'Não foi possível conectar à internet. Verifique sua conexão e tente novamente.';
      case AppErrorType.server:
        return 'Erro no servidor. Por favor, tente novamente mais tarde.';
      case AppErrorType.authentication:
        return 'Erro de autenticação. Verifique suas credenciais.';
      case AppErrorType.timeout:
        return 'O tempo da solicitação expirou. Tente novamente.';
      case AppErrorType.unknown:
      default:
        return 'Algo deu errado. Tente novamente.';
    }
  }
}
