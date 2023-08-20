// import 'dart:async';
// import 'dart:io';
// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:dio/adapter.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:api_app/common/store/store.dart';
// import 'package:api_app/common/utils/utils.dart';
// import 'package:api_app/common/values/values.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart' hide FormData;

// class HttpUtil {
//   static HttpUtil _instance = HttpUtil._internal();
//   factory HttpUtil() => _instance;

//   late Dio dio;
//   CancelToken cancelToken = new CancelToken();

//   HttpUtil._internal() {
//     // BaseOptions、Options、RequestOptions | All can configure parameters, priority levels increase sequentially, and parameters can be overridden based on priority levels. 
//     BaseOptions options = new BaseOptions(
//       // Base address of the request, can include sub-paths
//       baseUrl: SERVER_API_URL,

//       // Connection timeout to the server, in milliseconds.
//       connectTimeout: 30000,

//       // he interval between receiving data from the response stream on consecutive occasions, measured in milliseconds.
//       receiveTimeout: 20000,

//       // Http request headers
//       headers: {},

//       /// Permintaan Content-Type, nilai default adalah "application/json; charset=utf-8".
//       /// Jika Anda ingin mengkodekan data permintaan dalam format "application/x-www-form-urlencoded",
//       /// Anda dapat mengatur opsi ini menjadi `Headers.formUrlEncodedContentType`, sehingga [Dio]
//       /// akan secara otomatis mengodekan tubuh permintaan.
//       contentType: 'application/json; charset=utf-8',

//       /// [responseType] mengindikasikan format (mode) bagaimana Anda mengharapkan untuk menerima data respons.
//       /// Saat ini, [ResponseType] mendukung tiga jenis format: `JSON`, `STREAM`, `PLAIN`.
//       ///
//       /// Nilai default adalah `JSON`, yang berarti ketika respons dari server memiliki header "application/json",
//       /// dio akan otomatis mengonversi konten respons menjadi objek JSON.
//       /// Jika Anda ingin menerima data respons dalam bentuk biner (binary) seperti ketika mendownload file biner,
//       /// Anda bisa menggunakan `STREAM`.
//       ///
//       /// Jika Anda ingin menerima data respons dalam bentuk teks (string),
//       /// gunakan opsi `PLAIN`.
//       responseType: ResponseType.json,
//     );

//     dio = new Dio(options);

//     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//         (HttpClient client) {
//       client.badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//       return client;
//     };

//     // Manajemen Cookie
//     CookieJar cookieJar = CookieJar();
//     dio.interceptors.add(CookieManager(cookieJar));

//     // Menambahkan interceptor
//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler){
//         // Melakukan sesuatu sebelum permintaan dikirim
//         return handler.next(options);
//         // Jika Anda ingin menyelesaikan permintaan dan mengembalikan respons khusus, Anda dapat menggunakan handler.resolve(response) dalam fungsi onRequest pada interceptor.
//         // Ini akan menghentikan permintaan, dan fungsi then yang ada di permintaan asli akan dieksekusi dengan nilai yang sama dengan respons khusus yang Anda berikan. 
//         // Sebaliknya, jika Anda ingin menghentikan permintaan dan menimbulkan kesalahan, Anda dapat menggunakan handler.reject(error).
//         // Ini akan menghentikan permintaan dan memicu error (kesalahan). Fungsi catchError yang ada di permintaan asli akan dieksekusi, sehingga Anda dapat menangani kesalahan tersebut sesuai dengan kebutuhan aplikasi Anda.
//       },
//       onResponse: (response, handler) {
//         // Melakukan sesuatu dengan data respons
//         return handler.next(response);
//         // Jika Anda ingin menghentikan permintaan dan menyebabkan kesalahan (error), Anda dapat menolak (reject) objek DioError dengan menggunakan handler.reject(error).
//         // Dengan melakukan ini, permintaan akan dihentikan dan akan memicu sebuah exception, yang akan ditangkap oleh blok catchError pada level di atasnya.
//       },
//       onError: (DioError e, handler) {
//         // Melakukan sesuatu dengan kesalahan (error) pada respons
//         Loading.dismiss();
//         ErrorEntity eInfo = createErrorEntity(e);
//         onError(eInfo);
//         return handler.next(e); //continue
//         // Jika Anda ingin menyelesaikan permintaan dan mengembalikan beberapa data khusus, Anda dapat menyelesaikan `Response`, seperti `handler. menyelesaikan(tanggapan)`.
//         // Dengan cara ini, permintaan akan dihentikan, lapisan atas kemudian akan dipanggil, dan data yang dikembalikan kemudian akan menjadi respons khusus Anda.
//       },
//     ));
//   }

//    /*
//    * error Pemrosesan terpadu
//    */

// // penanganan kesalahan
//   void onError(ErrorEntity eInfo) {
//     print('error.code -> ' +
//         eInfo.code.toString() +
//         ', error.message -> ' +
//         eInfo.message);
//     switch (eInfo.code) {
//       case 401:
//         UserStore.to.onLogout();
//         EasyLoading.showError(eInfo.message);
//         break;
//       default:
//        EasyLoading.showError('Unknown Error');
//         break;
//     }
//   }

//    // Pesan Error
//     ErrorEntity createErrorEntity(DioError error) {
//       switch (error.type) {
//         case DioErrorType.cancel:
//           return ErrorEntity(code: -1, message: "Request to cancel");
//         case DioErrorType.connectTimeout:
//           return ErrorEntity(code: -1, message: "Connection timed out");
//         case DioErrorType.sendTimeout:
//           return ErrorEntity(code: -1, message: "Request timed out");
//         case DioErrorType.receiveTimeout:
//           return ErrorEntity(code: -1, message: "response timeout");
//         case DioErrorType.cancel:
//           return ErrorEntity(code: -1, message: "request to cancel");
//         case DioErrorType.response:
//         {
//           try {
//             int errCode =
//             error.response != null ? error.response!.statusCode! : -1;
//             // String errMsg = error.response.statusMessage;
//             // return ErrorEntity(code: errCode, message: errMsg);
//             switch (errCode) {
//               case 400:
//                 return ErrorEntity(code: errCode, message: "request syntax error");
//               case 401:
//                 return ErrorEntity(code: errCode, message: "permission denied");
//               case 403:
//                 return ErrorEntity(code: errCode, message: "The server refuses to execute");
//               case 404:
//                 return ErrorEntity(code: errCode, message: "can not connect to the server");
//               case 405:
//                 return ErrorEntity(code: errCode, message: "request method is forbidden");
//               case 500:
//                 return ErrorEntity(code: errCode, message: "internal server error");
//               case 502:
//                 return ErrorEntity(code: errCode, message: "invalid request");
//               case 503:
//                 return ErrorEntity(code: errCode, message: "server down");
//               case 505:
//                 return ErrorEntity(code: errCode, message: "Does not support HTTP protocol requests");
//               default:
//                 {
//                   // return ErrorEntity(code: errCode, message: "未知错误");
//                   return ErrorEntity(
//                     code: errCode,
//                     message: error.response != null
//                         ? error.response!.statusMessage!
//                         : "",
//                   );
//                 }
//             }
//           } on Exception catch (_) {
//             return ErrorEntity(code: -1, message: "unknown mistake");
//           }
//         }
//         default:
//           {
//             return ErrorEntity(code: -1, message: "error");
//           }
//       }
//     }

//     /*
//    * 取消请求
//    *
//    * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
//    * 所以参数可选
//    */
//   void cancelRequests(CancelToken token) {
//     token.cancel("cancelled");
//   }

//   /// 读取本地配置
//   Map<String, dynamic>? getAuthorizationHeader() {
//     var headers = <String, dynamic>{};
//     if (Get.isRegistered<UserStore>() && UserStore.to.hasToken == true) {
//       headers['Authorization'] = 'Bearer ${UserStore.to.token}';
//     }
//     return headers;
//   }

//   /// restful get 操作
//   /// refresh 是否下拉刷新 默认 false
//   /// noCache 是否不缓存 默认 true
//   /// list 是否列表 默认 false
//   /// cacheKey 缓存key
//   /// cacheDisk 是否磁盘缓存
//   Future get(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     bool refresh = false,
//     bool noCache = !CACHE_ENABLE,
//     bool list = false,
//     String cacheKey = '',
//     bool cacheDisk = false,
//   }) async {
//     Options requestOptions = options ?? Options();
//     if (requestOptions.extra == null) {
//       requestOptions.extra = Map();
//     }
//     requestOptions.extra!.addAll({
//       "refresh": refresh,
//       "noCache": noCache,
//       "list": list,
//       "cacheKey": cacheKey,
//       "cacheDisk": cacheDisk,
//     });
//     requestOptions.headers = requestOptions.headers ?? {};
//     Map<String, dynamic>? authorization = getAuthorizationHeader();
//     if (authorization != null) {
//       requestOptions.headers!.addAll(authorization);
//     }

//     var response = await dio.get(
//       path,
//       queryParameters: queryParameters,
//       options: options,
//       cancelToken: cancelToken,
//     );
//     return response.data;
//   }

//   /// restful post 操作
//   Future post(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//   }) async {

//     Options requestOptions = options ?? Options();
//     requestOptions.headers = requestOptions.headers ?? {};
//     Map<String, dynamic>? authorization = getAuthorizationHeader();
//     if (authorization != null) {
//       requestOptions.headers!.addAll(authorization);
//     }
//     var response = await dio.post(
//       path,
//       data: data,
//       queryParameters: queryParameters,
//       options: requestOptions,
//       cancelToken: cancelToken,
//     );

//     return response.data;
//   }

//   /// restful put 操作
//   Future put(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//   }) async {
//     Options requestOptions = options ?? Options();
//     requestOptions.headers = requestOptions.headers ?? {};
//     Map<String, dynamic>? authorization = getAuthorizationHeader();
//     if (authorization != null) {
//       requestOptions.headers!.addAll(authorization);
//     }
//     var response = await dio.put(
//       path,
//       data: data,
//       queryParameters: queryParameters,
//       options: requestOptions,
//       cancelToken: cancelToken,
//     );
//     return response.data;
//   }

//   /// restful patch 操作
//   Future patch(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//   }) async {
//     Options requestOptions = options ?? Options();
//     requestOptions.headers = requestOptions.headers ?? {};
//     Map<String, dynamic>? authorization = getAuthorizationHeader();
//     if (authorization != null) {
//       requestOptions.headers!.addAll(authorization);
//     }
//     var response = await dio.patch(
//       path,
//       data: data,
//       queryParameters: queryParameters,
//       options: requestOptions,
//       cancelToken: cancelToken,
//     );
//     return response.data;
//   }

//   /// restful delete 操作
//   Future delete(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//   }) async {
//     Options requestOptions = options ?? Options();
//     requestOptions.headers = requestOptions.headers ?? {};
//     Map<String, dynamic>? authorization = getAuthorizationHeader();
//     if (authorization != null) {
//       requestOptions.headers!.addAll(authorization);
//     }
//     var response = await dio.delete(
//       path,
//       data: data,
//       queryParameters: queryParameters,
//       options: requestOptions,
//       cancelToken: cancelToken,
//     );
//     return response.data;
//   }

//   /// restful post form 表单提交操作
//   Future postForm(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//   }) async {
//     Options requestOptions = options ?? Options();
//     requestOptions.headers = requestOptions.headers ?? {};
//     Map<String, dynamic>? authorization = getAuthorizationHeader();
//     if (authorization != null) {
//       requestOptions.headers!.addAll(authorization);
//     }
//     var response = await dio.post(
//       path,
//       data: FormData.fromMap(data),
//       queryParameters: queryParameters,
//       options: requestOptions,
//       cancelToken: cancelToken,
//     );
//     return response.data;
//   }

//   /// restful post Stream 流数据
//   Future postStream(
//     String path, {
//     dynamic data,
//     int dataLength = 0,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//   }) async {
//     Options requestOptions = options ?? Options();
//     requestOptions.headers = requestOptions.headers ?? {};
//     Map<String, dynamic>? authorization = getAuthorizationHeader();
//     if (authorization != null) {
//       requestOptions.headers!.addAll(authorization);
//     }
//     requestOptions.headers!.addAll({
//       Headers.contentLengthHeader: dataLength.toString(),
//     });
//     var response = await dio.post(
//       path,
//       data: Stream.fromIterable(data.map((e) => [e])),
//       queryParameters: queryParameters,
//       options: requestOptions,
//       cancelToken: cancelToken,
//     );
//     return response.data;
//   }
// }

// // Penanganan kesalahan (error) 
// class ErrorEntity implements Exception {
//   int code = -1;
//   String message = "";
//   ErrorEntity({required this.code, required this.message});

//   String toString() {
//     if (message == "") return "Exception";
//     return "Exception: code $code, $message";
//   }
// }



import 'dart:async';
import 'dart:io';
import 'package:api_app/common/utils/utils.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide FormData;

import '../store/store.dart';
import '../values/values.dart';


class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio dio;
  CancelToken cancelToken = new CancelToken();


  HttpUtil._internal() {
    // BaseOptions、Options、RequestOptions | All can configure parameters, priority levels increase sequentially, and parameters can be overridden based on priority levels. 
    BaseOptions options = new BaseOptions(
      // 请求基地址,可以包含子路径
      baseUrl: SERVER_API_URL,

      // baseUrl: storage.read(key: STORAGE_KEY_APIURL) ?? SERVICE_API_BASEURL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 30000,

      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 20000,

      // Http请求头.
      headers: {},

      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      contentType: 'application/json; charset=utf-8',

      /// [responseType] 表示期望以那种格式(方式)接受响应数据。
      /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
      ///
      /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
      ///
      /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
      responseType: ResponseType.json,
    );

    dio = new Dio(options);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    // Cookie管理
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options); //continue
        // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response); // continue
        // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onError: (DioError e, handler) {
        // Do something with response error
        Loading.dismiss();
        ErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);
        return handler.next(e); //continue
        // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      },
    ));
  }

  /*
   * error Pemrosesan terpadu
   */

  // 错误处理
  void onError(ErrorEntity eInfo) {
    print('error.code -> ' +
        eInfo.code.toString() +
        ', error.message -> ' +
        eInfo.message);
    switch (eInfo.code) {
      case 401:
        UserStore.to.onLogout();
        EasyLoading.showError(eInfo.message);
        break;
      default:
       // EasyLoading.showError('未知错误');
        break;
    }
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return ErrorEntity(code: -1, message: "request to cancel");
      case DioErrorType.connectTimeout:
        return ErrorEntity(code: -1, message: "Connection timed out");
      case DioErrorType.sendTimeout:
        return ErrorEntity(code: -1, message: "Request timed out");
      case DioErrorType.receiveTimeout:
        return ErrorEntity(code: -1, message: "response timeout");
      case DioErrorType.cancel:
        return ErrorEntity(code: -1, message: "request to cancel");
      case DioErrorType.response:
        {
          try {
            int errCode =
            error.response != null ? error.response!.statusCode! : -1;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
                return ErrorEntity(code: errCode, message: "request syntax error");
              case 401:
                return ErrorEntity(code: errCode, message: "permission denied");
              case 403:
                return ErrorEntity(code: errCode, message: "The server refuses to execute");
              case 404:
                return ErrorEntity(code: errCode, message: "can not connect to the server");
              case 405:
                return ErrorEntity(code: errCode, message: "request method is forbidden");
              case 500:
                return ErrorEntity(code: errCode, message: "internal server error");
              case 502:
                return ErrorEntity(code: errCode, message: "invalid request");
              case 503:
                return ErrorEntity(code: errCode, message: "server down");
              case 505:
                return ErrorEntity(code: errCode, message: "Does not support HTTP protocol requests");
              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  return ErrorEntity(
                    code: errCode,
                    message: error.response != null
                        ? error.response!.statusMessage!
                        : "",
                  );
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "unknown mistake");
          }
        }
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  /// 读取本地配置
  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    if (Get.isRegistered<UserStore>() && UserStore.to.hasToken == true) {
      headers['Authorization'] = 'Bearer ${UserStore.to.token}';
    }
    return headers;
  }

  /// restful get 操作
  /// refresh 是否下拉刷新 默认 false
  /// noCache 是否不缓存 默认 true
  /// list 是否列表 默认 false
  /// cacheKey 缓存key
  /// cacheDisk 是否磁盘缓存
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool noCache = !CACHE_ENABLE,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    if (requestOptions.extra == null) {
      requestOptions.extra = Map();
    }
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "noCache": noCache,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post 操作
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {

    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  /// restful put 操作
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful patch 操作
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful delete 操作
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: FormData.fromMap(data),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post Stream 流数据
  Future postStream(
    String path, {
    dynamic data,
    int dataLength = 0,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });
    var response = await dio.post(
      path,
      data: Stream.fromIterable(data.map((e) => [e])),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int code = -1;
  String message = "";
  ErrorEntity({required this.code, required this.message});

  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}
