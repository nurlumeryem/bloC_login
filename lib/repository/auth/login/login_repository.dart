class LoginRepository{
  Future login(String username, String password) async{
    await Future.delayed(Duration(seconds: 3));

    throw Exception("login failed");
  }
}