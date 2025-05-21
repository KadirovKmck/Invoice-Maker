class DashboardTexts {
  static String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Invoices';
      case 1:
        return 'Outstanding';
      case 2:
        return ''; // скрыть для Paid
      default:
        return '';
    }
  }

  static String getSubtitle(int index) {
    switch (index) {
      case 0:
        return 'Start by creating an invoice.\nLook Professional to your clients';
      case 1:
        return 'You have outstanding invoices to review';
      case 2:
        return ''; // скрыть для Paid
      default:
        return '';
    }
  }
}
