

import '../../../../domain/entity/entity.dart';

class BankInfoJson {
  final String bankName, accountNo, ifscCode, branchName, passbookImage;

  const BankInfoJson({
    required this.bankName,
    required this.accountNo,
    required this.ifscCode,
    required this.branchName,
    required this.passbookImage,
  });

  factory BankInfoJson.fromMap(Map<String, dynamic> json) {
    return BankInfoJson(
      bankName: json['bank_name'] as String? ?? '',
      accountNo: json['account_number'] as String? ?? '',
      ifscCode: json['ifsc_code'] as String? ?? '',
      branchName: json[''] as String? ?? '',
      passbookImage: json['passbook_photo'] as String? ?? '',
    );
  }

  BankInfo toDomain() => BankInfo(
      bankName: bankName,
      accountNo: accountNo,
      ifscCode: ifscCode,
      branchName: branchName,
      passbookImage: passbookImage);
}
