// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodosProvider)
const todosProviderProvider = TodosProviderProvider._();

final class TodosProviderProvider
    extends $NotifierProvider<TodosProvider, HomeState> {
  const TodosProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todosProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todosProviderHash();

  @$internal
  @override
  TodosProvider create() => TodosProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeState>(value),
    );
  }
}

String _$todosProviderHash() => r'91de106e149d93fa1834fe2e0941926fea680132';

abstract class _$TodosProvider extends $Notifier<HomeState> {
  HomeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HomeState, HomeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeState, HomeState>,
              HomeState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
