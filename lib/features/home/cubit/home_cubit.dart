import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/home/data/home_firebase_data_source.dart';
import 'package:grad_project/features/home/models/doctor_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  final HomeFirebaseDataSource _dataSource = HomeFirebaseDataSource();

  String userName = '';

  List<DoctorModel> allDoctors = [];

  List<DoctorModel> doctors = [];

  String get greeting {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning! ';
    }

    if (hour < 17) {
      return 'Good Afternoon! ';
    }

    return 'Good Evening!';
  }

  String get firstName {
    if (userName.isEmpty) {
      return '';
    }

    return userName.split(' ').first;
  }

  Future<void> getHomeData() async {
    emit(HomeLoadingState());

    try {
      await _dataSource.seedDoctors();

      userName = await _dataSource.getUserName();
      allDoctors = await _dataSource.getDoctors();
      doctors = allDoctors;

      emit(HomeSuccessState());
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  void searchDoctors(String text) {
    final search = text.toLowerCase();

    doctors = allDoctors.where((doctor) {
      return doctor.name.toLowerCase().contains(search) ||
          doctor.specialty.toLowerCase().contains(search);
    }).toList();

    emit(HomeSuccessState());
  }
}