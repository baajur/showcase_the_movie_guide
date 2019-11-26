import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:showcase_the_movie_guide/domain/models/status.dart';
import 'package:showcase_the_movie_guide/domain/serializers.dart';

// class BuiltValueConverter extends JsonConverter {
//   @override
//   Request convertRequest(Request request) {
//     if (request.body is Built) {
//       return super.convertRequest(
//         request.replace(
//           body: serializers.serializeWith(
//             serializers.serializerForType(request.body.runtimeType),
//             request.body,
//           ),
//         ),
//       );
//     }

//     return super.convertRequest(request);
//   }

//   @override
//   Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
//     final Response dynamicResponse = super.convertResponse(response);
//     final BodyType customBody =
//         _converterToCustomObject<InnerType>(dynamicResponse.body);

//     return dynamicResponse.replace<BodyType>(body: customBody);
//   }

//   @override
//   Response convertError<BodyType, InnerType>(Response response) {
//     final Response dynamicResponse = super.convertResponse(response);
//     final Status customBody =
//         _converterToCustomObject<Status>(dynamicResponse.body);

//     return dynamicResponse.replace<Status>(body: customBody);
//   }

//   dynamic _converterToCustomObject<InnerType>(dynamic element) {
//     if (element is InnerType) return element;

//     if (element is List)
//       return _deserializeListOf<InnerType>(element);
//     else
//       return _deserialize<InnerType>(element);
//   }

//   BuiltList<InnerType> _deserializeListOf<InnerType>(List dynamicList) {
//     return BuiltList<InnerType>(
//         dynamicList.map((element) => _deserialize<InnerType>(element)));
//   }

//   InnerType _deserialize<InnerType>(Map<String, dynamic> value) {
//     return serializers.deserializeWith(
//         serializers.serializerForType(InnerType), value);
//   }
// }
