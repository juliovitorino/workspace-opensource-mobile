class PageResultResponseModel<T> {
  final int page;
  final int totalPages;
  final int count;
  final List<T> content;

  const PageResultResponseModel({
    required this.page,
    required this.totalPages,
    required this.count,
    required this.content,
  });

  factory PageResultResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    print('page_result_response_model :: parsing fromJson');

    final response = PageResultResponseModel<T>(
      page: json['page'] as int,
      totalPages: json['totalPages'] as int,
      count: json['count'] as int,
      content: (json['content'] as List<dynamic>)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
    );

    print('page_result_response_model :: parsing fromJson was finished successfully');

    return response;
  }
}
