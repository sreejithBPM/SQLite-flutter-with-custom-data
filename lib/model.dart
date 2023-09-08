class BoloRoomMember {
  int roomMemberId;
  int boloRoomId;
  int boloUserId;
  String isRoomAdmin;
  String createdBy;
  DateTime createdOn;
  String createdIP;
  String modifiedBy;
  DateTime modifiedOn;
  String modifiedIP;

  BoloRoomMember({
    required this.roomMemberId,
    required this.boloRoomId,
    required this.boloUserId,
    required this.isRoomAdmin,
    required this.createdBy,
    required this.createdOn,
    required this.createdIP,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.modifiedIP,
  });

  factory BoloRoomMember.fromJson(Map<String, dynamic> json) {
    return BoloRoomMember(
      roomMemberId: json['roomMemberId'],
      boloRoomId: json['boloRoomId'],
      boloUserId: json['boloUserId'],
      isRoomAdmin: json['isRoomAdmin'],
      createdBy: json['createdBy'],
      createdOn: DateTime.parse(json['createdOn']),
      createdIP: json['createdIP'],
      modifiedBy: json['modifiedBy'],
      modifiedOn: DateTime.parse(json['modifiedOn']),
      modifiedIP: json['modifiedIP'],
    );
  }

  Map<String, dynamic> toJson() => {
        'roomMemberId': roomMemberId,
        'boloRoomId': boloRoomId,
        'boloUserId': boloUserId,
        'isRoomAdmin': isRoomAdmin,
        'createdBy': createdBy,
        'createdOn': createdOn.toIso8601String(),
        'createdIP': createdIP,
        'modifiedBy': modifiedBy,
        'modifiedOn': modifiedOn.toIso8601String(),
        'modifiedIP': modifiedIP,
      };
}