class DateTimeInfo {
  static String getWeekday() {
    final weekdays = [
      'Segunda',
      'Terça',
      'Quarta',
      'Quinta',
      'Sexta',
      'Sábado',
      'Domingo'
    ];
    final now = DateTime.now();
    final weekdayIndex = now.weekday -
        1; // Dias da semana começam com 1 (segunda-feira) até 7 (domingo)
    return weekdays[weekdayIndex];
  }

  static String getMonth() {
    final months = [
      'Jan',
      'Fev',
      'Mar',
      'Abr',
      'Mai',
      'Jun',
      'Jul',
      'Ago',
      'Set',
      'Out',
      'Nov',
      'Dez'
    ];
    final now = DateTime.now();
    final monthIndex =
        now.month - 1; // Meses começam com 1 (janeiro) até 12 (dezembro)
    return months[monthIndex];
  }

  static String getDayOfMonth() {
    final now = DateTime.now();
    return now.day.toString();
  }

  static String getYear() {
    final now = DateTime.now();
    return now.year.toString();
  }
}
