class UserData{
  List<dynamic> rooms;
  UserData({required this.rooms});

  factory UserData.fromJson(Map<String, dynamic> json){
    return switch(json){
    {
      'rooms': List<dynamic> rooms
    } => UserData(rooms: rooms),
    _ => throw const FormatException('Gagal membuat penduduk')
  };
  }

}