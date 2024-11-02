String pageName<T>() {
  final name = T.toString();

  final exp = RegExp('(?<=[a-z])[A-Z]');
  String result = name.replaceAllMapped(
    exp,
      (m) => '_${m.group(0)}',
  ).toLowerCase();

  print(result);


  return '/${ T.toString() }';
}