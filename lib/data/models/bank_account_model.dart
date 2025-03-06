class BankAccountModel {
  String? name;
  String? idNumber;
  String? dateOfBirth;
  String? profilePhotoPath;
  String? bankName;

  BankAccountModel({
    this.name,
    this.idNumber,
    this.dateOfBirth,
    this.profilePhotoPath,
    this.bankName
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'idNumber': idNumber,
      'dateOfBirth': dateOfBirth,
      'profilePhotoPath': profilePhotoPath,
      'bankName' : bankName
    };
  }

  factory BankAccountModel.fromJson(Map<String, dynamic> json) {
    return BankAccountModel(
      name: json['name'],
      idNumber: json['idNumber'],
      dateOfBirth: json['dateOfBirth'],
      profilePhotoPath: json['profilePhotoPath'],
      bankName: json['bankName']
    );
  }
}
