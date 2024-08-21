import 'package:get_storage/get_storage.dart';

class NxLocalStorage {

 late final GetStorage _storage;

 // Singleton instance
  static NxLocalStorage? _instance;

  NxLocalStorage._internal();


  // static final NxLocalStorage _instance = NxLocalStorage._internal();


  factory NxLocalStorage.instance(){
    _instance ??= NxLocalStorage._internal();
    return _instance!;
  }

  static Future<void> onInit(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = NxLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }



  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async{
    await _storage.write(key, value);
  }

  // Generic method to save data
  T? readData<T>(String key) {
     return _storage.read<T>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }


}

/// *** *** *** *** *** *** *** *** *** *** *** ///

// LocalStorage localStorage = LocalStorage();
//
// // Save data
// localStorage.saveData('username', 'JohnDoe');
//
// // Read data
// String? username = localStorage.readData<String>('username');
// print('Username: $username'); // Output : Username: JohnDoe
//
// // Remove data
// localStorage.removeData('username');
//
// // Clear all data
// localStorage.clearAll();