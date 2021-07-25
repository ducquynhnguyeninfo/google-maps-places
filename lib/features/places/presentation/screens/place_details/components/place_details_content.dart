import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/features/places/domain/entities/place_details_entity.dart';

class PlaceDetailsContent extends StatefulWidget {
  final PlaceDetailsEntity detailsEntity;

  PlaceDetailsContent(this.detailsEntity);

  @override
  _PlaceDetailsContentState createState() => _PlaceDetailsContentState();
}

class _PlaceDetailsContentState extends State<PlaceDetailsContent> {
  late Future<String> _loader;
  bool _shouldFail = false;

  // mock function to load some data or fail after some delay
  Future<String> getData(bool shouldFail) async {
    await Future<void>.delayed(Duration(seconds: 3));
    if (shouldFail) {
      throw PlatformException(code: '404');
    }
    return content;
  }

  var content =
      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

  void _retry() {
    // update loader
    _loader = getData(!_shouldFail);
    setState(() => _shouldFail = !_shouldFail);
  }

  @override
  void initState() {
    super.initState();
    _loader = getData(_shouldFail);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TextAndButton(
            content: content,
            buttonText: 'Reload',
            onPressed: _retry,
          ),
        )
      ],
    );
  }
}

class TextAndButton extends StatelessWidget {
  const TextAndButton(
      {Key? key,
      required this.content,
      required this.buttonText,
      required this.onPressed})
      : super(key: key);
  final String content;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              content,
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(buttonText,
                style: Theme.of(context)
                    .textTheme
                    .headline!
                    .copyWith(color: Colors.white)),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
