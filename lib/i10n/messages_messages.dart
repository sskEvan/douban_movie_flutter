// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "all" : MessageLookupByLibrary.simpleMessage("all"),
    "billboard" : MessageLookupByLibrary.simpleMessage("billboard"),
    "buy" : MessageLookupByLibrary.simpleMessage("buy"),
    "cancel" : MessageLookupByLibrary.simpleMessage("cancel"),
    "empty_data_tip" : MessageLookupByLibrary.simpleMessage("empty data,please refresh"),
    "error_code" : MessageLookupByLibrary.simpleMessage("error code"),
    "load_data_failed_tip" : MessageLookupByLibrary.simpleMessage("load data falied, please refresh"),
    "mine" : MessageLookupByLibrary.simpleMessage("mine"),
    "network_poor_tip" : MessageLookupByLibrary.simpleMessage("network poor,please check the network connection"),
    "no_scare" : MessageLookupByLibrary.simpleMessage("no scare"),
    "other_billboard" : MessageLookupByLibrary.simpleMessage("other billboard"),
    "projection" : MessageLookupByLibrary.simpleMessage("projection"),
    "refresh" : MessageLookupByLibrary.simpleMessage("refresh"),
    "search_content_hint" : MessageLookupByLibrary.simpleMessage("please input search content"),
    "seen" : MessageLookupByLibrary.simpleMessage("seen"),
    "showing_projection" : MessageLookupByLibrary.simpleMessage("showing projection"),
    "skip" : MessageLookupByLibrary.simpleMessage("skip"),
    "splash_meet" : MessageLookupByLibrary.simpleMessage("Nice to meet you"),
    "top_250" : MessageLookupByLibrary.simpleMessage("TOP250"),
    "upcoming_projection" : MessageLookupByLibrary.simpleMessage("upcoming projection"),
    "want_to_see" : MessageLookupByLibrary.simpleMessage(" want")
  };
}
