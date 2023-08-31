class ChatData {
  ChatData(this.fact);
  ChatData.fromJson(Map<String, dynamic> json) : fact = json['fact'];

  final String fact;
}
