class Collecteur {
  final String? id;
  final String? matricule;
  final String? nom;
  final String? prenom;
  final String? username;
  final String? password;
  final String? role;

  Collecteur({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.username,
    this.password,
    this.role,
  });

  // Une méthode factory pour créer une instance de Collecteur à partir d'une carte JSON
  factory Collecteur.fromJson(Map<String, dynamic> json) {
    return Collecteur(
      id: json['_id'],
      matricule: json['matricule'],
      nom: json['nom'],
      prenom: json['prenom'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
    );
  }
}
