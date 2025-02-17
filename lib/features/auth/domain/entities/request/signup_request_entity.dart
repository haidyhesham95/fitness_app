class SignUpRequestEntity {
  SignUpRequestEntity({
      String? firstName, 
      String? lastName, 
      String? email, 
      String? password, 
      String? rePassword, 
      String? gender, 
      int? height,
      int? weight,
      int? age,
      String? goal, 
      String? activityLevel,}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;
    _rePassword = rePassword;
    _gender = gender;
    _height = height;
    _weight = weight;
    _age = age;
    _goal = goal;
    _activityLevel = activityLevel;
}
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _password;
  String? _rePassword;
  String? _gender;
  int? _height;
  int? _weight;
  int? _age;
  String? _goal;
  String? _activityLevel;
SignUpRequestEntity copyWith({  String? firstName,
  String? lastName,
  String? email,
  String? password,
  String? rePassword,
  String? gender,
  int? height,
  int? weight,
  int? age,
  String? goal,
  String? activityLevel,
}) => SignUpRequestEntity(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  password: password ?? _password,
  rePassword: rePassword ?? _rePassword,
  gender: gender ?? _gender,
  height: height ?? _height,
  weight: weight ?? _weight,
  age: age ?? _age,
  goal: goal ?? _goal,
  activityLevel: activityLevel ?? _activityLevel,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get password => _password;
  String? get rePassword => _rePassword;
  String? get gender => _gender;
  int? get height => _height;
  int? get weight => _weight;
  int? get age => _age;
  String? get goal => _goal;
  String? get activityLevel => _activityLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['password'] = _password;
    map['rePassword'] = _rePassword;
    map['gender'] = _gender;
    map['height'] = _height;
    map['weight'] = _weight;
    map['age'] = _age;
    map['goal'] = _goal;
    map['activityLevel'] = _activityLevel;
    return map;
  }

}