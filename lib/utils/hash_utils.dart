import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flut_crack/data/algorithm_type.dart';

String calculateHash(String word, AlgorithmType alg) {

  final bytes = utf8.encode(word);

  const algorithmTypeAlgorithmTypeToFunctionMap = {
    AlgorithmType.md5: crypto.md5,
    AlgorithmType.sha1: crypto.sha1,
    AlgorithmType.sha224: crypto.sha224,
    AlgorithmType.sha256: crypto.sha256,
    AlgorithmType.sha384: crypto.sha384,
    AlgorithmType.sha512: crypto.sha512,
    AlgorithmType.sha512224: crypto.sha512224,
    AlgorithmType.sha512256: crypto.sha512256
  };

  return algorithmTypeAlgorithmTypeToFunctionMap[alg]!.convert(bytes).toString();
}

AlgorithmType hashIdentifying(String hash) {
  const algorithmLengthToTypeMap = {
    32: AlgorithmType.md5,
    40: AlgorithmType.sha1,
    56: AlgorithmType.sha224,
    64: AlgorithmType.sha256,
    96: AlgorithmType.sha384,
    128: AlgorithmType.sha512,
  };

  return algorithmLengthToTypeMap[hash.length]!;
}
