import 'package:blueprint/app/utils/const.dart';
import 'package:blueprint/app/widgets/user_presentation_widget.dart';
import 'package:blueprint/core/blocs/bloc/issue_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'card_widget.dart';
import 'form_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: FormWidget(),
        ),
        BlocBuilder<IssueBloc, IssueState>(
          builder: (context, state) {
            if (state.requestStatus == RequestStatus.success) {
              return Column(
                children: [
                  UserPresentation(user: state.responseIntegration!.user),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      // shrinkWrap: true,
                      itemCount: state.responseIntegration!.repos.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = state.responseIntegration!.repos[index];
                        return Card(
                          color: const Color.fromARGB(228, 88, 101, 125),
                          elevation: 9,
                          child: ExpansionTile(
                              iconColor: Colors.white,
                              trailing: Text(
                                'Issues: ${data.issues.length}',
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              title: Text(
                                'Repo Name: ${data.name} ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              subtitle: Text(
                                'Repo description: ${data.description} ',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              children: [
                                Column(
                                  children: data.issues.map((issue) {
                                    return CardBody(issue: issue);
                                  }).toList(),
                                )
                              ]),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            if (state.requestStatus == RequestStatus.loading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state.requestStatus == RequestStatus.error) {
              return Center(
                  child: Text(state.errorMessage ?? 'Something wrong happend'));
            }
            return Container();
          },
        ),
      ],
    );
  }
}
