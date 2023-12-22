import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

mixin ShareActionProvider {
  void share(String text);
}

@Injectable(as: ShareActionProvider)
class ShareActionProviderImpl implements ShareActionProvider {
  @override
  void share(String text) {
    Share.share(text);
  }
}
