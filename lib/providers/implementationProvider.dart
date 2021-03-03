import 'package:flutter_book_app/api/IApiHttpProvider.dart';
import 'package:flutter_book_app/api/IBookApi.dart';
import 'package:flutter_book_app/api/api_http_implementation.dart';
import 'package:flutter_book_app/bloc/repositories/good_reads.dart';
import 'package:flutter_book_app/bloc/repositories/itBook.dart';
import 'package:flutter_book_app/bloc/repositories/open_library.dart';

/// The provider for the important dependencies.
/// Instead of using Implementations directly, this will orchestrate
/// between different Implementations. Works like dependency injection, but
/// instead of injecting a dependency, it gives one when asked.
class ImplementationProvider {
  static IApiHttpProvider getHttpProvider() {
    return ApiHttpImplementation();
  }

  static IBookApi getBookApi() {
    return GoodReads();
    // return ItBook();
    // return OpenLibrary();
  }
}