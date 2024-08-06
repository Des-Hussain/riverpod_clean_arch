
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final incrementingUuidGeneratorProvider =
Provider<IncrementingUuidGenerator>((ref) {
  return IncrementingUuidGenerator();
});

class IncrementingUuidGenerator {
  // final Uuid _uuid = Uuid();

//   String generateUuid() {
//     return _uuid.v4();
//   }
}

class CommonFunctions {
  // Define your threshold for a 'small' device width
  static const double smallDeviceWidth = 360.0;
  static double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Future<bool> checkInternetConnectivity() async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     debugPrint('I am connected to a mobile network');
  //     return true;
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     debugPrint('I am connected to a wifi network.');
  //     return true;
  //   } else if (connectivityResult == ConnectivityResult.ethernet) {
  //     debugPrint('I am connected to a ethernet network.');
  //     return true;
  //   } else if (connectivityResult == ConnectivityResult.vpn) {
  //     debugPrint('I am connected to a vpn network.');
  //     return true;
  //     // I am connected to a vpn network.
  //     // Note for iOS and macOS:
  //     // There is no separate network interface type for [vpn].
  //     // It returns [other] on any device (also simulator)
  //   } else if (connectivityResult == ConnectivityResult.bluetooth) {
  //     debugPrint('I am connected to a bluetooth');
  //     return true;
  //     // I am connected to a bluetooth.
  //   } else if (connectivityResult == ConnectivityResult.other) {
  //     debugPrint(
  //         'I am connected to a network which is not in the above mentioned networks.');
  //     return false;
  //     // I am connected to a network which is not in the above mentioned networks.
  //   } else if (connectivityResult == ConnectivityResult.none) {
  //     debugPrint('I am not connected to any network.');
  //     return false;
  //     // I am not connected to any network.
  //   } else {
  //     return false;
  //   }
  // }

  bool isSmallDeviceWidth(){
    if (smallDeviceWidth < smallDeviceWidth) {
      // Code for small width devices
      return true;
    } else {
      // Code for larger devices
      return false;
    }
  }

// static Stream<List<Exercise>> readExercise() {
//   return mainDocument.collection('Exercise').snapshots().map(
//         (snapshot) => snapshot.docs
//             .map((doc) => Exercise.fromJson(doc.data()))
//             .toList(),
//       );
// }

// static Future<List<Map<String, dynamic>>> search(String query) async {
//   final firestore = FirebaseFirestore.instance;
//
//   try{
//     final snapshot = await firestore
//         .collection(Strings.exerciseCollection)
//         .where('name', isGreaterThanOrEqualTo: query)
//         .where('name', isLessThan: query + 'z')
//         .orderBy('name')
//         .get();
//
//     final List<Map<String, dynamic>> exercises =
//     snapshot.docs.map((doc) => doc.data()).toList();
//
//     return exercises;
//   }
//   catch (e) {
//   print('Error searching exercises: $e');
//   return [];
//   }
// }

//
// static Future createExercise(Exercise exerciseModel) async {
//   final docExercise = mainDocument.collection('Exercise').doc();
//   exerciseModel.id = docExercise.id;
//   exerciseModel.userUid = finaldoc;
//   final json = exerciseModel.toJson();
//   await docExercise.set(json);
// }

// static Future<void> deleteItem({
//   // required String userUid,
//   required String docId,
// }) async {
//   await mainDocument.collection('Exercise').doc(docId).delete();
// }

// void search(String value) {
//    var result = <Exercise>[];

//   if (value.isEmpty) {
//     result = exerciseList;
//   } else {
//     result = exerciseList
//         .where((element) =>
//             element.name.toLowerCase().contains(value.toLowerCase()))
//         .toList();
//   }
//   setState(() {
//     filteredExerciseList = result;
//   });
// }
}
