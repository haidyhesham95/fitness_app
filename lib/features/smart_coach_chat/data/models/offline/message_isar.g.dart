// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChatIsarCollection on Isar {
  IsarCollection<ChatIsar> get chatIsars => this.collection();
}

const ChatIsarSchema = CollectionSchema(
  name: r'ChatIsar',
  id: -4667557897612178930,
  properties: {
    r'chatTitle': PropertySchema(
      id: 0,
      name: r'chatTitle',
      type: IsarType.string,
    ),
    r'messages': PropertySchema(
      id: 1,
      name: r'messages',
      type: IsarType.objectList,
      target: r'MessageIsar',
    )
  },
  estimateSize: _chatIsarEstimateSize,
  serialize: _chatIsarSerialize,
  deserialize: _chatIsarDeserialize,
  deserializeProp: _chatIsarDeserializeProp,
  idName: r'chatId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'MessageIsar': MessageIsarSchema},
  getId: _chatIsarGetId,
  getLinks: _chatIsarGetLinks,
  attach: _chatIsarAttach,
  version: '3.1.0+1',
);

int _chatIsarEstimateSize(
  ChatIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.chatTitle.length * 3;
  bytesCount += 3 + object.messages.length * 3;
  {
    final offsets = allOffsets[MessageIsar]!;
    for (var i = 0; i < object.messages.length; i++) {
      final value = object.messages[i];
      bytesCount += MessageIsarSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _chatIsarSerialize(
  ChatIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.chatTitle);
  writer.writeObjectList<MessageIsar>(
    offsets[1],
    allOffsets,
    MessageIsarSchema.serialize,
    object.messages,
  );
}

ChatIsar _chatIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChatIsar(
    chatTitle: reader.readString(offsets[0]),
    messages: reader.readObjectList<MessageIsar>(
          offsets[1],
          MessageIsarSchema.deserialize,
          allOffsets,
          MessageIsar(),
        ) ??
        [],
  );
  object.chatId = id;
  return object;
}

P _chatIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectList<MessageIsar>(
            offset,
            MessageIsarSchema.deserialize,
            allOffsets,
            MessageIsar(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chatIsarGetId(ChatIsar object) {
  return object.chatId;
}

List<IsarLinkBase<dynamic>> _chatIsarGetLinks(ChatIsar object) {
  return [];
}

void _chatIsarAttach(IsarCollection<dynamic> col, Id id, ChatIsar object) {
  object.chatId = id;
}

extension ChatIsarQueryWhereSort on QueryBuilder<ChatIsar, ChatIsar, QWhere> {
  QueryBuilder<ChatIsar, ChatIsar, QAfterWhere> anyChatId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChatIsarQueryWhere on QueryBuilder<ChatIsar, ChatIsar, QWhereClause> {
  QueryBuilder<ChatIsar, ChatIsar, QAfterWhereClause> chatIdEqualTo(Id chatId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: chatId,
        upper: chatId,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterWhereClause> chatIdNotEqualTo(
      Id chatId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: chatId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: chatId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: chatId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: chatId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterWhereClause> chatIdGreaterThan(
      Id chatId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: chatId, includeLower: include),
      );
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterWhereClause> chatIdLessThan(Id chatId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: chatId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterWhereClause> chatIdBetween(
    Id lowerChatId,
    Id upperChatId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerChatId,
        includeLower: includeLower,
        upper: upperChatId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChatIsarQueryFilter
    on QueryBuilder<ChatIsar, ChatIsar, QFilterCondition> {
  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chatId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chatId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chatId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chatTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chatTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chatTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chatTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chatTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chatTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chatTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> chatTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition>
      chatTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chatTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> messagesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> messagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> messagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition>
      messagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition>
      messagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> messagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ChatIsarQueryObject
    on QueryBuilder<ChatIsar, ChatIsar, QFilterCondition> {
  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> messagesElement(
      FilterQuery<MessageIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'messages');
    });
  }
}

extension ChatIsarQueryLinks
    on QueryBuilder<ChatIsar, ChatIsar, QFilterCondition> {}

extension ChatIsarQuerySortBy on QueryBuilder<ChatIsar, ChatIsar, QSortBy> {
  QueryBuilder<ChatIsar, ChatIsar, QAfterSortBy> sortByChatTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatTitle', Sort.asc);
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterSortBy> sortByChatTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatTitle', Sort.desc);
    });
  }
}

extension ChatIsarQuerySortThenBy
    on QueryBuilder<ChatIsar, ChatIsar, QSortThenBy> {
  QueryBuilder<ChatIsar, ChatIsar, QAfterSortBy> thenByChatId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatId', Sort.asc);
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterSortBy> thenByChatIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatId', Sort.desc);
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterSortBy> thenByChatTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatTitle', Sort.asc);
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterSortBy> thenByChatTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatTitle', Sort.desc);
    });
  }
}

extension ChatIsarQueryWhereDistinct
    on QueryBuilder<ChatIsar, ChatIsar, QDistinct> {
  QueryBuilder<ChatIsar, ChatIsar, QDistinct> distinctByChatTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chatTitle', caseSensitive: caseSensitive);
    });
  }
}

extension ChatIsarQueryProperty
    on QueryBuilder<ChatIsar, ChatIsar, QQueryProperty> {
  QueryBuilder<ChatIsar, int, QQueryOperations> chatIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatId');
    });
  }

  QueryBuilder<ChatIsar, String, QQueryOperations> chatTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatTitle');
    });
  }

  QueryBuilder<ChatIsar, List<MessageIsar>, QQueryOperations>
      messagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'messages');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MessageIsarSchema = Schema(
  name: r'MessageIsar',
  id: 3260995708908258659,
  properties: {
    r'imageFile': PropertySchema(
      id: 0,
      name: r'imageFile',
      type: IsarType.string,
    ),
    r'imageUrl': PropertySchema(
      id: 1,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'isUser': PropertySchema(
      id: 2,
      name: r'isUser',
      type: IsarType.bool,
    ),
    r'text': PropertySchema(
      id: 3,
      name: r'text',
      type: IsarType.string,
    )
  },
  estimateSize: _messageIsarEstimateSize,
  serialize: _messageIsarSerialize,
  deserialize: _messageIsarDeserialize,
  deserializeProp: _messageIsarDeserializeProp,
);

int _messageIsarEstimateSize(
  MessageIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imageFile.length * 3;
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _messageIsarSerialize(
  MessageIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imageFile);
  writer.writeString(offsets[1], object.imageUrl);
  writer.writeBool(offsets[2], object.isUser);
  writer.writeString(offsets[3], object.text);
}

MessageIsar _messageIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MessageIsar(
    imageFile: reader.readStringOrNull(offsets[0]) ?? '',
    imageUrl: reader.readStringOrNull(offsets[1]),
    isUser: reader.readBoolOrNull(offsets[2]),
    text: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _messageIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MessageIsarQueryFilter
    on QueryBuilder<MessageIsar, MessageIsar, QFilterCondition> {
  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageFileEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageFileGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageFileLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageFileBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageFile',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageFileStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageFileEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageFileContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageFileMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageFile',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageFileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageFile',
        value: '',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageFileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageFile',
        value: '',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> isUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isUser',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      isUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isUser',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> isUserEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUser',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> textGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> textLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> textBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> textContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> textMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }
}

extension MessageIsarQueryObject
    on QueryBuilder<MessageIsar, MessageIsar, QFilterCondition> {}
