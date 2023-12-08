class GetPortResponse {
  late int status;
  late int port;

  GetPortResponse(int status, int port) {
    this.port = port;
    this.status = status;
  }

  factory GetPortResponse.fromJson(Map<String, dynamic> json){
    return GetPortResponse(json['status'] as int, json['porta'] as int);
  }

}
