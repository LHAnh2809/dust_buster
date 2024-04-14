import 'job_details.dart';

class JobDetailsModel {
  List<JobDetails>? jobDetails;
  String? status;

  JobDetailsModel({this.jobDetails, this.status});

  JobDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['job_details'] != null) {
      jobDetails = <JobDetails>[];
      json['job_details'].forEach((v) {
        jobDetails!.add(new JobDetails.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobDetails != null) {
      data['job_details'] = this.jobDetails!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}
