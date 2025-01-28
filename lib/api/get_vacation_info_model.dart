class GetCodeTablesByType {
  List<CodeTables>? codeTables;

  GetCodeTablesByType({this.codeTables});

  GetCodeTablesByType.fromJson(Map<String, dynamic> json) {
    if (json['CodeTables'] != null) {
      codeTables = <CodeTables>[];
      json['CodeTables'].forEach((v) {
        codeTables!.add(new CodeTables.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.codeTables != null) {
      data['CodeTables'] = this.codeTables!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CodeTables {
  int? codeNo;
  String? codeDescp;
  String? codeDescpE;
  int? showInPortal;

  CodeTables({this.codeNo, this.codeDescp, this.codeDescpE, this.showInPortal});
  // Override equality and hashCode
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is CodeTables && codeNo == other.codeNo);

  CodeTables.fromJson(Map<String, dynamic> json) {
    codeNo = json['Code_No'];
    codeDescp = json['Code_Descp'];
    codeDescpE = json['Code_Descp_E'];
    showInPortal = json['Show_In_Portal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code_No'] = this.codeNo;
    data['Code_Descp'] = this.codeDescp;
    data['Code_Descp_E'] = this.codeDescpE;
    data['Show_In_Portal'] = this.showInPortal;
    return data;
  }
}
