import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../configs/configs.dart';
import '../../resources/repositories/product.dart';
import '../presentation.dart';

class SearchScreen extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WidgetAppBar(title: 'Search'),
      body: SafeArea(
        child: BaseWidget<SearchViewModel>(
          viewModel: SearchViewModel(productResponse: ProductResponse()),
          onViewModelReady: (vm) {
            vm.init();
          },
          builder: (context, vm, widget) {
            return Column(
              children: [
                const SizedBox(height: 10),
                WidgetInputSearch(
                  controller: controller,
                  padding: AppStyles.paddingBody,
                  autoFocus: true,
                  onChanged: (value) {
                    vm
                      ..keyWord = value
                      ..isSearching = true;
                  },
                  onSubmit: (value) {
                    vm.isSearching = false;
                  },
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: vm.isLoading && vm.result == null
                      ? WidgetLoading()
                      : _body(context, vm),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _body(BuildContext context, SearchViewModel vm) {
    return SingleChildScrollView(
      child: _result(context, vm),
    );
  }

  Widget _result(BuildContext context, SearchViewModel vm) {
    if (vm.result == null) {
      return const SizedBox();
    }
    if (!vm.isSearching && vm.result.data.isEmpty) {
      return const Center(child: Text('Nothing to show'));
    }
    if (vm.isSearching) {
      return Column(
        children: [
          if (vm.isLoading)
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              child: WidgetLoading(),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              itemCount: vm.result.data.length,
              itemBuilder: (context, index) {
                final item = vm.result.data[index];
                return ListTile(
                  onTap: () {
                    controller
                      ..text = item.name
                      ..selection = TextSelection(
                          baseOffset: item.name.length,
                          extentOffset: item.name.length);
                    vm
                      ..keyWord = item.name
                      ..isSearching = false;
                  },
                  leading: const Icon(Icons.search_rounded),
                  minLeadingWidth: 0,
                  title: Text(item.name),
                );
              },
            ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.search_rounded, color: Colors.transparent),
            minLeadingWidth: 0,
            title: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                ),
                children: [
                  const TextSpan(text: 'See results for '),
                  TextSpan(
                    text: vm.keyWord,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    } else {
      return WidgetListProduct(
        product: vm.result,
        onTap: (item) => pushNewScreen(
          context,
          screen: ProductScreen(id: item.id),
        ),
        showSeeAll: false,
        axis: Axis.vertical,
        padding: AppStyles.paddingBody,
      );
    }
  }
}
