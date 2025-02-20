sealed class SignupAction {}
class SignupActionSelected extends SignupAction {}

class SelectActivityAction extends SignupAction {
  final String activity;

  SelectActivityAction({required this.activity});
}

class SelectGoalAction extends SignupAction {
  final String goal;

  SelectGoalAction({required this.goal});
}

class SelectHeightAction extends SignupAction {
  final int height;

  SelectHeightAction({required this.height});
}

class SelectWeightAction extends SignupAction {
  final int weight;

  SelectWeightAction({required this.weight});
}

class SelectGenderAction extends SignupAction {
  final String gender;

  SelectGenderAction({required this.gender});
}


class SelectAgeAction extends SignupAction {
  final int age;

  SelectAgeAction({required this.age});
}

class NextStepAction extends SignupAction {}
