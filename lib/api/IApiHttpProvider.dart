/// Interface providing online access
abstract class IApiHttpProvider {
  /// get method
  /// if [withFakeHeaders] is true, it will inject headers into the request
  Future<dynamic> get(String url, {withFakeHeaders: false});
  Future<dynamic> post(String url, dynamic body, {Map<String, String> headers});
  Future<dynamic> put(String url, dynamic body);
  Future<dynamic> delete(String url);
}