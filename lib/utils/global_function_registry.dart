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