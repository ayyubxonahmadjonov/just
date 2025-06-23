class DateUtil {
  static int getYear() => DateTime.now().year;

  static int getMonth() => DateTime.now().month;

  static int getDay() => DateTime.now().day;

  /// Formatga qarab string qaytaradi: yil, oy, kun qo‘shiladi yoki chiqariladi
  static String getFormattedDate({
    bool includeYear = true,
    bool includeMonth = true,
    bool includeDay = true,
    String separator = '-',
  }) {
    final now = DateTime.now();

    final parts = <String>[];
    if (includeYear) parts.add(now.year.toString());
    if (includeMonth) parts.add(now.month.toString().padLeft(2, '0'));
    if (includeDay) parts.add(now.day.toString().padLeft(2, '0'));

    return parts.join(separator);
  }
}
