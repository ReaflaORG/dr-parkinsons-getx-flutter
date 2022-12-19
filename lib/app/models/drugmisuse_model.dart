class DrugmisuseModel {
  int drugMisuseMedicineId;
  final String medicineName;
  final String symptomName;
  final double medicineCapacity;
  final String medicineMaker;
  final List<String> medicineKoTag;
  final List<String> medicineEnTag;
  final String medicineUnit;

  DrugmisuseModel({
    required this.drugMisuseMedicineId,
    required this.medicineName,
    required this.symptomName,
    required this.medicineCapacity,
    required this.medicineMaker,
    required this.medicineKoTag,
    required this.medicineEnTag,
    required this.medicineUnit,
  });

  DrugmisuseModel.fromJson(json)
      : this(
          drugMisuseMedicineId: json['drug_misuse_medicine_id'] != null
              ? json['drug_misuse_medicine_id'] as int
              : 0,
          medicineName: json['medicine_name'] != null
              ? json['medicine_name'] as String
              : '',
          symptomName: json['symptom_name'] != null
              ? json['symptom_name'] as String
              : '',
          medicineCapacity: json['medicine_capacity'] != null
              ? json['medicine_capacity'] * 1.0
              : 0.0,
          medicineMaker: json['medicine_maker'] != null
              ? json['medicine_maker'] as String
              : '',
          medicineKoTag: json['medicine_ko_tag'] != null
              ? List<String>.from(json['medicine_ko_tag'].map((e) => e))
              : [],
          medicineEnTag: json['medicine_en_tag'] != null
              ? List<String>.from(json['medicine_en_tag'].map((e) => e))
              : [],
          medicineUnit: json['medicine_unit'] != null
              ? json['medicine_unit'] as String
              : '',
        );
  Map<String, dynamic> toJson() => {
        'medicineName': medicineName,
        'symptomName': symptomName,
        'medicineCapacity': medicineCapacity,
        'medicineMaker': medicineMaker,
        'medicineKoTag': medicineKoTag,
        'medicineEnTag': medicineEnTag,
        'medicineUnit': medicineUnit,
      };
}
