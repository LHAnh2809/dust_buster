import 'partner.dart';

class JobDetails {
  String? idIV;
  String? idPT;
  int? label;
  String? imagePT;
  String? namePT;
  String? phoneNumber;
  String? nameU;
  String? postingTime;
  String? workingDay;
  String? roomArea;
  String? workTime;
  String? repeat;
  String? location;
  int? price;
  String? petNotes;
  String? employeeNotes;
  int? orderStatus;
  int? invoiceStatus;
  int? repeatState;
  int? paymentMethods;
  int? oneStar;
  int? twoStar;
  int? threeStar;
  int? fourStar;
  int? fiveStar;
  List<Partner>? partner;

  JobDetails(
      {this.idIV,
      this.idPT,
      this.label,
      this.imagePT,
      this.namePT,
      this.phoneNumber,
      this.nameU,
      this.postingTime,
      this.workingDay,
      this.workTime,
      this.repeat,
      this.location,
      this.price,
      this.petNotes,
      this.employeeNotes,
      this.orderStatus,
      this.invoiceStatus,
      this.repeatState,
      this.paymentMethods,
      this.oneStar,
      this.roomArea,
      this.twoStar,
      this.threeStar,
      this.fourStar,
      this.fiveStar,
      this.partner});

  JobDetails.fromJson(Map<String, dynamic> json) {
    idIV = json['idIV'];
    idPT = json['idPT'];
    label = json['label'];
    imagePT = json['imagePT'];
    namePT = json['namePT'];
    phoneNumber = json['phoneNumber'];
    nameU = json['nameU'];
    postingTime = json['postingTime'];
    workingDay = json['workingDay'];
    workTime = json['workTime'];
    repeat = json['repeat'];
    location = json['location'];
    price = json['price'];
    roomArea = json['roomArea'];
    petNotes = json['petNotes'];
    employeeNotes = json['employeeNotes'];
    orderStatus = json['orderStatus'];
    invoiceStatus = json['invoiceStatus'];
    repeatState = json['repeatState'];
    paymentMethods = json['payment_methods'];
    oneStar = json['oneStar'];
    twoStar = json['twoStar'];
    threeStar = json['threeStar'];
    fourStar = json['fourStar'];
    fiveStar = json['fiveStar'];
    if (json['partner'] != null) {
      partner = <Partner>[];
      json['partner'].forEach((v) {
        partner!.add(new Partner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idIV'] = this.idIV;
    data['idPT'] = this.idPT;
    data['label'] = this.label;
    data['imagePT'] = this.imagePT;
    data['namePT'] = this.namePT;
    data['phoneNumber'] = this.phoneNumber;
    data['nameU'] = this.nameU;
    data['postingTime'] = this.postingTime;
    data['workingDay'] = this.workingDay;
    data['workTime'] = this.workTime;
    data['repeat'] = this.repeat;
    data['location'] = this.location;
    data['price'] = this.price;
    data['roomArea'] = this.roomArea;
    data['petNotes'] = this.petNotes;
    data['employeeNotes'] = this.employeeNotes;
    data['orderStatus'] = this.orderStatus;
    data['invoiceStatus'] = this.invoiceStatus;
    data['repeatState'] = this.repeatState;
    data['payment_methods'] = this.paymentMethods;
    data['oneStar'] = this.oneStar;
    data['twoStar'] = this.twoStar;
    data['threeStar'] = this.threeStar;
    data['fourStar'] = this.fourStar;
    data['fiveStar'] = this.fiveStar;
    if (this.partner != null) {
      data['partner'] = this.partner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
