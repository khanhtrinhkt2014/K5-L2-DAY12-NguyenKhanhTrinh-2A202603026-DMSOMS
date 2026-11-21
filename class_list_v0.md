# Danh sách lớp v0 — Nguyễn Khánh Trình · G05

Mỗi lớp trả lời: model cần nhận ra cái này để làm gì?

## DMS

| # | Lớp / thuộc tính | Giá trị | Để làm gì (chức năng DMS) | Thấy được trên IR? |
|---|---|---|---|---|
| 1 | `face` → `eye_left`, `eye_right` | open / closed / unknown | Phát hiện buồn ngủ: mắt nhắm kéo dài qua nhiều khung | Có, trừ khi tròng kính phản xạ đèn LED |
| 2 | `face` → `gaze_zone` | road / mirror_l / mirror_r / mirror_c / cluster / center / lap / other | Cảnh báo mất tập trung khi tài xế rời mắt khỏi đường quá lâu | Có, suy từ hướng đầu và mắt |
| 3 | `face13` | 13 điểm, mỗi điểm có cờ occluded / outside | Ước lượng hướng đầu, độ mở mắt và miệng (ngáp) | Có; điểm bị che thì bật cờ, không đặt cho đủ |
| 4 | `face` → `glasses` | unknown / none / clear / sun | Biết khi nào kết quả trạng thái mắt kém tin cậy | Một phần: kính râm trên NIR có thể trông như kính trong |
| 5 | `hand` → `on_wheel` | yes / no / unknown | Kiểm tra tài xế đặt tay lên vô lăng khi xe chuyển sang lái tay | Thường có; vô lăng có thể lẫn vào nền |
| 6 | `phone` → `state` | held / mounted / lap | Cảnh báo cầm điện thoại khi lái | Có, nếu thấy cạnh, góc hoặc màn hình máy |
| 7 | `person` → `seatbelt` (tài xế) | worn_correct / worn_incorrect / not_worn / unknown | Nhắc thắt dây và phát hiện thắt sai cách | Một phần: dây tối có thể chìm vào áo |

## OMS

| # | Lớp / thuộc tính | Giá trị | Để làm gì (chức năng OMS) | Thấy được trên IR? |
|---|---|---|---|---|
| 1 | `person` → `seat` | driver / front_passenger / rear_left / rear_middle / rear_right | Đếm người theo từng ghế, bật nhắc dây an toàn đúng ghế | Có |
| 2 | `person` → `seatbelt` (hàng sau) | not_worn / unknown | Nhắc hành khách ghế sau thắt dây | Một phần |
| 3 | `child_seat` → `occupied` | no / unknown (coach bổ sung yes) | Nhắc kiểm tra trẻ khi khóa xe; điều chỉnh túi khí | Có, nhận theo hình dạng |
| 4 | `infant_seat` → `facing` | rear / front | Ghế em bé quay ngược đặt ở ghế trước thì phải tắt túi khí | Có, nhận theo hình dạng |
| 5 | `object` → `type` | bag / box / cup / other | Phân biệt đồ vật với người; nhắc quên đồ khi rời xe | Có, nhận theo hình dạng, không theo màu |
| 6 | `face` (chỉ box) | box | Xác nhận ghế có người thật, không phải túi hay gối | Có |
| 7 | `frame_meta` → `camera_blocked` | yes / no | Báo camera bị che thay vì kết luận nhầm là ghế trống | Có |

## 2 câu hỏi leo thang

1. Câu hỏi: Ghế trẻ em có trẻ ngồi bên trong thì gán thế nào? Guideline 4.8 không có `occupied = yes`, nhưng schema coach gửi sau đã thêm giá trị này. Có cần vẽ thêm `person` hoặc `face` cho trẻ không?
   Khung ví dụ: G05 S08_rgb, ghế `rear_left`.
   Tạm gán: `occupied = yes` theo schema coach gửi; không vẽ `person` hay `face` cho trẻ, vì GUIDE §3 dặn thấy trẻ em thì báo coach, không gán.
2. Câu hỏi: Trên ảnh NIR thật, có được ghi `light = night` hoặc `day` không, khi ảnh không cho biết giờ trong ngày?
   Khung ví dụ: G05 D01.
   Tạm gán: `light = unknown` theo quy tắc 4.4-1 (không thấy thì unknown).
