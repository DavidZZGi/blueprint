part of 'issue_bloc.dart';

@immutable
sealed class IssueEvent {}

class OnLoadIssueInfo extends IssueEvent{
OnLoadIssueInfo();
}
