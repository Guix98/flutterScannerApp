import 'dart:convert';

ScannedCode scannedCodeFromJson(String str) => ScannedCode.fromJson(json.decode(str));

String scannedCodeToJson(ScannedCode data) => json.encode(data.toJson());

class ScannedCode {
    ScannedCode({
      required this.content,
      required this.isUrl,
    });

    String content;
    bool isUrl;

    factory ScannedCode.fromJson(Map<String, dynamic> json) => ScannedCode(
        content: json["content"],
        isUrl: json["isURL"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "isURL": isUrl,
    };
}
