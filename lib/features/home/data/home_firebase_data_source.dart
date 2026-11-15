import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grad_project/features/home/models/doctor_model.dart';

class HomeFirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> getUserName() async {
    try {
      User user = _auth.currentUser!;
      DocumentSnapshot doc = await _firestore
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return data['fullName'] ?? '';
      }

      return (user.email ?? '').split('@').first;
    } catch (e) {
      throw Exception('Failed to fetch user name: $e');
    }
  }

  Future<List<DoctorModel>> getDoctors() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('doctors').get();

      return snapshot.docs.map((doc) {
        return DoctorModel.fromJson(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch doctors: $e');
    }
  }

  Future<void> seedDoctors() async {
    final times = [
      '09:00 AM',
      '09:30 AM',
      '10:00 AM',
      '10:30 AM',
      '11:00 AM',
      '11:30 AM',
      '02:00 PM',
      '02:30 PM',
    ];

    final doctors = [
      DoctorModel(
        id: 'doctor_1',
        imageUrl: 'https://i.pinimg.com/1200x/d6/19/d6/d619d6c3c9328ea79f094e1922495dc4.jpg',
        initials: 'SM',
        name: 'Dr. Sarah Mitchell',
        specialty: 'Cardiologist',
        clinic: 'City Heart Center',
        address: '123 Medical Drive, Suite 400',
        rating: 4.8,
        reviewsCount: 234,
        yearsExperience: 15,
        patients: '2.8k+',
        distance: '2.3 km',
        consultationFee: 150,
        about:
            'Dr. Sarah Mitchell is a board-certified cardiologist '
            'with extensive experience in treating heart conditions. '
            'She provides personalized care for every patient.',
        availability: 'Available Today',
        availableTimes: times,
      ),
      DoctorModel(
        id: 'doctor_2',
        imageUrl: 'https://i.pinimg.com/736x/34/4d/30/344d303af9d066d63bf050bb647f8d7e.jpg',
        initials: 'JW',
        name: 'Dr. James Wilson',
        specialty: 'Neurologist',
        clinic: 'Royal Neurology Clinic',
        address: '45 Brain Street, Floor 2',
        rating: 4.9,
        reviewsCount: 189,
        yearsExperience: 8,
        patients: '1.9k+',
        distance: '3.1 km',
        consultationFee: 180,
        about:
            'Dr. James Wilson is a neurologist who treats headaches, '
            'nerve problems and sleep disorders with modern methods.',
        availability: 'Available Tomorrow',
        availableTimes: times,
      ),
      DoctorModel(
        id: 'doctor_3',
        imageUrl: 'https://i.pinimg.com/736x/ee/32/6b/ee326b8a840239c8fbecbab4868881cc.jpg',
        initials: 'EC',
        name: 'Dr. Emily Carter',
        specialty: 'Dermatologist',
        clinic: 'Glow Skin Clinic',
        address: '78 Garden Road, Suite 12',
        rating: 4.7,
        reviewsCount: 156,
        yearsExperience: 9,
        patients: '2.1k+',
        distance: '1.8 km',
        consultationFee: 120,
        about:
            'Dr. Emily Carter is a dermatologist who helps patients '
            'with skin, hair and nail problems.',
        availability: 'Available Today',
        availableTimes: times,
      ),
      DoctorModel(
        id: 'doctor_4',
        imageUrl: 'https://i.pinimg.com/736x/72/a3/51/72a35172dc12b1c3ab3e11fc64dbb8a6.jpg',
        initials: 'OH',
        name: 'Dr. Omar Hassan',
        specialty: 'Pediatrician',
        clinic: 'Little Stars Hospital',
        address: '9 Sunshine Avenue, Floor 1',
        rating: 4.9,
        reviewsCount: 312,
        yearsExperience: 12,
        patients: '3.5k+',
        distance: '4.0 km',
        consultationFee: 100,
        about:
            'Dr. Omar Hassan is a pediatrician who cares for babies '
            'and children from birth until teenage years.',
        availability: 'Available Tomorrow',
        availableTimes: times,
      ),
      DoctorModel(
        id: 'doctor_5',
        imageUrl: 'https://i.pinimg.com/1200x/69/d9/d5/69d9d5fb0658f36b2a50e427428c84af.jpg',
        initials: 'LN',
        name: 'Dr. Laila Nabil',
        specialty: 'Dentist',
        clinic: 'Bright Smile Dental',
        address: '22 Smile Street, Suite 5',
        rating: 4.6,
        reviewsCount: 98,
        yearsExperience: 6,
        patients: '1.2k+',
        distance: '2.7 km',
        consultationFee: 90,
        about:
            'Dr. Laila Nabil is a dentist who offers cleaning, '
            'fillings and cosmetic dental care.',
        availability: 'Available Today',
        availableTimes: times,
      ),
    ];

    for (final doctor in doctors) {
      await _firestore
          .collection('doctors')
          .doc(doctor.id)
          .set(doctor.toJson());
    }
  }
}