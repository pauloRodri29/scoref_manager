import 'package:mobx/mobx.dart';
part 'volleyball_score_store.g.dart';

class VolleyballScoreStore = _VolleyballScoreStoreBase
    with _$VolleyballScoreStore;

abstract class _VolleyballScoreStoreBase with Store {
  @observable
  int scoreTeam1 = 0;

  @observable
  int scoreTeam2 = 0;

  @computed
  int get isScoreTeam1 => scoreTeam1;

  @computed
  int get isScoreTeam2 => scoreTeam2;

  @action
  int incrementStoreTeam1() {
    return scoreTeam1++;
  }

  @action
  int decrementStorieTeam1() {
    return scoreTeam1--;
  }

  @action
  int resetStoreTeam1() {
    return scoreTeam1 = 0;
  }

  @action
  int incrementStoreTeam2() {
    return scoreTeam2++;
  }

  @action
  int decrementStorieTeam2() {
    return scoreTeam2--;
  }

  @action
  int resetStoreTeam2() {
    return scoreTeam2 = 0;
  }
}
