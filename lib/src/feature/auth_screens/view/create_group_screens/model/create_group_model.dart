class CreateGroupModel {
  final String selectedLabel;
  final bool isLoading;

  CreateGroupModel({ required this.selectedLabel ,required this.isLoading});

  CreateGroupModel copyWith({String? selectedLabel,bool?isLoading}) {
    return CreateGroupModel(selectedLabel: selectedLabel ?? this.selectedLabel, isLoading:isLoading??this.isLoading);
  }
}
