# Tự đánh giá — Nguyễn Khánh Trình · G05

## 1. Tự rà soát 4 cảnh

Loại lỗi: `seat_flip`, `wrong_class`, `guess`, `box`, `missing`, `extra`, `lr_flip` (trái/phải mặt), `flag` (thiếu cờ điểm), `ok`.

| Ảnh | Đối tượng | Loại lỗi | Ghi chú | Đã sửa? |
|---|---|---|---|---|
| S01_rgb | frame_meta.light | guess | Ghi `day` cho ảnh SVIRO dựng; phải là `unknown`. Lỗi lặp ở cả 8 ảnh `_rgb` | Có |
| S03_rgb | object (trái ảnh) | seat_flip (nghi) | Mình ghi `rear_left`, Phúc ghi `rear_right`. Nếu vật nằm bên trái ảnh thì đúng phải là `rear_right` | Chưa, ghi lại để xem cùng coach |
| D02 | hand ×2 | lr_flip | Hai tay cùng `side = left`; `cabin_check` báo ERROR | Có |
| D02 | face13 (8 điểm mắt) | flag | Mắt ghi `unknown` nhưng điểm mắt chưa bật cờ | Có (bật `occluded`) |

## 2. Lỗi mình lặp lại nhiều nhất hôm nay

Lỗi: ghi `light = day` (S03_rgb ghi `night`) cho cả 8 ảnh `S##_rgb`, trong khi ảnh SVIRO luôn phải là `light = unknown`.

Vì sao mình mắc: thấy ảnh màu sáng rõ nên mặc định là ban ngày, quên rằng SVIRO là ảnh dựng bằng máy tính, không có giờ trong ngày thật. Bên ảnh `_ir` mình lại ghi đúng `unknown`, nên hai ảnh cùng cảnh bị lệch nhau.

Lần sau tránh bằng cách: đặt `frame_meta` theo quy tắc của bộ dữ liệu chứ không theo cảm nhận (S## luôn `light = unknown`); gán xong mỗi cặp `_rgb`/`_ir` thì so `frame_meta` của hai ảnh; chạy `cabin_check` ngay sau 2 cảnh đầu thay vì đợi gán xong cả bài.

## 3. Ghi chú về disagreement_log

Một dòng bạn của mình đúng và mình sai: D03, `hand.side`. Cả Phúc và Trịnh Vinh Khánh đều gán hai tay ngược với mình. Nhiều khả năng mình đã đảo trái/phải trên ảnh xoay 90°. Mình học được: với ảnh D##, phải xác định trái/phải theo cơ thể tài xế (xoay đầu theo ảnh rồi chỉ tay), không theo phía của ảnh.
