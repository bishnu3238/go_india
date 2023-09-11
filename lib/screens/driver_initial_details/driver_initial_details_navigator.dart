import 'package:go_router/go_router.dart';
import '../../routes/route_path.dart';
import 'export.dart';

class DriverInitialDetailsRoute {
  static GoRoute page() => GoRoute(
        path: Screen.driverInitialDetails.path,
        name: Screen.driverInitialDetails.cName,
        builder: (ctx, state) => const DriverInitialDetails(),
        routes: [
          GoRoute(
            path: Screen.identity.subPath,
            name: Screen.identity.cName,
            builder: (ctx, state) => const IdentityDetails(),
          ),
          GoRoute(
            path: Screen.bankAccountDetails.subPath,
            name: Screen.bankAccountDetails.cName,
            builder: (ctx, state) => const BankAccountDetails(),
          ),
          GoRoute(
            path: Screen.profilePicture.subPath,
            name: Screen.profilePicture.cName,
            builder: (ctx, state) => const ProfilePicture(),
          ),
          GoRoute(
            path: Screen.driverLicenseNo.subPath,
            name: Screen.driverLicenseNo.cName,
            builder: (ctx, state) => const DrivingLicense(),
          ),



          GoRoute(
            path: Screen.aadharCard.subPath,
            name: Screen.aadharCard.cName,
            builder: (ctx, state) => const AadhaarCardDetails(),
          ),
          GoRoute(
            path: Screen.rcCertificate.subPath,
            name: Screen.rcCertificate.cName,
            builder: (ctx, state) => const RcDetails(),
          ),



          GoRoute(
            path: Screen.panCard.subPath,
            name: Screen.panCard.cName,
            builder: (ctx, state) => const PanCard(),
          ),
          GoRoute(
            path: Screen.pollutionUnderControl.subPath,
            name: Screen.pollutionUnderControl.cName,
            builder: (ctx, state) => const Pollution(),
          ),



          GoRoute(
            path: Screen.vehicleInsurance.subPath,
            name: Screen.vehicleInsurance.cName,
            builder: (ctx, state) => const VehicleInsurance(),
          ),
          GoRoute(
            path: Screen.fitnessCertificate.subPath,
            name: Screen.fitnessCertificate.cName,
            builder: (ctx, state) => const FitnessCertificate(),
          ),

          GoRoute(
            path: Screen.vehiclePermit.subPath,
            name: Screen.vehiclePermit.cName,
            builder: (ctx, state) => const VehiclePermit(),
          ),
          GoRoute(
            path: Screen.vehicleAudit.subPath,
            name: Screen.vehicleAudit.cName,
            builder: (ctx, state) => const VehicleAudit(),
          ),
        ],
      );
}
