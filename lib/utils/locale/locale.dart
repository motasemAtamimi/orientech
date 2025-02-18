import 'package:get/get.dart';

import 'locale_ar.dart';
import 'locale_en.dart';

class MyLocale implements Translations{
  @override
  Map<String,Map<String,String>> get keys =>{
    'ar': ar,
    "en": en
  };
}