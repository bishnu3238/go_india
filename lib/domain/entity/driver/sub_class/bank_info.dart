

class BankInfo {
  final String bankName, accountNo, ifscCode, branchName,
   passbookImage;

  const BankInfo({
    required this.bankName,
    required this.accountNo,
    required this.ifscCode,
    required this.branchName,
    required this.passbookImage,
  });

  static const BankInfo empty = BankInfo(
      bankName: 'bankName',
      accountNo: 'accountNo',
      ifscCode: 'ifscCode',
      branchName: 'branchName',
  passbookImage: 'image'
  );

  @override
  String toString() {
    return 'BankInfo{ bankName: $bankName, accountNo: $accountNo, ifscCode: $ifscCode, branceName: $branchName,}';
  }

  BankInfo copyWith({
    String? bankName,
    String? accountNo,
    String? ifscCode,
    String? branchName,
    String? passbookImage,
  }) {
    return BankInfo(
      bankName: bankName ?? this.bankName,
      accountNo: accountNo ?? this.accountNo,
      ifscCode: ifscCode ?? this.ifscCode,
      branchName: branchName ?? this.branchName,
      passbookImage: passbookImage?? this.passbookImage,
    );
  }

  Map<String, String> toMap() {
    return {
      'bank_name': bankName,
      'account_number': accountNo,
      'ifsc_code': ifscCode,
      'branch_name': branchName,
      'passbook_photo': passbookImage,
    };
  }

  factory BankInfo.fromMap(Map<String, dynamic> map) {
    return BankInfo(
      bankName: map['bank_name'] as String,
      accountNo: map['account_number'] as String,
      ifscCode: map['ifsc_code'] as String,
      branchName: map['branch_name'] as String,
      passbookImage: map['passbook_photo'] as String,
    );
  }
}
