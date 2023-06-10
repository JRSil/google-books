import 'package:ambev/modules/home/util/sale_enum.dart';
import 'package:ambev/shared/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ambev/modules/home/home_store.dart';
import 'package:ambev/modules/home/models/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final HomeStore store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.book.volumeInfo.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/books.jpg",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  _buildPaymentRow,
                  Text(
                    widget.book.volumeInfo.description,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Visibility(
                    visible: store.getSaleability(widget.book) ==
                        Saleability.forSale,
                    child: ElevatedButton(
                      onPressed: () {
                        final saleUrl = widget.book.saleInfo.url;
                        if (saleUrl != null && saleUrl.isNotEmpty) {
                          final Uri url = Uri.parse(saleUrl);
                          _launchUrl(url);
                        }
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text("Comprar"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildPaymentRow {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Observer(
          builder: (_) {
            return IconButton(
              onPressed: () {
                setState(() {
                  store.put(widget.book);
                });
              },
              icon: Icon(
                store.containsKey(widget.book.id)
                    ? Icons.star
                    : Icons.star_border,
                size: 36,
                color: store.containsKey(widget.book.id)
                    ? Colors.amber
                    : Colors.black,
              ),
            );
          },
        ),
        Visibility(
          visible: store.getSaleability(widget.book) == Saleability.forSale,
          child: Text(
            store.getSaleability(widget.book) == Saleability.forSale
                ? widget.book.saleInfo.price!.toMoney()
                : "",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Problema ao acessar: $url');
    }
  }
}
