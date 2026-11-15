class DoctorModel {
  final String id;
  final String initials;
  final String name;
  final String specialty;
  final String clinic;
  final String address;
  final double rating;
  final int reviewsCount;
  final int yearsExperience;
  final String patients;
  final String distance;
  final double consultationFee;
  final String about;
  final String availability;
  final List<String> availableTimes;
  final String imageUrl;

  DoctorModel({
    required this.id,
    required this.initials,
    required this.name,
    required this.specialty,
    required this.clinic,
    required this.address,
    required this.rating,
    required this.reviewsCount,
    required this.yearsExperience,
    required this.patients,
    required this.distance,
    required this.consultationFee,
    required this.about,
    required this.availability,
    required this.availableTimes,
    this.imageUrl = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'initials': initials,
      'name': name,
      'specialty': specialty,
      'clinic': clinic,
      'address': address,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'yearsExperience': yearsExperience,
      'patients': patients,
      'distance': distance,
      'consultationFee': consultationFee,
      'about': about,
      'availability': availability,
      'availableTimes': availableTimes,
      'imageUrl': imageUrl,
    };
  }

  factory DoctorModel.fromJson(Map<String, dynamic> json, String id) {
    return DoctorModel(
      id: id,
      initials: json['initials'],
      name: json['name'],
      specialty: json['specialty'],
      clinic: json['clinic'],
      address: json['address'],
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'],
      yearsExperience: json['yearsExperience'],
      patients: json['patients'],
      distance: json['distance'],
      consultationFee: (json['consultationFee'] as num).toDouble(),
      about: json['about'],
      availability: json['availability'],
      availableTimes: List<String>.from(json['availableTimes']),
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}