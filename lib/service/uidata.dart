import '../models/debt_model.dart';
import '../models/schedule_model.dart';
import '../models/truck.dart';

final List<Schedule> schedules = [
  Schedule(
    id: '001',
    companyName: 'Công Ty CP SX TM Sáng Việt Ty CP SX TM Sáng Việt  ',
    description: 'Gom đủ không ghi phiếu',
    from: 'Thủ Thừa (Long An)',
    to: 'Bình Tân (TP.HCM)',
    contactName: 'Chị Giao',
    contactPhone: '0909123456',
    cargoType: 'Khoáng',
    datetime: DateTime(2025, 4, 5, 16, 30),
    note: "Gom đủ không ghi phiếu",
    price: 2400000,
    status: 'Đã thu gom',
  ),
  Schedule(
    id: '002',
    companyName: 'Công Ty TNHH Vận Tải Minh Phúc',
    description: 'Chở hàng có phiếu đầy đủ',
    from: 'Tân An (Long An)',
    to: 'Quận 9 (TP.HCM)',
    contactName: 'Anh Minh',
    contactPhone: '0911222333',
    cargoType: 'Sắt vụn',
    datetime: DateTime(2025, 4, 5, 16, 30),
    note: "Gom đủ không ghi phiếu",
    status: 'Chưa thu gom',
    price: 1800000,
  ),
  Schedule(
    id: '003',
    companyName: 'CTY CP TM Tân Thịnh',
    description: 'Hàng hóa không cần biên bản',
    from: 'Bến Lức (Long An)',
    to: 'Thủ Đức (TP.HCM)',
    contactName: 'Chị Hương',
    contactPhone: '0988777666',
    cargoType: 'Giấy tái chế',
    datetime: DateTime(2025, 4, 5, 16, 30),
    status: 'Chưa thu gom',
    note: "Gom đủ không ghi phiếu",
    price: 2150000,
  ),
  Schedule(
    id: '004',
    companyName: 'Công Ty CP SX TM Sáng Việt',
    description: 'Gom đủ không ghi phiếu',
    from: 'Thủ Thừa (Long An)',
    to: 'Bình Tân (TP.HCM)',
    contactName: 'Chị Giao',
    contactPhone: '0909123456',
    cargoType: 'Khoáng',
    datetime: DateTime(2025, 4, 15, 16, 30),
    note: "Gom đủ không ghi phiếu",
    price: 2400000,
    status: 'Đã thu gom',
  ),
  Schedule(
    id: '005',
    companyName: 'CTY CP TM Tân Phát',
    description: 'Hàng hóa không cần biên bản',
    from: 'Bến Lức (Long An)',
    to: 'Thủ Đức (TP.HCM)',
    contactName: 'Chị Hương',
    contactPhone: '0988777666',
    cargoType: 'Giấy tái chế',
    datetime: DateTime(2025, 4, 15, 16, 30),
    status: 'Chưa thu gom',
    note: "Gom đủ không ghi phiếu",
    price: 2150000,
  ),
  Schedule(
    id: '006',
    companyName: 'Công Ty CP SX TM Sáng Việt',
    description: 'Gom đủ không ghi phiếu',
    from: 'Thủ Thừa (Long An)',
    to: 'Bình Tân (TP.HCM)',
    contactName: 'Chị Giao',
    contactPhone: '0909123456',
    cargoType: 'Khoáng',
    datetime: DateTime(2025, 4, 15, 16, 30),
    note: "Gom đủ không ghi phiếu",
    price: 2400000,
    status: 'Đã thu gom',
  ),
  Schedule(
    id: '007',
    companyName: 'CTY CP TM Tân Tiến CP TM Tân Tiến',
    description: 'Hàng hóa không cần biên bản',
    from: 'Bến Lức (Long An)',
    to: 'Thủ Đức (TP.HCM)',
    contactName: 'Chị Hương',
    contactPhone: '0988777666',
    cargoType: 'Giấy tái chế',
    datetime: DateTime(2025, 4, 15, 16, 30),
    status: 'Chưa thu gom',
    note: "Gom đủ không ghi phiếu",
    price: 2150000,
  ),
];

final List<Map<String, String>> images = [
  {
    'image': 'assets/images/temp.png',
    'title': 'Mời thầu vận chuyển vải vụn tại khu vực miền tây...',
  },
  {
    'image': 'assets/images/temp.png',
    'title': 'Mời thầu vận chuyển vải vụn tại khu vực miền tây...',
  },
];

final List<Map<String, String>> collectedItems = [
  {
    "id": "Bãi rác Nam Sơn",
    "tenHangHoa": "Chất thải nguy hại",
    "kl": "10000",
  },
  {
    "id": "Nhà máy phân compost",
    "tenHangHoa": "chất thải sinh hoạt",
    "kl": "2500",
  },
];

List<Map<String, dynamic>> allData = [
  {
    "name": "Thuê nhân công",
    "quantity": 10,
    "price": "15.000",
    "total": "150.000",
  },
  {
    "name": "Bốc vác xuống",
    "quantity": 25,
    "price": "5.000",
    "total": "125.000",
  },
];

final List<Truck> mockTrucks = [
  Truck(
      1, '51A-12345', 'Hyundai-0123', 'Hyundai', 'Thùng kín', 5, 'Đã sắp lịch'),
  Truck(5, '51E-56789', 'Isuzu-0456', 'Isuzu', 'Thùng bạt', 8, 'Chưa sắp lịch'),
  Truck(3, '51C-34567', 'Hino-0123', 'Hino', 'Thùng bạt', 15, 'Chưa sắp lịch'),
  Truck(2, '51B-23456', 'Isuzu-0123', 'Isuzu', 'Thùng kín', 8, 'Đã sắp lịch'),
  Truck(4, '51D-45678', 'Hyundai-0456', 'Hyundai', 'Thùng kín', 5,
      'Chưa sắp lịch'),
];

final List<Map<String, String>> truckData = [
  {
    'code': 'CTG-75164',
    'company': 'Công ty XYZ,Công ty XYZ,Công ty XYZ,Công ty XYZ',
    'driver': 'Lê Thị Cúc',
    'status': 'Đã thu gom',
  },
  {
    'code': 'CTG-75164',
    'company': 'Công ty XYZ',
    'driver': 'Lê Thị Cúc',
    'status': 'Đã thu gom',
  },
  {
    'code': 'CTG-75164',
    'company': 'Công ty XYZ',
    'driver': 'Lê Thị Cúc',
    'status': 'Đã thu gom',
  },
  {
    'code': 'CTG-75163',
    'company': 'Công ty ABC',
    'driver': 'Trần Văn Bình Bình',
    'status': 'Đã thu gom',
  },
];

final List<DebtModel> mockDebts = [
  DebtModel(
    code: "CN001",
    title: "Công nợ tháng 4",
    date: DateTime(2025, 05, 14),
    amount: 73000000,
    status: "Chưa thanh toán",
    progress: "0/3",
  ),
  DebtModel(
    code: "CN002",
    title: "Công nợ tháng 3",
    date: DateTime(2025, 05, 15),
    amount: 55000500,
    status: "Đã thanh toán",
    progress: "4/4",
  ),
  DebtModel(
    code: "CN006",
    title: "Công nợ tháng 3",
    date: DateTime(2025, 05, 15),
    amount: 120000000,
    status: "Đã thanh toán",
    progress: "4/4",
  ),
  DebtModel(
    code: "CN007",
    title: "Công nợ tháng 3",
    date: DateTime(2025, 05, 16),
    amount: 50500000,
    status: "Đã thanh toán",
    progress: "4/4",
  ),
  DebtModel(
    code: "CN004",
    title: "Công nợ tháng 3",
    date: DateTime(2025, 05, 13),
    amount: 30500000,
    status: "Hết hạn",
    progress: "2/4",
  ),
  DebtModel(
    code: "CN003",
    title: "Công nợ tháng 3",
    date: DateTime(2025, 05, 12),
    amount: 42000100,
    status: "Thanh toán một phần",
    progress: "2/4",
  ),
];
