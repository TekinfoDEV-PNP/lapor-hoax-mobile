import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutState('...'));

  Future<void> getVersion() async {
    final info = await PackageInfo.fromPlatform();
    emit(AboutState(info.version));
  }
}

class AboutState extends Equatable {
  final String data;

  AboutState(this.data);

  @override
  List<Object?> get props => [data];
}
