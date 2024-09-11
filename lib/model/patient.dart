class Patient {
  String name;
  String location;
  int age;
  String occupation;
  String painDuration;
  String painLocation;
  String painType;
  bool previousInjury;
  bool movementImpact;

  Patient({
    required this.name,
    required this.location,
    required this.age,
    required this.occupation,
    required this.painDuration,
    required this.painLocation,
    required this.painType,
    required this.previousInjury,
    required this.movementImpact,
  });
}
