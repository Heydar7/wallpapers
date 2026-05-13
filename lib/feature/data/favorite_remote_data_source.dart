import 'package:shared_preferences/shared_preferences.dart';

const String _key = 'favorites';

Future<List<String>> getItems() async {
  final prefs = await SharedPreferences.getInstance();
  final data = prefs.getString(_key);

  if (data == null || data.isEmpty) return [];

  return data.split(',').where((e) => e.isNotEmpty).toList();
}

Future<void> addItem(String item) async {
  final items = await getItems();
  items.add(item);

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_key, items.join(','));
}

Future<void> removeItem(String item) async {
  final items = await getItems();
  items.remove(item);

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_key, items.join(','));
}
