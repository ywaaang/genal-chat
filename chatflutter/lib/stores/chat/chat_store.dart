import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/models/chat/chat_list.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'chat_store.g.dart';

// This is the class used by rest of your codebase
class ChatStore = _ChatStore with _$ChatStore;

// The store-class
abstract class _ChatStore with Store {
  @observable
  ChatList? chatList;

  @observable
  ChatList? friendData;

  // @action
  // Future getPosts() async {
  //   final future = _repository.getPosts();
  //   fetchPostsFuture = ObservableFuture(future);

  //   future.then((postList) {
  //     this.postList = postList;
  //   }).catchError((error) {
  //     errorStore.errorMessage = DioErrorUtil.handleError(error);
  //   });
  // }
}
