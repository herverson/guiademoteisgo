import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/models/motel_model.dart';
import '../bloc/tab_cubit.dart';

class SuiteCard extends StatelessWidget {
  final Suite suite;

  const SuiteCard({super.key, required this.suite});

  void _showAllItemsDialog(BuildContext context) {
    final principaisItens = suite.categoriaItens.take(5).toList();
    final adicionais = suite.itens.toList();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Center(
                    child: Text(
                      suite.nome.toLowerCase(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "principais itens",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 200,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: principaisItens.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = principaisItens[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              item.icone,
                              height: 32,
                              width: 32,
                            ),
                            SizedBox(height: 4),
                            Text(
                              item.nome,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "tem também",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    adicionais.map((item) => item.nome).join(", "),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Fechar"),
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

  @override
  Widget build(BuildContext context) {
    final maxItemsPerRow = 5;

    return BlocBuilder<TabStateCubit, bool>(
      builder: (context, state) {
        return Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (suite.fotos.isNotEmpty)
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.0)),
                      child: Image.network(
                        suite.fotos[0],
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        suite.nome,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => _showAllItemsDialog(context),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...suite.categoriaItens
                          .take(maxItemsPerRow)
                          .map<Widget>((item) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              item.icone,
                              height: 40,
                              width: 40,
                            ),
                          ),
                        );
                      }),
                      TextButton(
                        onPressed: () => _showAllItemsDialog(context),
                        child: Text(
                          "ver \ntodos",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (!state)
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.nights_stay_outlined),
                              Text(
                                "Pernoite",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            "R\$ ${NumberFormat('#,##0.00', 'pt_BR').format(suite.periodos[0].valor)}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          // SizedBox(width: 8),
                          Text(
                            "até 12x de R\$ ${NumberFormat('#,##0.00', 'pt_BR').format(suite.periodos[0].valor / 12)}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            if (state)
              ...suite.periodos.map<Widget>((periodo) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 8),
                            Text(
                              periodo.tempoFormatado,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(height: 8),
                            Text(
                              'R\$ ${NumberFormat('#,##0.00', 'pt_BR').format(periodo.valor)}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
          ],
        );
      },
    );
  }
}
