class ChatData{
   String username;
   String text;
   String id;

   ChatData({required this.username, required this.text, required this.id});

  Map<String, dynamic> toJson(){
    return {
      'id': this.id,
      'username': this.username,
      'text': this.text,
    };
  }
}