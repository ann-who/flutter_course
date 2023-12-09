import 'package:firebase/business_logic_layer/purchase_bloc/purchase_bloc.dart';
import 'package:firebase/data_layer/data_source/firebase_storage_data_source.dart';
import 'package:firebase/data_layer/models/purchase_status.dart';
import 'package:firebase/data_layer/repository/resources_repository.dart';
import 'package:firebase/data_layer/repository/resources_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchasesPage extends StatelessWidget {
  PurchasesPage({super.key});

  final ResourcesRepository resources = ResourcesRepositoryImplementation(
    resourcesDataSource: FirebaseStorageDataSource(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My purchases'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.filter_alt_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.sort_rounded),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.logout_outlined),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: FutureBuilder(
              future: resources.getImage('banner.avif'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data != null) {
                  return Image.network(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  );
                }
                return const Text('Something went wrong');
              },
            ),
          ),
          BlocBuilder<PurchaseBloc, PurchaseState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.error != null) {
                return Column(
                  children: [
                    Text('Something went wrong :('),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Reload purchases list'),
                    ),
                  ],
                );
              } else if (state.purchases.isEmpty) {
                return Text(
                  'Your list is empty. Add items to buy and they will be shown here',
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.purchases.length,
                itemBuilder: (context, index) => Card(
                  child: Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text('purchase'),
                      Spacer(),
                      state.purchases[index].status == PurchaseStatus.notBought
                          ? Icon(
                              Icons.block_outlined,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
