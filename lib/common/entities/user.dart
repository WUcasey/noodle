class UserItem{

  //在Model Classes中序列化JSON 序列化的目的是為了把資料結構轉換成可被取用的格式

  String? access_token;
  String? token;
  //user nickname
  String? name;
  // user 悄悄話
  String? first_description;
  //user level
  int? level;
  //user birthday
  DateTime? birthday;

  UserItem({
    this.access_token,
    this.token,
    this.name,
    this.first_description,
    this.birthday,
    this.level
  });

  //一個User.fromJson() 建構子 為了從map structure中 建構出一個新的User實例
  factory UserItem.fromJson(Map<String,dynamic> json)=>
    UserItem(
      access_token: json["access_token"],
      token: json["token"],
      name: json["name"],
      first_description: json["first_description"],
      birthday: json["birthday"],
      level: json["level"],
    );
  
  //一個toJson() 用來轉換一個User實例成map
  Map<String , dynamic> toJson() => {
    "access_token": access_token,
    "token": token,
    "name": name,
    "first_description":first_description,
    "birthday":birthday,
    "level":level,
  };
}