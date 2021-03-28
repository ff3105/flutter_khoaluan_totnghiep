import 'package:flutter/material.dart';
import '../../../configs/configs.dart';
import '../../../resources/repositories/product.dart';
import '../../base/base.dart';
import 'comment.dart';

class CommentDialog extends StatelessWidget {
  final int productId;

  const CommentDialog({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Comments',
          style: TextStyle(color: AppColors.textDark),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close_outlined, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: BaseWidget<CommentViewModel>(
          viewModel: CommentViewModel(
            productResponse: ProductResponse(),
          ),
          onViewModelReady: (vm) async {
            await vm.init(productId);
          },
          builder: (context, vm, widget) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: vm.comments.data.length,
                itemBuilder: (context, index) {
                  final item = vm.comments.data[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.comment),
                        const SizedBox(height: 10),
                        Text(item.user.name),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}