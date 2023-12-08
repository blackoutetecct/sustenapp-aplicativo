class FormValidator {
  static validateEmailField(value) {
    if (value.isEmpty) {
      return "Campo obrigatório!";
    }

    RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegex.hasMatch(value)) {
      return "Informe um email válido!";
    }

    return null;
  }

  static validateEmptyField(value) {
    if (value.isEmpty) {
      return "Campo obrigatório!";
    }
    return null;
  }

  static validateNameField(value) {
    if (value.isEmpty) {
      return "Campo obrigatório!";
    }

    RegExp nomeRegex = RegExp(r'^[a-zA-ZÀ-ÿ\s]{2,50}$');

    if (!nomeRegex.hasMatch(value)) {
      return "Formato de nome invalido!";
    }

    return null;
  }

  static validatePasswordField(value) {
    if (value.isEmpty) {
      return "Campo obrigatório!";
    }

    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasNumber = value.contains(RegExp(r'[0-9]'));

    if (!hasUppercase) {
      return "A senha deve conter pelo menos uma letra maiúscula!";
    }

    if (!hasLowercase) {
      return "A senha deve conter pelo menos uma letra minúscula!";
    }

    if (!hasNumber) {
      return "A senha deve conter pelo menos um número!";
    }

    if (value.length < 6) {
      return "A senha deve ter pelo menos 6 caracteres!";
    }

    return null;
  }

  static validatePhoneNumber(value) {
    if (value.isEmpty) {
      return "Campo obrigatório!";
    }

    RegExp phoneRegex = RegExp(r'^(\d{2}\s?)?\d{5}-?\d{4}$');

    if (!phoneRegex.hasMatch(value)) {
      return "Numero de telefone inválido";
    }

    return null;
  }

  static validateCPF(value) {
    if (value.isEmpty) {
      return "Campo obrigatório!";
    }

    // Remove any non-digit characters
    final cleanCPF = value.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanCPF.length != 11) {
      return "CPF deve conter 11 dígitos!";
    }

    // Validate the CPF using the algorithm
    if (!isValidCPF(cleanCPF)) {
      return "CPF inválido!";
    }

    return null;
  }

  // Function to validate CPF using the algorithm
  static bool isValidCPF(String cpf) {
    const blacklist = [
      "11111111111",
      "22222222222",
      "33333333333",
      "44444444444",
      "55555555555",
      "66666666666",
      "77777777777",
      "88888888888",
      "99999999999",
      "00000000000"
    ];

    if (blacklist.contains(cpf)) {
      return false;
    }

    final List<int> cpfDigits = cpf.split('').map(int.parse).toList();
    int sum1 = 0;
    int sum2 = 0;

    for (int i = 0; i < 9; i++) {
      sum1 += cpfDigits[i] * (10 - i);
      sum2 += cpfDigits[i] * (11 - i);
    }

    int digit1 = (sum1 % 11 < 2) ? 0 : 11 - (sum1 % 11);
    sum2 += digit1 * 2;

    int digit2 = (sum2 % 11 < 2) ? 0 : 11 - (sum2 % 11);

    return cpfDigits[9] == digit1 && cpfDigits[10] == digit2;
  }

  static dynamic validateIpAddress(dynamic ipAddress) {
    if (ipAddress.isEmpty) {
      return "Campo obrigatório!";
    }

    final ipPattern = RegExp(
        r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');
    if (!ipPattern.hasMatch(ipAddress)) {
      return "Endereço de IP inválido";
    }
      return null;
  }
}
