class AppCommonSettings {
  String? appName;


  AppCommonSettings({this.appName,});

  AppCommonSettings.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['app_name'] = appName;


    return data;
  }
}
