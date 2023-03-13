class SignUpModel {
  String? _firstname;
  String? _lastname;
  String? _email;
  String? _password;
  String? _passwordConfirmation;
  String? _phone;

  SignUpModel(
      {String? firstname,
      String? lastname,
      String? email,
      String? password,
      String? passwordConfirmation,
      String? phone}) {
    if (firstname != null) {
      this._firstname = firstname;
    }
    if (lastname != null) {
      this._lastname = lastname;
    }
    if (email != null) {
      this._email = email;
    }
    if (password != null) {
      this._password = password;
    }
    if (passwordConfirmation != null) {
      this._passwordConfirmation = passwordConfirmation;
    }
    if (phone != null) {
      this._phone = phone;
    }
  }

  String? get firstname => _firstname;
  set firstname(String? firstname) => _firstname = firstname;
  String? get lastname => _lastname;
  set lastname(String? lastname) => _lastname = lastname;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get passwordConfirmation => _passwordConfirmation;
  set passwordConfirmation(String? passwordConfirmation) =>
      _passwordConfirmation = passwordConfirmation;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;

  SignUpModel.fromJson(Map<String, dynamic> json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
    _phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['email'] = this._email;
    data['password'] = this._password;
    data['password_confirmation'] = this._passwordConfirmation;
    data['phone'] = this._phone;
    return data;
  }
}
