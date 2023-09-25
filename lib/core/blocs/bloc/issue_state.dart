part of 'issue_bloc.dart';
enum  RequestStatus{initial,loading,success,error}
@immutable
class IssueState{
final RequestStatus requestStatus;
final ResponseIntegration ? responseIntegration;
final String ?errorMessage;
IssueState({this.requestStatus=RequestStatus.initial, this.responseIntegration,this.errorMessage});


}
