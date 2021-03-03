/// Used for providing global access to some of the functions, for example
/// changing the App theme.
class GlobalFunctionRegistry{
  static final Map<String, Function> _registry = {};

  static void registerFunction(String name, Function function) {
    _registry[name] = function;
  }

  static Function getFunctionByName(String name) {
    if(_registry.containsKey(name)) return _registry[name];
    return (){};
  }
}