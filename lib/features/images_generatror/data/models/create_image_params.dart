class CreateImageParams {
  final String prompt;
  final String size;
  final int n;

  CreateImageParams({
    required this.prompt,
    required this.size,
    this.n = 3,
  });


  Map<String,dynamic> toJson(){
    Map<String,dynamic> jsonData = {};
    return jsonData;
  }
}
