part of 'publish_add_bloc.dart';

@immutable
abstract class PublishAddState {}

class PublishAddInitial extends PublishAddState {}

class PublishAddingLoadingState extends PublishAddState {}

class PublishAddingSuccessState extends PublishAddState {}

class PublishAddingErrorState extends PublishAddState {
  final String error;
  PublishAddingErrorState({required this.error});
}
