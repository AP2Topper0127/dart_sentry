import 'dart:async';
import 'hub.dart';
import 'protocol.dart';
import 'sentry_client.dart';
import 'sentry_user_feedback.dart';
import 'tracing.dart';

class NoOpHub implements Hub {
  NoOpHub._();

  static final NoOpHub _instance = NoOpHub._();

  factory NoOpHub() {
    return _instance;
  }

  @override
  void bindClient(SentryClient client) {}

  @override
  Future<SentryId> captureEvent(
    SentryEvent event, {
    dynamic stackTrace,
    dynamic hint,
    ScopeCallback? withScope,
  }) async =>
      SentryId.empty();

  @override
  Future<SentryId> captureException(
    dynamic throwable, {
    dynamic stackTrace,
    dynamic hint,
    ScopeCallback? withScope,
  }) async =>
      SentryId.empty();

  @override
  Future<SentryId> captureMessage(
    String? message, {
    SentryLevel? level,
    String? template,
    List? params,
    dynamic hint,
    ScopeCallback? withScope,
  }) async =>
      SentryId.empty();

  @override
  Hub clone() => this;

  @override
  Future<void> close() async {}

  @override
  void configureScope(callback) {}

  @override
  bool get isEnabled => false;

  @override
  SentryId get lastEventId => SentryId.empty();

  @override
  void addBreadcrumb(Breadcrumb crumb, {dynamic hint}) {}

  @override
  Future<SentryId> captureTransaction(SentryTransaction transaction) async {
    return SentryId.empty();
  }

  @override
  Future<SentryId> captureUserFeedback(SentryUserFeedback userFeedback) async {
    return SentryId.empty();
  }

  @override
  ISentrySpan startTransaction(
    String name,
    String operation, {
    String? description,
    bool? bindToScope,
  }) {
    return NoOpSentrySpan();
  }

  @override
  ISentrySpan startTransactionWithContext(
    SentryTransactionContext transactionContext, {
    Map<String, dynamic>? customSamplingContext,
    bool? bindToScope,
  }) {
    return NoOpSentrySpan();
  }

  @override
  ISentrySpan? getSpan() {
    return NoOpSentrySpan();
  }
}
