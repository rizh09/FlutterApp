import 'package:bloc_provider/bloc_provider.dart';
import 'package:convid19/blocs/GiphyBloc.dart';
import 'package:convid19/networking/Response.dart';
import 'package:convid19/view/SearchBarView.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/DailyReport.dart';
import '../models/Giphy.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../view/reponse/error.dart';
import '../view/reponse/loading.dart';

class GiphyScreen extends StatefulWidget {
  @override
  GiphyScreenState createState() => GiphyScreenState();
}

enum API_ACTION { PULL, APPEND }

class GiphyScreenState extends State<GiphyScreen> {
  var data = new List<Data>();

  GiphyBloc _bloc;

  int offset = 0;
  int limit = 10;
  String keywords = "god";
  ScrollController _scrollController;
  TextEditingController _editingController;
  _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  _loadMore() async {
    print("loadmore");
    offset += limit;
    _bloc.fetchGifs(API_ACTION.APPEND, keywords, offset, limit);
  }

  @override
  void initState() {
    super.initState();

    _editingController = TextEditingController();

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _bloc = GiphyBloc();
    _bloc.fetchGifs(API_ACTION.PULL, keywords, offset, limit);
  }

  Future _refreshList() async {
    offset = 0;
    _bloc.fetchGifs(API_ACTION.PULL, keywords, offset, limit);
  }

  updateKeywords() {
    keywords = _editingController.text;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GiphyBloc>.fromBloc(
      bloc: _bloc,
      child: RefreshIndicator(
        onRefresh: () => _refreshList(),
        child: StreamBuilder<Response<Data>>(
          stream: _bloc.reportListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  return Column(
                    children: <Widget>[
                      SearchBarView(
                          placeHolder: keywords,
                          limit: limit,
                          editingController: _editingController,
                          updateQuery: () => updateKeywords()),
                      Expanded(
                        child: GifList(
                            list: snapshot.data.data,
                            scroll: _scrollController),
                      )
                    ],
                  );
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchGifs(
                        API_ACTION.PULL, keywords, offset, limit),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    _scrollController.dispose();
    _editingController.dispose();
    super.dispose();
  }
}

class GifList extends StatelessWidget {
  final List<Data> list;
  final ScrollController scroll;
  const GifList({Key key, this.list, this.scroll}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      controller: scroll,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          Fluttertoast.showToast(
              msg: "Copied",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16.0);
          Clipboard.setData(
              ClipboardData(text: list[index].images.downsized.url));
        },
        child: Container(
          height: 200,
          child: CachedNetworkImage(
            imageUrl: list[index].images.downsized.url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
              ),
            ),
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
    );
  }
}

// class DailyReportScreen extends StatefulWidget {
//   @override
//   createState() => _DailyReportState();
// }

// class _DailyReportState extends State<DailyReportScreen> {
//   var reports = new List<DailyReport>();
//   ReportBloc _reportBloc;

//   @override
//   void initState() {
//     super.initState();
//     _reportBloc = ReportBloc();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//         onRefresh: () => _reportBloc.fetchReport(),
//         child: StreamBuilder<Response<DailyReport>>(
//             stream: _reportBloc.reportListStream,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 switch (snapshot.data.status) {
//                   case Status.LOADING:
//                     return Loading(loadingMessage: snapshot.data.message);
//                     break;
//                   case Status.COMPLETED:
//                     return ReportList(reportList: snapshot.data.data);
//                     break;
//                   case Status.ERROR:
//                     return Error(
//                       errorMessage: snapshot.data.message,
//                       onRetryPressed: () => _reportBloc.fetchReport(),
//                     );
//                     break;
//                 }
//               }
//               return Container();
//             }));
//   }

//   @override
//   void dispose() {
//     _reportBloc.dispose();
//     super.dispose();
//   }
// }

class ReportList extends StatelessWidget {
  final List<DailyReport> reportList;
  const ReportList({Key key, this.reportList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 1.0,
            ),
            child: InkWell(
                child: SizedBox(
              height: 65,
              child: Container(
                color: Color(0xFF333333),
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                  child: Text(
                    "numberOfDeathCases + ${reportList[index].numberOfDeathCases}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Roboto'),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            )));
      },
      itemCount: reportList.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }
}
