class ChatModel {
  String name;
  String icon;
  String time;
  String currentMessage;
  bool isagroup;
  String status;
  bool groupcheck = false;
  ChatModel(
      {this.name,
      this.icon,
      this.time,
      this.currentMessage,
      this.isagroup,
      this.status,
      this.groupcheck = false});
}
