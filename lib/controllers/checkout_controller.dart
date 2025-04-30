import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Make sure to import the SelectedItem class

class CheckoutController extends GetxController {
  final TextEditingController noToRestaurant = TextEditingController();
  final TextEditingController noteToRider = TextEditingController();
  final TextEditingController fullname = TextEditingController(); 
  final TextEditingController phone = TextEditingController(); 


  var restaurantNote = ''.obs;
  var riderNote = ''.obs;
  var fullnameNote = ''.obs;
  var phoneNote = ''.obs;



  @override
  void onInit() {
    super.onInit();
    noToRestaurant.addListener(() {
      restaurantNote.value = noToRestaurant.text;
    });
    noteToRider.addListener(() {
      riderNote.value = noteToRider.text;
    });
  }

  // void riderOnInit() {
  //   super.onInit();
  //   noteToRider.addListener(() {
  //     riderNote.value = noteToRider.text;
  //   });
  // }

  void fullNameOnInit() {
    super.onInit();
    fullname.addListener(() {
      fullnameNote.value = fullname.text;
    });
    phone.addListener(() {
      phoneNote.value = phone.text;
    });
  }

 

  @override
  void onClose() {
    noToRestaurant.dispose();
    noteToRider.dispose();
    super.onClose();
  }
}
