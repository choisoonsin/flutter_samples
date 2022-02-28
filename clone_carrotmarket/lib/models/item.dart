class Item {
  Item(
      {required this.imgUrl,
      required this.itemName,
      required this.locationName,
      required this.refreshTime,
      required this.amount,
      int this.favorites = 0,
      int this.chatCnt = 0});

  final String imgUrl;
  final String itemName;
  final String locationName;
  final String refreshTime;
  final int amount;
  final int favorites;
  final int chatCnt;

  Item.fromJson(Map<String, dynamic> json)
      : imgUrl = json['imgUrl'],
        itemName = json['itemName'],
        locationName = json['locationName'],
        refreshTime = json['refreshTime'],
        amount = json['amount'],
        favorites = json['favorites'],
        chatCnt = json['chatCnt'];

  Map<String, dynamic> toJson() => {
        'imgUrl': imgUrl,
        'itemName': itemName,
        'locationName': locationName,
        'refreshTime': refreshTime,
        'amount': amount,
        'favorites': favorites,
        'chatCnt': chatCnt,
      };
}
