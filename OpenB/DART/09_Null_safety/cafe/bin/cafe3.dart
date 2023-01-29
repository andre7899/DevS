class Team {
  late final Coach coach;
}

class Coach {
  late final Team team;
}

void main(List<String> args) {
  final myTeam = Team();
  final myCoach = Coach();
  myTeam.coach = myCoach;
  myCoach.team = myTeam;

  print('All done!');
}
