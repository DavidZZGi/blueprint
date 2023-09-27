import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blueprint/data/model/get_issues_params.dart';
import 'package:blueprint/data/model/issue.dart';
import 'package:blueprint/data/model/repo_model.dart';
import 'package:blueprint/data/repository/issue_repo.dart';
import 'package:blueprint/domain/issue/get_issues.dart';
import 'package:meta/meta.dart';

import '../../../data/model/response_obeject.dart';

part 'issue_event.dart';
part 'issue_state.dart';

class IssueBloc extends Bloc<IssueEvent, IssueState> {
  final GetIssues getIssues;
  IssueBloc(this.getIssues) : super(IssueState()) {
    on<OnLoadIssueInfo>(_onloadIssueInfo);
  }

  Future<void> _onloadIssueInfo(
      OnLoadIssueInfo event, Emitter<IssueState> emit) async {
    try {
      emit(IssueState(requestStatus: RequestStatus.loading));
      final response = await getIssues(NoParams());

      emit(IssueState(
          requestStatus: RequestStatus.success, responseIntegration: response));
    } catch (e) {
      emit(IssueState(
          requestStatus: RequestStatus.error, errorMessage: e.toString()));
    }
  }
}
