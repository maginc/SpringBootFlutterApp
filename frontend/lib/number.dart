class Number{

  final int value;
  final String operation;

  Number({this.value, this.operation});

  factory Number.fromJson(Map<String, dynamic> json) {
    return Number(
      value: json['value'],
      operation: json['operation']
    );
  }
}