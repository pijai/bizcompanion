import 'package:flutter/material.dart';
import '../data/client/client_data.dart';
import '../data/client/client_data_mock.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

// class IndexNr {
//   IndexNr({
//     this.nr
//   });

//   final int nr;
// }

//   List<IndexNr> nrs = <IndexNr> [
//     new IndexNr(nr: 1),
//     new IndexNr(nr: 2),
//     new IndexNr(nr: 3),
//     new IndexNr(nr: 4),
//     new IndexNr(nr: 5),
//     new IndexNr(nr: 6)
//   ];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: _body(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisSize: MainAxisSize.min,
//      mainAxisAlignment: MainAxisAlignment.center,
//      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _rowGraphSales(),
        _rowBalance(),
        _rowIncomeExpenses(),
        _rowTitle(),
        _rowPendingList(),
      ],
    );
  }

  Widget _rowGraphSales() {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _graphCircular(),
            _salesTarget(),
          ],
        ));
  }

  Widget _graphCircular() {
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();
    final _chartSize = const Size(200.0, 200.0);
    double _curSales = 10000.0;
    double _tarSales = 20000.0;
    return Expanded(
        child: new AnimatedCircularChart(
      key: _chartKey,
      size: _chartSize,
      initialChartData: <CircularStackEntry>[
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              (_curSales / _tarSales) * 100,
              Colors.blue[400],
              rankKey: 'completed',
            ),
            new CircularSegmentEntry(
              ((_tarSales - _curSales) / _tarSales) * 100,
              Colors.grey[100],
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: true,
      holeLabel: 'RM $_curSales',
      labelStyle: new TextStyle(
        color: Colors.red[600],
//          fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    ));
  }

  Widget _salesTarget() {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(height: 0.0),
        buildSalesTargetColumn('3rd Week Sales', '3000', Colors.green, 24.0),
        SizedBox(height: 16.0),
        buildSalesTargetColumn('June Sales', '45 000', Colors.orange, 24.0),
        SizedBox(height: 16.0),
        buildSalesTargetColumn('2017 Sales', '160 000', Colors.red, 24.0)
      ],
    ));
  }

  Widget _rowBalance() {
    return new Container(
        child: buildSalesTargetColumn(
            'Balance', '20 000', Colors.lime[800], 32.0));
  }

  Widget _rowIncomeExpenses() {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: buildSalesTargetColumn('Income', '10 000', Colors.green, 24.0),
        ),
        new Expanded(
          child: buildSalesTargetColumn('Expenses', '5 000', Colors.red, 24.0),
        )
      ],
    );
  }

  Column buildSalesTargetColumn(
      String label, String salesTarget, Color color, double fontSize) {
    return new Column(
      children: <Widget>[
        new Container(
          // padding: EdgeInsets.only( top: 16.0),
          child: Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 16.0),
          ),
        ),
        new Container(
          // padding: EdgeInsets.only(bottom: 8.0),
          child: new Text(
            ' RM $salesTarget',
            style: TextStyle(
              color: color,
              fontSize: fontSize,
            ),
          ),
        )
      ],
    );
  }

  Widget _rowTitle() {
    return new Container(
      color: Colors.grey[100],
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
//      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text(
        'Pending Leads',
        style: TextStyle(color: Colors.grey, fontSize: 20.0),
      ),
        ],
      ),
    );

//      child: Text(
//        'Pending Leads',
//        style: TextStyle(color: Colors.grey, fontSize: 20.0),
//      ),
  }

  Widget _rowPendingList() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new SafeArea(
          minimum: EdgeInsets.zero,
          child: new GridView.count(
            childAspectRatio: 1.8,
              crossAxisCount: 2,
              children: kClients.map((Client client) {
                return new Card(
                    elevation: 4.0,
                    margin: EdgeInsets.all(8.0),
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text('${client.fullName}'),
                        new Text('${client.problems}'),
                        new Text('${client.phones}')
                      ],
                    )));
              }).toList())),
    );
  }
}




class CstRadioBtnModel {
  bool isSelected;
  final String buttonText;

  CstRadioBtnModel(this.isSelected, this.buttonText);
}

class CustomRadioButton extends StatefulWidget {
  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  List<CstRadioBtnModel> data = new List<CstRadioBtnModel>();

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      data.add(new CstRadioBtnModel(true, 'Product In'));
      data.add(new CstRadioBtnModel(false, 'Product Out'));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                              data.forEach((element) => element.isSelected = false );
                              data[index].isSelected = true;
                            });
            },
            child: new RadioItem(data[index]),
          );
        },
      )
    );
  }
}

class RadioItem extends StatelessWidget {
  final CstRadioBtnModel _item;
  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: Text(
          _item.buttonText,
          style: TextStyle(
            color: _item.isSelected ? Colors.white : Colors.black,
            fontSize: 16.0
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
        border: Border.all(
          width: 1.0, 
          color: _item.isSelected ? Colors.blueAccent : Colors.grey),
        borderRadius: const BorderRadius.all(const Radius.circular(2.0))
      ),
    );
  }
}

