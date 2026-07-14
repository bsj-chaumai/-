# QD Framework — Role QD & Output đánh giá

**Phạm vi hiện tại:** `要件・計画` → `設計 SPEC` → `デザイン`  
*(Ưu tiên làm rõ qua ví dụ SPEC của PM.)*

---

## 1. Role QD — làm rõ từ ví dụ PM

### Ví dụ gốc

> **Spec Reviewer:** review nội dung SPEC → đưa ra **指摘数**  
> **Spec QD:** xác nhận kết quả review SPEC.  
> Ví dụ: SPEC **100 màn**, 指摘数 **= 1** → đánh giá **chất lượng review kém** → **yêu cầu verify SPEC** (vì chất lượng SPEC khả năng cũng có vấn đề).

### Tách việc (không 曖昧)

| | Spec Reviewer | Spec QD |
|---|---|---|
| **Input** | SPEC (nội dung) | Kết quả review: quy mô + 指摘数 (+ phân mức) + record review |
| **Việc chính** | Soi nội dung, tìm lỗi/thiếu | Nhìn kết quả review có **đáng tin** không |
| **Output** | Danh sách 指摘 + **指摘数** | Kết luận: **Chấp nhận review** / **Yêu cầu verify lại** |
| **Không làm** | Kết luận “giai đoạn đạt chuẩn vận hành” thay QD | Không thay Reviewer đọc 100 màn để tìm 指摘 mới |

### QD đang làm 2 việc (cần tách trong đầu)

| Việc | Ý nghĩa trong ví dụ |
|---|---|
| **(1) Đánh giá chất lượng REVIEW** | 100 màn mà chỉ 1 指摘 → review **quá mỏng** → không tin kết quả review |
| **(2) Ra quyết định vận hành** | Vì không tin review → **chặn đi tiếp**, yêu cầu **verify SPEC** (review lại / kiểm lại) |

> QD **không kết luận trực tiếp** “SPEC sai chỗ nào”.  
> QD kết luận: **“Bằng chứng review chưa đủ tin → phải verify lại trước khi sang bước sau.”**

```
SPEC (100 màn)
    │
    ▼
Spec Reviewer ──► 指摘数 = 1
    │
    ▼
Spec QD nhìn: quy mô 100 ↔ 指摘 1
    │
    ├─ Review đáng tin? → KHÔNG
    └─ Hành động: YÊU CẦU VERIFY SPEC
         (không tự review thay Spec Reviewer)
```

### QD được phép kết luận gì?

| Được | Không được (trừ khi QD kiêm Reviewer) |
|---|---|
| Review đã hoàn thành chưa? | SPEC field X thiếu validation |
| 指摘数 có hợp lý so với quy mô không? | Design spacing sai 4px |
| Critical/High còn mở không? | Tự viết lại danh sách 指摘 nội dung |
| Cho đi tiếp hay bắt verify lại? | “Tôi đã review hộ nên không cần Reviewer” |

---

## 2. Output QD cần có (để đánh giá được)

Mỗi lần QD đánh giá 1 giai đoạn, ticket/phiếu phải có:

| # | Output | Ví dụ SPEC |
|---|---|---|
| 1 | Link artifact | Link SPEC |
| 2 | **Quy mô đã review** | 100 màn hình |
| 3 | Reviewer + ngày + link record | Nguyễn V. / 2026-07-10 / link |
| 4 | **指摘数** tổng | 1 |
| 5 | Phân mức (C/H/M/L) — mở / đã đóng | C0 H0 M1 L0 |
| 6 | Đánh giá của QD về review | Kém — quá mỏng so với quy mô |
| 7 | **Quyết định QD** | Yêu cầu verify SPEC |
| 8 | 担当 + hạn (nếu verify / đối ứng) | BrSE — hạn 7/18 |

### Quyết định QD (3 trạng thái — đề xuất)

| Trạng thái | Khi nào (theo tinh thần ví dụ PM) |
|---|---|
| **PASS** | Review xong; tín hiệu hợp lý so với quy mô; Critical/High mở = 0 |
| **REWORK 指摘** | Review có vẻ đủ chiều sâu, nhưng còn Critical/High mở → 担当/Reviewer đóng 指摘 |
| **VERIFY LẠI** | Tín hiệu review quá mỏng / không đáng tin (vd. 100 màn / 1 指摘) → bắt review lại artifact |

---

## 3. Checklist QD ngắn — 3 giai đoạn

*(Giữ cùng logic: thu thập quy mô + 指摘数 → kết luận PASS / REWORK / VERIFY.)*

### 3.1 要件・計画

| Output QD | Ghi chú |
|---|---|
| Link 要件 + 計画 | |
| Quy mô (số chức năng / mục In-scope) | |
| Record review + 指摘数 + mức | |
| Critical/High mở = 0 | |
| Kết luận QD: PASS / REWORK / VERIFY | |

### 3.2 設計 SPEC

| Output QD | Ghi chú |
|---|---|
| Link SPEC (+ AC) | |
| Quy mô = **số màn** (và/hoặc chức năng) | Bắt buộc — dùng để so với 指摘数 |
| Record Spec Review + 指摘数 + mức | |
| Critical/High mở = 0 | |
| Kết luận QD: PASS / REWORK / VERIFY | vd. 100 màn / 1 指摘 → VERIFY |

### 3.3 デザイン

| Output QD | Ghi chú |
|---|---|
| Link Figma Final/Approved | |
| Quy mô = số màn / frame đã review | |
| Record Design Review + 指摘数 + mức | |
| Critical/High mở = 0 | |
| Kết luận QD: PASS / REWORK / VERIFY | Cùng logic “quá mỏng → VERIFY” |

---

## 4. Cần xác nhận lại với PM (các điểm còn 曖昧)

Những chỗ ví dụ PM **chưa đủ để chốt quy tắc số** — nên hỏi PM trước khi khóa output/automation.

### A. Ngưỡng “review kém” — quan trọng nhất

| # | Câu hỏi cho PM | Vì sao cần |
|---|---|---|
| A1 | **Công thức / ngưỡng** thế nào để nói 指摘数 “quá thấp”? (vd. &lt; 1 指摘 / 10 màn? hay &lt; 5% số màn?) | Không có ngưỡng thì mỗi QD đánh giá khác nhau |
| A2 | Có bảng theo **quy mô** không? (1–10 màn / 11–50 / 51–100+) | 5 màn / 1 指摘 khác 100 màn / 1 指摘 |
| A3 | **0 指摘** với quy mô lớn: luôn VERIFY, hay cho PASS nếu Reviewer ghi “confirmed clean”? | Tránh bắt verify oan hoặc bỏ sót |
| A4 | Chỉ nhìn **tổng 指摘数**, hay bắt buộc nhìn thêm **Critical/High**? | 1 Critical ≠ 1 Low |

### B. “Verify SPEC” nghĩa là gì Exact?

| # | Câu hỏi cho PM | Vì sao cần |
|---|---|---|
| B1 | Verify = **cùng Reviewer review lại**, hay **Reviewer khác** (second review)? | Ảnh hưởng người 担当 và lịch |
| B2 | Verify lại **toàn bộ** 100 màn, hay **mẫu** (spot-check X%)? | Công sức và SLA |
| B3 | Sau verify, QD nhận output gì để PASS? (指摘数 mới + record mới?) | Chốt “đóng vòng” |
| B4 | Ai có quyền **override** (chấp nhận 100 màn / 1 指摘 nếu có lý do)? Dir? PM? | Tránh kẹt quy trình |

### C. Phạm vi đếm “100 màn”

| # | Câu hỏi cho PM | Vì sao cần |
|---|---|---|
| C1 | “Màn hình” đếm theo frame Figma, màn SPEC, hay ticket? | Quy mô phải cùng một đơn vị |
| C2 | Màn chỉ đọc / popup / trạng thái có tính riêng không? | Tránh đội hoặc thiếu quy mô |
| C3 | Review theo **đợt** (50/100 màn) thì QD đánh giá theo đợt hay cả phase? | Output Gate theo đợt hay cuối phase |

### D. Ranh giới QD khi “khả năng SPEC cũng có vấn đề”

| # | Câu hỏi cho PM | Vì sao cần |
|---|---|---|
| D1 | QD có được **mở SPEC đọc mẫu** để củng cố quyết định VERIFY không? (vd. spot-check 3–5 màn) | Nếu có → cần định nghĩa độ sâu tối đa của QD |
| D2 | Hay QD **chỉ** dựa trên số liệu (quy mô/指摘数), tuyệt đối không mở nội dung? | Hai hướng ra output khác nhau |
| D3 | Khi VERIFY: QD có tạo ticket/checklist bắt buộc cho Reviewer không, hay chỉ comment “verify lại”? | Output vận hành của QD |

### E. Áp dụng cho 要件・計画 và デザイン

| # | Câu hỏi cho PM | Vì sao cần |
|---|---|---|
| E1 | Cùng một rule “quy mô ↔ 指摘数” cho 要件 và Design? | Thống nhất Framework |
| E2 | Đơn vị quy mô của 要件 là gì? (số yêu cầu / epic / use case?) | Tương đương “số màn” bên SPEC |
| E3 | Design Reviewer bắt buộc là ai? (Dir+Dev / Design lead / QC?) | QD biết record nào hợp lệ |

### F. Quan hệ với điểm A–D / QQS (nếu có)

| # | Câu hỏi cho PM | Vì sao cần |
|---|---|---|
| F1 | Kết luận VERIFY/PASS của QD có **map sang điểm** giai đoạn không, hay tách riêng Gate? | Tránh lẫn Gate và Score |
| F2 | 指摘数 thấp bất thường có tính là tín hiệu **trừ điểm Review** trong QQS không? | Liên kết dashboard |

---

## 5. Gói câu hỏi ưu tiên gửi PM (ngắn)

Nên hỏi trước **4 câu** này — đủ để chốt output QD vòng 1:

1. **Ngưỡng nào** = “指摘数 quá thấp so với quy mô” (công thức hoặc bảng theo số màn)?  
2. **Verify** = review lại toàn bộ hay mẫu? Cùng reviewer hay người khác?  
3. QD **chỉ nhìn số**, hay được **spot-check nội dung** tối đa bao nhiêu?  
4. Sau verify, output nào để QD cho **PASS**? Ai được **override**?

---

## 6. Phiếu QD tạm dùng (trước khi PM chốt ngưỡng)

```
【Spec QD】
Quy mô đã review: ___ màn
Reviewer: ___ | ngày: ___ | link: ___
指摘数: ___ (C__/H__/M__/L__)
Còn mở: C__/H__

Đánh giá review:
  ☐ Đáng tin so với quy mô
  ☐ Quá mỏng so với quy mô (vd. kiểu 100 màn / 1 指摘)
  ☐ Chưa đủ dữ liệu (thiếu quy mô hoặc 指摘数)

Quyết định:
  ☐ PASS — đi tiếp
  ☐ REWORK — đóng Critical/High
  ☐ VERIFY LẠI SPEC — 担当 ___ hạn ___

Ghi chú (bắt buộc nếu VERIFY): vì sao không tin kết quả review
___
```

> Phần ngưỡng số: ghi **“theo rule PM — đang chờ chốt”** cho đến khi PM trả lời mục A/B ở trên.
