import 'package:flutter/material.dart';
import 'package:khoaluan_totnghiep_mobile/src/configs/configs.dart';
import 'package:khoaluan_totnghiep_mobile/src/resources/models/address.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../../../resources/repositories/address.dart';
import '../../../presentation.dart';
import '../../../../utils/routers.dart';

class AddAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BaseWidget<AddAddressViewModel>(
          viewModel:
              AddAddressViewModel(addressRepository: AddressRepository()),
          onViewModelReady: (vm) async {
            await vm.init();
          },
          builder: (context, vm, widget) {
            return Column(
              children: [
                WidgetAppBar(
                  title: 'New address',
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.check_outlined),
                      onPressed: () => vm.addAddress(),
                    )
                  ],
                ),
                ListTile(
                  onTap: () => vm.onCitySelected(),
                  contentPadding: AppStyles.paddingBody,
                  title: const Text('City'),
                  trailing: vm.city == null
                      ? const Text(
                          'Set city',
                          style: TextStyle(color: AppColors.hintDark),
                        )
                      : Text(vm.cityName),
                ),
                ListTile(
                  onTap: () async => vm.onDistrictSelected(),
                  contentPadding: AppStyles.paddingBody,
                  title: const Text('District'),
                  trailing: vm.districtName == null
                      ? const Text(
                          'Set district',
                          style: TextStyle(color: AppColors.hintDark),
                        )
                      : Text(vm.districtName),
                ),
                ListTile(
                  onTap: () => vm.onWardSelected(),
                  contentPadding: AppStyles.paddingBody,
                  title: const Text('Ward'),
                  trailing: vm.wardName == null
                      ? const Text(
                          'Set ward',
                          style: TextStyle(color: AppColors.hintDark),
                        )
                      : Text(vm.wardName),
                ),
                Padding(
                  padding: AppStyles.paddingBody,
                  child: TextFormField(
                    onChanged: (value) => vm.address = value,
                    decoration: const InputDecoration(hintText: 'Address'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}