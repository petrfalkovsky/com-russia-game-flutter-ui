extension StringX on String {
  String get formatPriceWithSpaces {
    String numberStr = this;

    // пробел каждые 3 цифры справа
    return numberStr.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match.group(0)} ',
    );
  }
}
