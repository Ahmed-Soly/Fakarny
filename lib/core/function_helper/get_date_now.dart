String getDateNow() {
  DateTime now = DateTime.now();
  String formattedDate = '${now.year}-${now.month}-${now.day}';
  return formattedDate;
}