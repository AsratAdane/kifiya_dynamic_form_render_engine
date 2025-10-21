// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FieldSchema {

 String get id; FieldType get type; String get label; bool get required; List<String>? get options; String? get dependsOn; dynamic get visibleWhenEquals; String? get dateFormat;// For date picker display
 dynamic get defaultValue;
/// Create a copy of FieldSchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldSchemaCopyWith<FieldSchema> get copyWith => _$FieldSchemaCopyWithImpl<FieldSchema>(this as FieldSchema, _$identity);

  /// Serializes this FieldSchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldSchema&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.required, required) || other.required == required)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.dependsOn, dependsOn) || other.dependsOn == dependsOn)&&const DeepCollectionEquality().equals(other.visibleWhenEquals, visibleWhenEquals)&&(identical(other.dateFormat, dateFormat) || other.dateFormat == dateFormat)&&const DeepCollectionEquality().equals(other.defaultValue, defaultValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,label,required,const DeepCollectionEquality().hash(options),dependsOn,const DeepCollectionEquality().hash(visibleWhenEquals),dateFormat,const DeepCollectionEquality().hash(defaultValue));

@override
String toString() {
  return 'FieldSchema(id: $id, type: $type, label: $label, required: $required, options: $options, dependsOn: $dependsOn, visibleWhenEquals: $visibleWhenEquals, dateFormat: $dateFormat, defaultValue: $defaultValue)';
}


}

/// @nodoc
abstract mixin class $FieldSchemaCopyWith<$Res>  {
  factory $FieldSchemaCopyWith(FieldSchema value, $Res Function(FieldSchema) _then) = _$FieldSchemaCopyWithImpl;
@useResult
$Res call({
 String id, FieldType type, String label, bool required, List<String>? options, String? dependsOn, dynamic visibleWhenEquals, String? dateFormat, dynamic defaultValue
});




}
/// @nodoc
class _$FieldSchemaCopyWithImpl<$Res>
    implements $FieldSchemaCopyWith<$Res> {
  _$FieldSchemaCopyWithImpl(this._self, this._then);

  final FieldSchema _self;
  final $Res Function(FieldSchema) _then;

/// Create a copy of FieldSchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? label = null,Object? required = null,Object? options = freezed,Object? dependsOn = freezed,Object? visibleWhenEquals = freezed,Object? dateFormat = freezed,Object? defaultValue = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FieldType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,required: null == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,dependsOn: freezed == dependsOn ? _self.dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as String?,visibleWhenEquals: freezed == visibleWhenEquals ? _self.visibleWhenEquals : visibleWhenEquals // ignore: cast_nullable_to_non_nullable
as dynamic,dateFormat: freezed == dateFormat ? _self.dateFormat : dateFormat // ignore: cast_nullable_to_non_nullable
as String?,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [FieldSchema].
extension FieldSchemaPatterns on FieldSchema {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FieldSchema value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FieldSchema() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FieldSchema value)  $default,){
final _that = this;
switch (_that) {
case _FieldSchema():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FieldSchema value)?  $default,){
final _that = this;
switch (_that) {
case _FieldSchema() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  FieldType type,  String label,  bool required,  List<String>? options,  String? dependsOn,  dynamic visibleWhenEquals,  String? dateFormat,  dynamic defaultValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FieldSchema() when $default != null:
return $default(_that.id,_that.type,_that.label,_that.required,_that.options,_that.dependsOn,_that.visibleWhenEquals,_that.dateFormat,_that.defaultValue);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  FieldType type,  String label,  bool required,  List<String>? options,  String? dependsOn,  dynamic visibleWhenEquals,  String? dateFormat,  dynamic defaultValue)  $default,) {final _that = this;
switch (_that) {
case _FieldSchema():
return $default(_that.id,_that.type,_that.label,_that.required,_that.options,_that.dependsOn,_that.visibleWhenEquals,_that.dateFormat,_that.defaultValue);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  FieldType type,  String label,  bool required,  List<String>? options,  String? dependsOn,  dynamic visibleWhenEquals,  String? dateFormat,  dynamic defaultValue)?  $default,) {final _that = this;
switch (_that) {
case _FieldSchema() when $default != null:
return $default(_that.id,_that.type,_that.label,_that.required,_that.options,_that.dependsOn,_that.visibleWhenEquals,_that.dateFormat,_that.defaultValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FieldSchema implements FieldSchema {
  const _FieldSchema({required this.id, required this.type, required this.label, this.required = false, final  List<String>? options, this.dependsOn, this.visibleWhenEquals, this.dateFormat, this.defaultValue}): _options = options;
  factory _FieldSchema.fromJson(Map<String, dynamic> json) => _$FieldSchemaFromJson(json);

@override final  String id;
@override final  FieldType type;
@override final  String label;
@override@JsonKey() final  bool required;
 final  List<String>? _options;
@override List<String>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? dependsOn;
@override final  dynamic visibleWhenEquals;
@override final  String? dateFormat;
// For date picker display
@override final  dynamic defaultValue;

/// Create a copy of FieldSchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FieldSchemaCopyWith<_FieldSchema> get copyWith => __$FieldSchemaCopyWithImpl<_FieldSchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FieldSchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FieldSchema&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.required, required) || other.required == required)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.dependsOn, dependsOn) || other.dependsOn == dependsOn)&&const DeepCollectionEquality().equals(other.visibleWhenEquals, visibleWhenEquals)&&(identical(other.dateFormat, dateFormat) || other.dateFormat == dateFormat)&&const DeepCollectionEquality().equals(other.defaultValue, defaultValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,label,required,const DeepCollectionEquality().hash(_options),dependsOn,const DeepCollectionEquality().hash(visibleWhenEquals),dateFormat,const DeepCollectionEquality().hash(defaultValue));

@override
String toString() {
  return 'FieldSchema(id: $id, type: $type, label: $label, required: $required, options: $options, dependsOn: $dependsOn, visibleWhenEquals: $visibleWhenEquals, dateFormat: $dateFormat, defaultValue: $defaultValue)';
}


}

/// @nodoc
abstract mixin class _$FieldSchemaCopyWith<$Res> implements $FieldSchemaCopyWith<$Res> {
  factory _$FieldSchemaCopyWith(_FieldSchema value, $Res Function(_FieldSchema) _then) = __$FieldSchemaCopyWithImpl;
@override @useResult
$Res call({
 String id, FieldType type, String label, bool required, List<String>? options, String? dependsOn, dynamic visibleWhenEquals, String? dateFormat, dynamic defaultValue
});




}
/// @nodoc
class __$FieldSchemaCopyWithImpl<$Res>
    implements _$FieldSchemaCopyWith<$Res> {
  __$FieldSchemaCopyWithImpl(this._self, this._then);

  final _FieldSchema _self;
  final $Res Function(_FieldSchema) _then;

/// Create a copy of FieldSchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? label = null,Object? required = null,Object? options = freezed,Object? dependsOn = freezed,Object? visibleWhenEquals = freezed,Object? dateFormat = freezed,Object? defaultValue = freezed,}) {
  return _then(_FieldSchema(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FieldType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,required: null == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,dependsOn: freezed == dependsOn ? _self.dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as String?,visibleWhenEquals: freezed == visibleWhenEquals ? _self.visibleWhenEquals : visibleWhenEquals // ignore: cast_nullable_to_non_nullable
as dynamic,dateFormat: freezed == dateFormat ? _self.dateFormat : dateFormat // ignore: cast_nullable_to_non_nullable
as String?,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
