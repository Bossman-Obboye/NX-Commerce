import 'package:get_storage/get_storage.dart';

class NxLocalStorage {

  NxLocalStorage._internal();

  static final NxLocalStorage _instance = NxLocalStorage._internal();

  factory NxLocalStorage (){
    return _instance;
  }

  final _storage = GetStorage();


  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async{
    await _storage.write(key, value);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }


}