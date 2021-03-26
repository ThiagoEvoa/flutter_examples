extension StringExtension on String {
  String toUpperCaseFirstLetter() {
    final String firstLetter = this.substring(0, 1);
    return this.replaceFirst(firstLetter, firstLetter.toUpperCase());
  }

  String getRange(){
    String offset = 'offset=';
    return this.substring(this.indexOf('offset=') + offset.length, this.indexOf('&'));
  }
}
