import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';

class CommonUtils {
  static CommonUtils? _instance;

  CommonUtils._();

  factory CommonUtils() => _instance ??= CommonUtils._();

  encryptPassword(plainText) {
    final key = "This 32 char key have 256 bits..";
    Encrypted encrypted = encryptWithAES(key, plainText);
    String encryptedBase64 = encrypted.base64;
    return encryptedBase64;
  }
  Encrypted encryptWithAES(String key, String plainText) {
    final cipherKey = encrypt.Key.fromUtf8(key);
    final encryptService = Encrypter(AES(cipherKey, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(key.substring(0, 16));
    Encrypted encryptedData = encryptService.encrypt(plainText, iv: initVector);
    return encryptedData;
  }

  decryptPassword(encryptedBase64){
    //var encryptedBase64= "J5CUkv9HY+cHQbiQJtxuhQ==";
    final key = "This 32 char key have 256 bits..";
    String decryptedText = decryptWithAES(key, encryptedBase64);
    return decryptedText;
  }
  String decryptWithAES(String key, String base64) {
    final cipherKey = encrypt.Key.fromUtf8(key);
    final encryptService = Encrypter(AES(cipherKey, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(key.substring(0, 16));
    return encryptService.decrypt(Encrypted.fromBase64(base64), iv: initVector);
  }
}
