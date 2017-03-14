// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library fasta.scanner.precedence;

import 'token_constants.dart';

class PrecedenceInfo {
  final String value;
  final int precedence;
  final int kind;
  final bool isOperator;

  const PrecedenceInfo(this.value, this.precedence, this.kind,
      {this.isOperator: false});

  toString() => 'PrecedenceInfo($value, $precedence, $kind)';

  static const List<PrecedenceInfo> all = const <PrecedenceInfo>[
    BACKPING_INFO,
    BACKSLASH_INFO,
    PERIOD_PERIOD_PERIOD_INFO,
    PERIOD_PERIOD_INFO,
    BANG_INFO,
    COLON_INFO,
    INDEX_INFO,
    MINUS_MINUS_INFO,
    PLUS_PLUS_INFO,
    TILDE_INFO,
    FUNCTION_INFO,
    HASH_INFO,
    INDEX_EQ_INFO,
    SEMICOLON_INFO,
    COMMA_INFO,
    AT_INFO,
    AMPERSAND_EQ_INFO,
    BAR_EQ_INFO,
    CARET_EQ_INFO,
    EQ_INFO,
    GT_GT_EQ_INFO,
    LT_LT_EQ_INFO,
    MINUS_EQ_INFO,
    PERCENT_EQ_INFO,
    PLUS_EQ_INFO,
    SLASH_EQ_INFO,
    STAR_EQ_INFO,
    TILDE_SLASH_EQ_INFO,
    QUESTION_QUESTION_EQ_INFO,
    QUESTION_INFO,
    QUESTION_QUESTION_INFO,
    BAR_BAR_INFO,
    AMPERSAND_AMPERSAND_INFO,
    BAR_INFO,
    CARET_INFO,
    AMPERSAND_INFO,
    BANG_EQ_EQ_INFO,
    BANG_EQ_INFO,
    EQ_EQ_EQ_INFO,
    EQ_EQ_INFO,
    GT_EQ_INFO,
    GT_INFO,
    IS_INFO,
    AS_INFO,
    LT_EQ_INFO,
    LT_INFO,
    GT_GT_INFO,
    LT_LT_INFO,
    MINUS_INFO,
    PLUS_INFO,
    PERCENT_INFO,
    SLASH_INFO,
    STAR_INFO,
    TILDE_SLASH_INFO,
    PERIOD_INFO,
    QUESTION_PERIOD_INFO,
    KEYWORD_INFO,
    EOF_INFO,
    IDENTIFIER_INFO,
    BAD_INPUT_INFO,
    OPEN_PAREN_INFO,
    CLOSE_PAREN_INFO,
    OPEN_CURLY_BRACKET_INFO,
    CLOSE_CURLY_BRACKET_INFO,
    INT_INFO,
    STRING_INFO,
    OPEN_SQUARE_BRACKET_INFO,
    CLOSE_SQUARE_BRACKET_INFO,
    DOUBLE_INFO,
    STRING_INTERPOLATION_INFO,
    STRING_INTERPOLATION_IDENTIFIER_INFO,
    HEXADECIMAL_INFO,
    COMMENT_INFO,
  ];
}

// TODO(ahe): The following are not tokens in Dart.
const PrecedenceInfo BACKPING_INFO =
    const PrecedenceInfo('`', 0, BACKPING_TOKEN);
const PrecedenceInfo BACKSLASH_INFO =
    const PrecedenceInfo('\\', 0, BACKSLASH_TOKEN);
const PrecedenceInfo PERIOD_PERIOD_PERIOD_INFO =
    const PrecedenceInfo('...', 0, PERIOD_PERIOD_PERIOD_TOKEN);

/**
 * The cascade operator has the lowest precedence of any operator
 * except assignment.
 */
const int CASCADE_PRECEDENCE = 2;
const PrecedenceInfo PERIOD_PERIOD_INFO = const PrecedenceInfo(
    '..', CASCADE_PRECEDENCE, PERIOD_PERIOD_TOKEN,
    isOperator: true);

const PrecedenceInfo BANG_INFO =
    const PrecedenceInfo('!', 0, BANG_TOKEN, isOperator: true);
const PrecedenceInfo COLON_INFO = const PrecedenceInfo(':', 0, COLON_TOKEN);
const PrecedenceInfo INDEX_INFO =
    const PrecedenceInfo('[]', 0, INDEX_TOKEN, isOperator: true);
const PrecedenceInfo MINUS_MINUS_INFO = const PrecedenceInfo(
    '--', POSTFIX_PRECEDENCE, MINUS_MINUS_TOKEN,
    isOperator: true);
const PrecedenceInfo PLUS_PLUS_INFO = const PrecedenceInfo(
    '++', POSTFIX_PRECEDENCE, PLUS_PLUS_TOKEN,
    isOperator: true);
const PrecedenceInfo TILDE_INFO =
    const PrecedenceInfo('~', 0, TILDE_TOKEN, isOperator: true);

const PrecedenceInfo FUNCTION_INFO =
    const PrecedenceInfo('=>', 0, FUNCTION_TOKEN);
const PrecedenceInfo HASH_INFO = const PrecedenceInfo('#', 0, HASH_TOKEN);
const PrecedenceInfo INDEX_EQ_INFO =
    const PrecedenceInfo('[]=', 0, INDEX_EQ_TOKEN, isOperator: true);
const PrecedenceInfo SEMICOLON_INFO =
    const PrecedenceInfo(';', 0, SEMICOLON_TOKEN);
const PrecedenceInfo COMMA_INFO = const PrecedenceInfo(',', 0, COMMA_TOKEN);

const PrecedenceInfo AT_INFO = const PrecedenceInfo('@', 0, AT_TOKEN);

// Assignment operators.
const int ASSIGNMENT_PRECEDENCE = 1;
const PrecedenceInfo AMPERSAND_EQ_INFO = const PrecedenceInfo(
    '&=', ASSIGNMENT_PRECEDENCE, AMPERSAND_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo BAR_EQ_INFO = const PrecedenceInfo(
    '|=', ASSIGNMENT_PRECEDENCE, BAR_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo CARET_EQ_INFO = const PrecedenceInfo(
    '^=', ASSIGNMENT_PRECEDENCE, CARET_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo EQ_INFO = const PrecedenceInfo(
    '=', ASSIGNMENT_PRECEDENCE, EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo GT_GT_EQ_INFO = const PrecedenceInfo(
    '>>=', ASSIGNMENT_PRECEDENCE, GT_GT_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo LT_LT_EQ_INFO = const PrecedenceInfo(
    '<<=', ASSIGNMENT_PRECEDENCE, LT_LT_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo MINUS_EQ_INFO = const PrecedenceInfo(
    '-=', ASSIGNMENT_PRECEDENCE, MINUS_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo PERCENT_EQ_INFO = const PrecedenceInfo(
    '%=', ASSIGNMENT_PRECEDENCE, PERCENT_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo PLUS_EQ_INFO = const PrecedenceInfo(
    '+=', ASSIGNMENT_PRECEDENCE, PLUS_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo SLASH_EQ_INFO = const PrecedenceInfo(
    '/=', ASSIGNMENT_PRECEDENCE, SLASH_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo STAR_EQ_INFO = const PrecedenceInfo(
    '*=', ASSIGNMENT_PRECEDENCE, STAR_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo TILDE_SLASH_EQ_INFO = const PrecedenceInfo(
    '~/=', ASSIGNMENT_PRECEDENCE, TILDE_SLASH_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo QUESTION_QUESTION_EQ_INFO = const PrecedenceInfo(
    '??=', ASSIGNMENT_PRECEDENCE, QUESTION_QUESTION_EQ_TOKEN,
    isOperator: true);

const PrecedenceInfo QUESTION_INFO =
    const PrecedenceInfo('?', 3, QUESTION_TOKEN, isOperator: true);

const PrecedenceInfo QUESTION_QUESTION_INFO =
    const PrecedenceInfo('??', 4, QUESTION_QUESTION_TOKEN, isOperator: true);

const PrecedenceInfo BAR_BAR_INFO =
    const PrecedenceInfo('||', 5, BAR_BAR_TOKEN, isOperator: true);

const PrecedenceInfo AMPERSAND_AMPERSAND_INFO =
    const PrecedenceInfo('&&', 6, AMPERSAND_AMPERSAND_TOKEN, isOperator: true);

const PrecedenceInfo BAR_INFO =
    const PrecedenceInfo('|', 9, BAR_TOKEN, isOperator: true);

const PrecedenceInfo CARET_INFO =
    const PrecedenceInfo('^', 10, CARET_TOKEN, isOperator: true);

const PrecedenceInfo AMPERSAND_INFO =
    const PrecedenceInfo('&', 11, AMPERSAND_TOKEN, isOperator: true);

// Equality operators.
const int EQUALITY_PRECEDENCE = 7;
const PrecedenceInfo BANG_EQ_EQ_INFO =
    const PrecedenceInfo('!==', EQUALITY_PRECEDENCE, BANG_EQ_EQ_TOKEN);
const PrecedenceInfo BANG_EQ_INFO = const PrecedenceInfo(
    '!=', EQUALITY_PRECEDENCE, BANG_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo EQ_EQ_EQ_INFO =
    const PrecedenceInfo('===', EQUALITY_PRECEDENCE, EQ_EQ_EQ_TOKEN);
const PrecedenceInfo EQ_EQ_INFO = const PrecedenceInfo(
    '==', EQUALITY_PRECEDENCE, EQ_EQ_TOKEN,
    isOperator: true);

// Relational operators.
const int RELATIONAL_PRECEDENCE = 8;
const PrecedenceInfo GT_EQ_INFO = const PrecedenceInfo(
    '>=', RELATIONAL_PRECEDENCE, GT_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo GT_INFO = const PrecedenceInfo(
    '>', RELATIONAL_PRECEDENCE, GT_TOKEN,
    isOperator: true);
const PrecedenceInfo IS_INFO =
    const PrecedenceInfo('is', RELATIONAL_PRECEDENCE, KEYWORD_TOKEN);
const PrecedenceInfo AS_INFO =
    const PrecedenceInfo('as', RELATIONAL_PRECEDENCE, KEYWORD_TOKEN);
const PrecedenceInfo LT_EQ_INFO = const PrecedenceInfo(
    '<=', RELATIONAL_PRECEDENCE, LT_EQ_TOKEN,
    isOperator: true);
const PrecedenceInfo LT_INFO = const PrecedenceInfo(
    '<', RELATIONAL_PRECEDENCE, LT_TOKEN,
    isOperator: true);

// Shift operators.
const PrecedenceInfo GT_GT_INFO =
    const PrecedenceInfo('>>', 12, GT_GT_TOKEN, isOperator: true);
const PrecedenceInfo LT_LT_INFO =
    const PrecedenceInfo('<<', 12, LT_LT_TOKEN, isOperator: true);

// Additive operators.
const PrecedenceInfo MINUS_INFO =
    const PrecedenceInfo('-', 13, MINUS_TOKEN, isOperator: true);
const PrecedenceInfo PLUS_INFO =
    const PrecedenceInfo('+', 13, PLUS_TOKEN, isOperator: true);

// Multiplicative operators.
const PrecedenceInfo PERCENT_INFO =
    const PrecedenceInfo('%', 14, PERCENT_TOKEN, isOperator: true);
const PrecedenceInfo SLASH_INFO =
    const PrecedenceInfo('/', 14, SLASH_TOKEN, isOperator: true);
const PrecedenceInfo STAR_INFO =
    const PrecedenceInfo('*', 14, STAR_TOKEN, isOperator: true);
const PrecedenceInfo TILDE_SLASH_INFO =
    const PrecedenceInfo('~/', 14, TILDE_SLASH_TOKEN, isOperator: true);

const int POSTFIX_PRECEDENCE = 15;
const PrecedenceInfo PERIOD_INFO =
    const PrecedenceInfo('.', POSTFIX_PRECEDENCE, PERIOD_TOKEN);
const PrecedenceInfo QUESTION_PERIOD_INFO = const PrecedenceInfo(
    '?.', POSTFIX_PRECEDENCE, QUESTION_PERIOD_TOKEN,
    isOperator: true);

const PrecedenceInfo KEYWORD_INFO =
    const PrecedenceInfo('keyword', 0, KEYWORD_TOKEN);

const PrecedenceInfo EOF_INFO = const PrecedenceInfo('EOF', 0, EOF_TOKEN);

/// Precedence info used by synthetic tokens that are created during parser
/// recovery (non-analyzer use case).
const PrecedenceInfo RECOVERY_INFO =
    const PrecedenceInfo('recovery', 0, RECOVERY_TOKEN);

const PrecedenceInfo IDENTIFIER_INFO =
    const PrecedenceInfo('identifier', 0, IDENTIFIER_TOKEN);

const PrecedenceInfo SCRIPT_INFO =
    const PrecedenceInfo('script', 0, SCRIPT_TOKEN);

const PrecedenceInfo BAD_INPUT_INFO =
    const PrecedenceInfo('malformed input', 0, BAD_INPUT_TOKEN);

const PrecedenceInfo OPEN_PAREN_INFO =
    const PrecedenceInfo('(', POSTFIX_PRECEDENCE, OPEN_PAREN_TOKEN);

const PrecedenceInfo CLOSE_PAREN_INFO =
    const PrecedenceInfo(')', 0, CLOSE_PAREN_TOKEN);

const PrecedenceInfo OPEN_CURLY_BRACKET_INFO =
    const PrecedenceInfo('{', 0, OPEN_CURLY_BRACKET_TOKEN);

const PrecedenceInfo CLOSE_CURLY_BRACKET_INFO =
    const PrecedenceInfo('}', 0, CLOSE_CURLY_BRACKET_TOKEN);

const PrecedenceInfo INT_INFO = const PrecedenceInfo('int', 0, INT_TOKEN);

const PrecedenceInfo STRING_INFO =
    const PrecedenceInfo('string', 0, STRING_TOKEN);

const PrecedenceInfo OPEN_SQUARE_BRACKET_INFO =
    const PrecedenceInfo('[', POSTFIX_PRECEDENCE, OPEN_SQUARE_BRACKET_TOKEN);

const PrecedenceInfo CLOSE_SQUARE_BRACKET_INFO =
    const PrecedenceInfo(']', 0, CLOSE_SQUARE_BRACKET_TOKEN);

const PrecedenceInfo DOUBLE_INFO =
    const PrecedenceInfo('double', 0, DOUBLE_TOKEN);

const PrecedenceInfo STRING_INTERPOLATION_INFO =
    const PrecedenceInfo('\${', 0, STRING_INTERPOLATION_TOKEN);

const PrecedenceInfo STRING_INTERPOLATION_IDENTIFIER_INFO =
    const PrecedenceInfo('\$', 0, STRING_INTERPOLATION_IDENTIFIER_TOKEN);

const PrecedenceInfo HEXADECIMAL_INFO =
    const PrecedenceInfo('hexadecimal', 0, HEXADECIMAL_TOKEN);

const PrecedenceInfo COMMENT_INFO =
    const PrecedenceInfo('comment', 0, COMMENT_TOKEN);
