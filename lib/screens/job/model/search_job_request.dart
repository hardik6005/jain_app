class SearchJobRequest {
  String? city_id;
  String? category;
  String? job_type;
  String? educational_qualification;
  String? extra_details;

  SearchJobRequest(
      {this.city_id,
      this.category,
      this.job_type,
      this.educational_qualification,
      this.extra_details});
}
