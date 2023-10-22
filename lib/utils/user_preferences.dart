import '../model/user.dart';

class UserPreferences {
  static final myUser = User(
    imagePath:
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Sarah Abs',
    email: 'sarah.abs@gmail.com',
    about:
    'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
    phoneNumber: '0592245351',
    location: 'nablus',
    university: '11924826',
    major: 'computer engineer',
    isDarkMode: false,
    skills: [
      Skill(name: 'Skill 1', rating: 4),
      Skill(name: 'Skill 2', rating: 5),
      Skill(name: 'Skill 3', rating: 5),
      // Add more skills here
    ],
  );
}
