class RoomId{
  String username;
  String username2;

  RoomId({required this.username, required this.username2});

  Map<String, dynamic> toJson(){
    return {
      'username': this.username,
      'username2': this.username2,
    };
  }
}