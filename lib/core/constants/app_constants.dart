/// Konstanta inti aplikasi Kulit Lumpia.
/// Mengacu pada PRD.md, DESIGN.md, dan UX_DESIGN.md.
class AppConstants {
  AppConstants._();

  static const String appName = 'Kulit Lumpia';
  static const String appTagline = 'Kualitas Terbaik untuk Usaha Anda';

  // Aturan Bisnis Kuantitas (Disepakati di Tahap 1)
  static const int minOrderQuantity = 10;
  static const int orderQuantityMultiple = 10;

  // Nama Role Pengguna (SECURITY.md & PRD.md)
  static const String roleBuyer = 'buyer';
  static const String roleAdmin = 'admin';
  static const String roleProduction = 'production';
  static const String roleCourier = 'courier';

  // Status Operasional Pesanan (PRD.md Bagian 8.1)
  static const String statusPendingApproval = 'pending_approval';
  static const String statusApproved = 'approved';
  static const String statusRejected = 'rejected';
  static const String statusProcessing = 'processing';
  static const String statusReadyToShip = 'ready_to_ship';
  static const String statusAssignedToCourier = 'assigned_to_courier';
  static const String statusInDelivery = 'in_delivery';
  static const String statusDeliveryIssue = 'delivery_issue';
  static const String statusDelivered = 'delivered';
  static const String statusCancelled = 'cancelled';

  // Status Pembayaran (PRD.md Bagian 8.2)
  static const String paymentUnpaid = 'unpaid';
  static const String paymentPendingVerification = 'pending_verification';
  static const String paymentPartiallyPaid = 'partially_paid';
  static const String paymentPaid = 'paid';
  static const String paymentFailed = 'failed';
  static const String paymentRefunded = 'refunded';
  static const String paymentPartiallyRefunded = 'partially_refunded';

  // Metode Pembayaran
  static const String paymentMethodTransfer = 'transfer';
  static const String paymentMethodCod = 'cod';
}

