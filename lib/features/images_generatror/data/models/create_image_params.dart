class CreateImageParams {
  final String prompt;
  final String size;
  final int n;

  CreateImageParams({
    required this.prompt,
    required this.size,
    this.n = 3,
  });

  Map<String, dynamic> toJson() {
    return {
      "prompt": prompt,
      "size": size,
      "n": n,
    };
  }
}
