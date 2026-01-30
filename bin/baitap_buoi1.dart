import 'dart:io';
import 'dart:math';
import 'dart:convert';

void BTTL_bai1() {
  print('--- BTTL: BÀI 1 ---');

  stdout.write('Nhập số que kem: ');
  int soKem = int.parse(stdin.readLineSync()!);

  stdout.write('Nhập giá 1 que kem: ');
  double gia = double.parse(stdin.readLineSync()!);

  double tong = soKem * gia;

  if (soKem > 10) 
  {
    tong = tong * 0.9;
  } 
  else if (soKem >= 5 && soKem <= 10) 
  {
    tong = tong * 0.95;
  }
  else
  {
    tong = tong - 0 ;
  }
  print('Số tiền phải trả: $tong');
}
void BTTL_bai2() {
  print('--- BTTL: BÀI 2 ---');

  stdout.write('Nhập số nguyên dương > 10: ');
  int n = int.parse(stdin.readLineSync()!);
  String s = n.toString();
  print('Số chữ số trong số nguyên: ${s.length}');
  int tong = 0;

  bool coSoLe = false;
  for (var ch in s.split('')) {
    int digit = int.parse(ch);
    tong += digit;
    if (digit % 2 != 0) coSoLe = true;
  }
  print('Tổng chữ số trong số nguyên: $tong');
  print(coSoLe ? 'Có chứa chữ số lẻ' : 'Không chứa chữ số lẻ');
}
bool laSoNguyenTo(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}
void BTTL_bai3() {
  print('--- BTTL: BÀI 3 ---');
  stdout.write("Nhập danh sách số nguyên: ");
  List<int> list = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  print('\na. Danh sách vừa nhập:');
  print(list);
  int tong = list.reduce((a, b) => a + b);
  print('\nb. Tổng các phần tử: $tong');
  print('\nc. Các số nguyên tố trong danh sách:');
  bool coNguyenTo = false;
  for (var x in list) {
    if (laSoNguyenTo(x)) {
      print(x);
      coNguyenTo = true;
    }
  }
  if (!coNguyenTo) {
    print('Không có số nguyên tố');
  }
  stdout.write('\nd. Nhập giá trị cần tìm: ');
  int value = int.parse(stdin.readLineSync()!);

  if (list.contains(value)) {
    print('Giá trị $value ở vị trí: ${list.indexOf(value)}');
  } else {
    list.insert(0, value);
    print('Không tìm thấy. Đã thêm $value vào đầu danh sách');
  }

  print('Danh sách sau cùng: $list');
}
void BTVN_bai1(){
  print('\n--- BTVN: BÀI 1 ---');

  Random rand = Random();
  int n = 10; 
  List<int> list = List.generate(n, (_) => rand.nextInt(96) + 5);

  print('\na. Danh sách:');
  print(list);

  var soLe = list.where((x) => x % 2 != 0).toList();
  if (soLe.isEmpty) {
    print('\nb. Danh sách không có số lẻ');
  } else {
    double tb = soLe.reduce((a, b) => a + b) / soLe.length;
    print('\nb. Trung bình cộng các số lẻ: $tb');
  }

  bool doiXung = true;
  for (int i = 0; i < list.length ~/ 2; i++) {
    if (list[i] != list[list.length - 1 - i]) {
      doiXung = false;
      break;
    }
  }
  print('\nc. ${doiXung ? "Danh sách đối xứng" : "Danh sách không đối xứng"}');

  bool tangDan = true;
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i] > list[i + 1]) {
      tangDan = false;
      break;
    }
  }
  print('\nd. ${tangDan ? "Danh sách tăng dần" : "Danh sách không tăng dần"}');

  int maxVal = list.reduce(max);
  print('\ne. Phần tử lớn nhất: $maxVal');

  var soChan = list.where((x) => x % 2 == 0).toList();
  if (soChan.isEmpty) {
    print('\nf. Danh sách không có số chẵn');
  } else {
    print('\nf. Số chẵn lớn nhất: ${soChan.reduce(max)}');
  }

  stdout.write('\ng. Nhập giá trị cần xóa: ');
  int value = int.parse(stdin.readLineSync()!);

  if (!list.contains(value)) {
    print('Không tìm thấy');
  } else {
    list.removeWhere((x) => x == value);
    print('Danh sách sau khi xóa $value: $list');
  }
}
void BTVN_bai2() {
  print('\n--- BTVN: BÀI 2 ---');

  stdout.write('Nhập chuỗi: ');
  String s = stdin.readLineSync(encoding: utf8)!;

  print('\na. Chuỗi vừa nhập: $s');

  String vowels = 'aeiouAEIOUáàạảãâăéèẹẻẽêíìịỉĩóòọỏõôơúùụủũư';
  int demNguyenAm = 0;
  for (var ch in s.split('')) {
    if (vowels.contains(ch)) demNguyenAm++;
  }
  print('\nb. Số ký tự nguyên âm: $demNguyenAm');

  int soTu = s.trim().isEmpty? 0 : s.trim().split(RegExp(r'\s+')).length;
  print('\nc. Số từ trong chuỗi: $soTu');

  String clean = s.replaceAll(' ', '').toLowerCase();
  bool doiXung = clean == clean.split('').reversed.join();
  print('\nd. ${doiXung ? "Chuỗi đối xứng" : "Chuỗi không đối xứng"}');

  String daoTu = s.split(' ').reversed.join(' ');
  print('\ne. Chuỗi sau khi đảo từ: $daoTu');
}
void main() {
  print('===== MENU =====');
  print('1. BTTL: Bài 1  Tính tiền que kem');
  print('2. BTTL: Bài 2  Xử lý số nguyên');
  print('3. BTTL: Bài 3  Danh sách số nguyên');
  print('4. BTVN: Bài 1  Danh sách số ngẫu nhiên');
  print('5. BTVN: Bài 2  Xử lí chuỗi');

  print('0. Thoát');

  stdout.write('Chọn bài: ');
  int chon = int.parse(stdin.readLineSync()!);

  switch (chon) {
    case 1:
      BTTL_bai1();
      break;
    case 2:
      BTTL_bai2();
      break;
    case 3:
      BTTL_bai3();
      break;
    case 4:
      BTVN_bai1();
      break;
    case 5:
      BTVN_bai2();
      break;
    case 0:
      print('Thoát');
      break;
    default:
      print('Chọn sai!');
  }
}
