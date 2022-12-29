class BirthDayModel {
  BirthDayModel({
    required this.label,
    required this.birthday,
    required this.isSelected,
  });

  String label;
  int birthday;
  bool isSelected;

  BirthDayModel copyWith({
    required String label,
    required int birthday,
    required bool isSelected,
  }) {
    return BirthDayModel(
      label: label,
      birthday: birthday,
      isSelected: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'birthday': birthday,
      'isSelected': isSelected,
    };
  }
}
