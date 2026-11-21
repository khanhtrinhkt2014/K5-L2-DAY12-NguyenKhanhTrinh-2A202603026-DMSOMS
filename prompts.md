# Khai báo dùng AI — Nguyễn Khánh Trình

Không đưa ảnh cabin hay ảnh tài xế (kể cả ảnh chụp màn hình) cho bất kỳ công cụ AI nào.

| # | Công cụ | Bạn hỏi gì (tóm tắt) | Bạn dùng kết quả thế nào | Bạn có kiểm lại không? Bằng gì? |
|---|---|---|---|---|
| 1 | Claude (claude.ai) | Phân tích repo lab Day12 và tóm tắt quy trình từng bước | Dùng làm checklist theo dõi tiến độ trong buổi | Có, đối chiếu với README, GUIDE, CHECKPOINTS, SUBMISSION |
| 2 | Claude (claude.ai) | Chuẩn bị repo nộp: chép G05 vào repo, tạo file nộp từ templates, tạo script chạy cabin_check, cách làm nhóm 3 người | Dùng cấu trúc và script; AI không mở ảnh, không gán nhãn | Có, chạy `cabin_check.py --help`, kiểm `.gitignore` chặn G05 và ảnh |
| 3 | Claude (claude.ai) | Gửi 3 ảnh chụp màn hình CVAT (S01_ir, một ảnh cắt ghế trẻ em) hỏi nên gán gì, `child_seat` hay `infant_seat` | Claude không đưa đáp án cho ảnh, chỉ nhắc luật và tiêu chí phân biệt (quai xách, lưng ghế); mình tự quyết nhãn. Việc gửi ảnh vi phạm RULES §3, mình tự ghi lại ở đây | Có, đối chiếu GUIDE §4.8 |
| 4 | Claude (claude.ai) | Gộp 2 file export (task OMS và task DMS) thành `export_final.zip`, chạy `cabin_check`, soát lỗi script không bắt | Tự sửa trên CVAT: `light`, `face13`, cờ mắt, tay trùng bên. Claude chỉ ghép file, không sửa nhãn | Có, chạy lại `cabin_check` đến khi 0 lỗi |
| 5 | Claude (claude.ai) | Chạy `cabin_check diff` với bài Trịnh Vinh Khánh, đề xuất verdict cho các dòng quyết được bằng luật | Dùng 7 dòng có verdict; các dòng cần xem ảnh để ở trạng thái chờ | Có, đối chiếu GUIDE §4.1, §4.4, §4.8 |
| 6 | Claude (claude.ai) | Sửa câu chữ `ir_log.csv`, `class_list_v0.md`, `self_review.md`, `TEAM.md` từ ý mình đưa; điền `exit_ticket.md` theo đáp án mình tự làm | Dùng bản đã sửa câu chữ; nội dung quan sát và đáp án là của mình | Có, đọc lại từng file và đối chiếu với nhãn trong export |
| 7 | Claude (claude.ai) | Commit các file nộp lên git | Mình tự push lên GitHub | Có, xem git log |
