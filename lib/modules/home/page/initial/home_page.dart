import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:ambev/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get<HomeStore>();

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status: ${e.toString()}');
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Teste Ambev",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Column(
          children: [
            _buildTextField,
            const SizedBox(height: 20),
            Observer(
              builder: (context) {
                if (store.books.isEmpty) {
                  return _buildEmptyResult;
                }

                return SingleChildScrollView(
                  child: SizedBox(
                    height: ((MediaQuery.of(context).size.height / 4) * 3) -
                        MediaQuery.of(context).size.height / 25,
                    child: _buildListOfResults,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildTextField {
    return TextField(
      decoration: const InputDecoration(
        suffixIcon: Icon(
          Icons.search,
        ),
      ),
      onChanged: store.changeTerm,
      onSubmitted: _connectionStatus == ConnectivityResult.none
          ? store.getFromDatabase
          : store.getBooks,
    );
  }

  Widget get _buildListOfResults {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: store.books.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        final item = store.books.elementAt(index);

        return GestureDetector(
          onTap: () {
            Modular.to.pushNamed(
              '/detail',
              arguments: item,
            );
          },
          child: Card(
            elevation: 4,
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/books.jpg",
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    child: Column(
                      children: [
                        Text(
                          item.volumeInfo.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.volumeInfo.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get _buildEmptyResult {
    return const Center(
      child: Text(
        "Nenhum item buscado",
      ),
    );
  }
}
