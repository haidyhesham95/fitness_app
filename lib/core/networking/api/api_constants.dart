class ApiConstants {
  static const String baseUrl = "https://fitness.elevateegy.com/";
  static const String mealsBaseUrl = "https://www.themealdb.com/api/json/v1/1/";
  static const String forgetPassword = "api/v1/auth/forgotPassword";
  static const String verifyOtp = "api/v1/auth/verifyResetCode";
  static const String resetPassword = "api/v1/auth/resetPassword";
  static const String signUpApi = 'api/v1/auth/signup';
  static const String signInApi = 'api/v1/auth/signin';
  static const String editProfileApi = 'api/v1/auth/editProfile';
  static const String profileData = 'api/v1/auth/profile-data';
  static const String uploadPhoto = "api/v1/auth/upload-photo";
  static const String getAllWorkouts = "api/v1/muscles";
  static const String getWorkoutsById = "api/v1/musclesGroup";
  static const String getWorkoutsByMuscleGroupId = "api/v1/musclesGroup/by-muscle-group";
  static const String mealsCategories = "categories.php";
  static const String mealsByCategory = "filter.php";
  static const String mealById = "lookup.php";
  static const String exercises = "api/v1/exercises";
  static const String randomMusclesRecommendation = "api/v1/muscles/random";
  static const String randomExercises =
      "/api/v1/exercises/random?targetMuscleGroupId=67c79f3526895f87ce0aa96b&difficultyLevelId=67c797e226895f87ce0aa94b&limit=5";
}