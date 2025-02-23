// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_isar.dart';

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
    )
  },
  estimateSize: _chatIsarEstimateSize,
  serialize: _chatIsarSerialize,
  deserialize: _chatIsarDeserialize,
  deserializeProp: _chatIsarDeserializeProp,
  idName: r'chatId',
  indexes: {},
  links: {
    r'messages': LinkSchema(
      id: 3518930051402545617,
      name: r'messages',
      target: r'MessageIsar',
      single: false,
    )
  },
  embeddedSchemas: {},
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
  return bytesCount;
}

void _chatIsarSerialize(
  ChatIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.chatTitle);
}

ChatIsar _chatIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChatIsar(
    chatTitle: reader.readString(offsets[0]),
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chatIsarGetId(ChatIsar object) {
  return object.chatId;
}

List<IsarLinkBase<dynamic>> _chatIsarGetLinks(ChatIsar object) {
  return [object.messages];
}

void _chatIsarAttach(IsarCollection<dynamic> col, Id id, ChatIsar object) {
  object.chatId = id;
  object.messages
      .attach(col, col.isar.collection<MessageIsar>(), r'messages', id);
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
}

extension ChatIsarQueryObject
    on QueryBuilder<ChatIsar, ChatIsar, QFilterCondition> {}

extension ChatIsarQueryLinks
    on QueryBuilder<ChatIsar, ChatIsar, QFilterCondition> {
  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> messages(
      FilterQuery<MessageIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'messages');
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> messagesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'messages', length, true, length, true);
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> messagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'messages', 0, true, 0, true);
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> messagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'messages', 0, false, 999999, true);
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition>
      messagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'messages', 0, true, length, include);
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition>
      messagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'messages', length, include, 999999, true);
    });
  }

  QueryBuilder<ChatIsar, ChatIsar, QAfterFilterCondition> messagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'messages', lower, includeLower, upper, includeUpper);
    });
  }
}

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
}
