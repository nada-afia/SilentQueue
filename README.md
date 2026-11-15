# Silent Queue

A smart clinic appointment and virtual queue app built with Flutter. Patients book a doctor, get a QR code, and follow their place in the queue live from their phone, so there is no need to wait in a crowded waiting room.

## Features

### Booking
- Browse medical specialties (Cardiology, Dental, Dermatology, Pediatrics, General, ...).
- Search and filter the list of available doctors.
- Doctor profile with rating, years of experience, patient count, distance, and an "About" section.
- Pick a date and an available time slot.
- Review the appointment (doctor, date, time, location, consultation fee) before confirming.
- Booking confirmation screen with a QR code for check-in.
- Set a reminder for the appointment.

### Live Queue
- Real-time queue details: your queue number, people ahead of you, and the estimated wait time.
- Live updates without refreshing, powered by Firestore snapshots.
- Notifications when your turn is getting close.

### My Appointments
- Live and confirmed appointments with a "Track Queue" shortcut.
- Reschedule or cancel (swipe to cancel).
- Previous consultations history.
- **Rebook Visit**: book again with the same doctor in one tap.

### Profile and Settings
- Edit profile.
- Notification preferences.
- Language switch between English and Arabic (with RTL support).
- Privacy & security, and help & support.

## Responsive UI

The interface adapts to different screen sizes and pixel densities, from small phones to large phones and tablets, using `flutter_screenutil` for scaled sizes (`.w`, `.h`, `.sp`) and flexible layouts that avoid fixed pixel sizes. Screens scroll safely on small devices, and the layout mirrors correctly in Arabic (RTL).

## Tech Stack

- **Flutter** and Dart
- **Firebase**: Authentication, Cloud Firestore, Cloud Messaging (FCM), Cloud Functions, Storage
- **State management**: Bloc / Cubit
- **Localization**: easy_localization (English and Arabic)
- **Responsive sizing**: flutter_screenutil
- **QR code**: qr_flutter

## Project Structure

```
lib/
├── core/        # constants, routing, utils, shared widgets
├── api/         # data sources and Firebase services
├── domain/      # entities and repositories
└── features/    # UI screens and cubits (auth, home, booking, queue, appointments, profile)
```

## Firestore Data Model

```
users/{uid}
doctors/{doctorId}
appointments/{appointmentId}
```

## License

This project is a graduation project and is for educational purposes.
