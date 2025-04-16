import '../models/debt_model.dart';
import '../models/login_model.dart';
import '../models/pending_schedule_model.dart';
import '../models/schedule_model.dart';
import '../models/truck_model.dart';

final List<Schedule> schedules = [
  Schedule(
    id: '001',
    companyName: 'Công Ty CP SX TM Sáng Việt',
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
    companyName: 'CTY CP TM Tân Tiến',
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
    "id": "136685",
    "tenHangHoa":
        "Chất hấp thụ, vật liệu lọc, giẻ lau, vải bảo vệ thải bị nhiễm chất thành phần nguy hại",
    "kl": "10",
  },
  {
    "id": "136686",
    "tenHangHoa": "Thiết bị điện tử thải bỏ",
    "kl": "25",
  },
];

List<Map<String, dynamic>> allData = [
  {
    "name": "Vận chuyển",
    "quantity": 10,
    "price": "15.000",
    "total": "150.000",
  },
  {
    "name": "Bốc vác lên",
    "quantity": 25,
    "price": "5.000",
    "total": "125.000",
  },
];

final List<TruckModel> trucks = [
  TruckModel(
    name: "Container 001 Container 001 Container 001",
    licensePlate: "51C-123.45",
    brand: "Hyundai",
    code: "CTR001",
    type: "Container",
    status: "chờ chuyến",
    loadCapacity: 1.5,
  ),
  TruckModel(
    name: "Container 002",
    licensePlate: "51C-543.21",
    brand: "Hyundai",
    code: "CTR002",
    type: "Container",
    status: "có chuyến",
    loadCapacity: 2.5,
  ),
  TruckModel(
    name: "Container 003",
    licensePlate: "51C-678.90",
    brand: "Hyundai",
    code: "CTR003",
    type: "Container",
    status: "bảo trì",
    loadCapacity: 3,
  ),
  TruckModel(
    name: "Container 004",
    licensePlate: "51C-888.88",
    brand: "Hyundai",
    code: "CTR004",
    type: "Container",
    status: "chờ chuyến",
    loadCapacity: 1,
  ),
  TruckModel(
    name: "Bán tải 001",
    licensePlate: "60C-111.22",
    brand: "Hyundai",
    code: "BT001",
    type: "Bán tải",
    status: "bảo trì",
    loadCapacity: 2.5,
  ),
  TruckModel(
    name: "Bán tải 002",
    licensePlate: "60C-222.33",
    brand: "Hyundai",
    code: "BT002",
    type: "Bán tải",
    status: "chờ chuyến",
    loadCapacity: 3,
  ),
  TruckModel(
    name: "Bán tải 003",
    licensePlate: "60C-333.44",
    brand: "Hyundai",
    code: "BT003",
    type: "Bán tải",
    status: "chờ chuyến",
    loadCapacity: 4.5,
  ),
  TruckModel(
    name: "Bán tải 004",
    licensePlate: "60C-444.55",
    brand: "Hyundai",
    code: "BT004",
    type: "Bán tải",
    status: "có chuyến",
    loadCapacity: 2,
  ),
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

final List<LoginModel> mockUsers = [
  LoginModel(
    username: "Nguyễn Văn Cê",
    email: "merchant@gmail.com",
    password: "123456",
  ),
  LoginModel(
    username: "Nguyễn Văn Bê",
    email: "merchant1@gmail.com",
    password: "password",
  ),
];

final List<PendingScheduleModel> mockWasteCollections = [
  PendingScheduleModel(
    date: "04-05-2025",
    wasteType: "Khoáng",
    weight: "2 tấn",
    worker: "1 NC",
    companyDetails: [
      CompanyDetail(
        companyName: "Công Ty CP SX TM Sáng Việt",
        address:
            "Cơ sở 7: Nhà Máy Dầu Tiếng - Số 19/17 Ấp Gò Mối, xã Thanh Tuyền, Huyện Dầu Tiếng, Bình Dương",
        contactName: "Chị Giao",
        contactPhone: "0909123456",
        quantity: "2 tấn",
        note: "Gom đủ không ghi phiếu",
      ),
      CompanyDetail(
        companyName: "Công Ty CP SX TM Sáng Việt",
        address: "Thủ Thừa (Long An)",
        contactName: "Chị Phượng",
        contactPhone: "0909123456",
        quantity: "2.4 tấn",
        note: "Gom đủ không ghi phiếu",
      ),
    ],
  ),
  PendingScheduleModel(
    date: "2025-04-05",
    wasteType: "Sắt vụn",
    weight: "1.8 tấn",
    worker: "1 NC",
    companyDetails: [
      CompanyDetail(
        companyName: "Công Ty TNHH Vận Tải Minh Phúc",
        address: "Tân An (Long An)",
        contactName: "Anh Minh",
        contactPhone: "0911222333",
        quantity: "1.8 tấn",
        note: "Chở hàng có phiếu đầy đủ",
      ),
    ],
  ),
  PendingScheduleModel(
    date: "04-05-2025",
    wasteType: "Giấy tái chế",
    weight: "2.15 tấn",
    worker: "1 NC",
    companyDetails: [
      CompanyDetail(
        companyName: "CTY CP TM Tân Thịnh",
        address: "Bến Lức (Long An)",
        contactName: "Chị Hương",
        contactPhone: "0988777666",
        quantity: "2.15 tấn",
        note: "Hàng hóa không cần biên bản",
      ),
    ],
  ),
  PendingScheduleModel(
    date: "04-05-2025",
    wasteType: "Khoáng",
    weight: "2.4 tấn",
    worker: "2 NC",
    companyDetails: [
      CompanyDetail(
        companyName: "Công Ty CP SX TM Sáng Việt",
        address: "Thủ Thừa (Long An)",
        contactName: "Chị Giao",
        contactPhone: "0909123456",
        quantity: "2.4 tấn",
        note: "Gom đủ không ghi phiếu",
      ),
    ],
  ),
  PendingScheduleModel(
    date: "04-05-2025",
    wasteType: "Giấy tái chế",
    weight: "2.15 tấn",
    worker: "2 NC",
    companyDetails: [
      CompanyDetail(
        companyName: "CTY CP TM Tân Phát",
        address: "Bến Lức (Long An)",
        contactName: "Chị Hương",
        contactPhone: "0988777666",
        quantity: "2.15 tấn",
        note: "Hàng hóa không cần biên bản",
      ),
    ],
  ),
];

final List<DebtModel> mockDebts = [
  DebtModel(
    day: DateTime(2025, 4, 15),
    quantity: 1,
    title: 'Cước vận chuyển hàng hoá',
    description: 'Cước vận chuyển tháng 10/2024 (Đính kèm bảng kê 06/11/2024)',
    amount: 93733200,
    isPaid: false,
    detail: 'Chi tiết vận chuyển nội địa tháng 10',
  ),
  DebtModel(
    day: DateTime(2025, 4, 15),
    quantity: 1,
    title: 'Dịch vụ đóng gói',
    description: 'Đóng gói hàng xuất khẩu lô 156/2024',
    amount: 12450000,
    isPaid: false,
    detail: 'Chi tiết đóng gói hàng xuất khẩu lô 156',
  ),
  DebtModel(
    day: DateTime(2025, 4, 15),
    quantity: 1,
    title: 'Phí lưu kho',
    description: 'Phí lưu kho tháng 10/2024 (Kho Bình Dương)',
    amount: 45500000,
    isPaid: true,
    detail: 'Chi tiết lưu kho tháng 10/2024',
  ),
  DebtModel(
    day: DateTime(2025, 4, 15),
    quantity: 1,
    title: 'Phí vận chuyển quốc tế',
    description: 'Vận chuyển container HDPE-455 đến Nhật Bản',
    amount: 245890000,
    isPaid: true,
    detail: 'Chi tiết vận chuyển quốc tế HDPE-455',
  ),
];
