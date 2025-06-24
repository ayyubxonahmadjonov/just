class GetMonthNumber {
  String getMonthNumber(String monthName) {
    const months = {
      'Yan': '01',
      'Fev': '02',
      'Mar': '03',
      'Apr': '04',
      'May': '05',
      'Iyun': '06',
      'Iyul': '07',
      'Avg': '08',
      'Sen': '09',
      'Okt': '10',
      'Noy': '11',
      'Dek': '12',
    };
    return months[monthName] ?? '00';
  }
}
