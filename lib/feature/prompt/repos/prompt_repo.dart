import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_image_generation/config.dart';

class PromptRepo {
  static Future<Uint8List?> generateImage(String prompt) async {
    try {
      // final apiKey = dotenv.env['API_KEY'];
      final apiKey = Config.apiKey;

      String url = 'https://api.vyro.ai/v1/imagine/api/generations';

      Map<String, String> headers = {'Authorization': 'Bearer $apiKey'};

      Map<String, dynamic> payload = {
        'prompt': prompt,
        'style_id': '31',
        'aspect_ratio': '3:4',
        'cfg': '3',
        'seed': '1',
        'high_res_results': '1'
      };

      FormData formData = FormData.fromMap(payload);

      Dio dio = Dio();
      Response response = await dio.post(url,
          data: formData,
          options: Options(headers: headers, responseType: ResponseType.bytes));

      if (response.statusCode == 200) {
        Uint8List uint8list = Uint8List.fromList(response.data);
        return uint8list;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
