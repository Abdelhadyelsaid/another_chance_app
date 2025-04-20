import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> results = [];

  Future<void> getSearchResult(String query) async {
    try {
      if (query.isEmpty) {
        results.clear();
        emit(SearchInitial()); // Emit initial/empty state
        return;
      }
      emit(SearchLoading());

      QuerySnapshot<Map<String, dynamic>> productSnapshot =
          await FirebaseFirestore.instance
              .collection('products')
              .where('name', isGreaterThanOrEqualTo: query)
              .where('name', isLessThanOrEqualTo: query + '\uf8ff')
              .get();
      results = [];

      // Product Results
      for (var doc in productSnapshot.docs) {
        results.add({'id': doc.id, 'name': doc['name'], 'image': doc['image']});
      }

      log("This is search results:${results}");
      if (results.isEmpty) {
        emit(SearchNotFound());
      } else {
        emit(SearchSuccess());
      }
    } catch (e) {
      log(e.toString());
      emit(SearchFailed());
    }
  }
}
