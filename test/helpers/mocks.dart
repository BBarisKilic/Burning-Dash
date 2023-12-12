import 'package:audioplayers/audioplayers.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:burning_dash/loading/loading.dart';
import 'package:mocktail/mocktail.dart';

class MockPreloadCubit extends MockCubit<LoadingState>
    implements LoadingCubit {}

class MockAudioCache extends Mock implements AudioCache {}
