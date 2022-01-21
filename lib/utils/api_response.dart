class ApiResponse {
  dynamic model;
  String errorMessage = '';
  bool isLoading = true;
  ApiResponse.loading(this.isLoading);
  ApiResponse.success(this.isLoading, this.model);
  ApiResponse.error(this.isLoading, this.errorMessage);
}
