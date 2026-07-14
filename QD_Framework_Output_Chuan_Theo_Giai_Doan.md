# QD Framework — Output đánh giá cho QD

**Phạm vi:** `要件・計画` → `設計 SPEC` → `デザイン`

---

## 1. Phân vai (theo định nghĩa PM)

| Role | Việc |
|---|---|
| **Reviewer** | Review **nội dung**, đưa ra **指摘数** (và danh sách 指摘) |
| **QD** | **Xác nhận kết quả review** — nhìn quy mô + 指摘数 + mức độ nghiêm trọng để đánh giá review (và khả năng chất lượng artifact) có ổn không |

### Ví dụ (SPEC) — cách hiểu đúng

- Spec có **100 màn hình**, Reviewer chỉ ra **指摘数 = 1**  
- → QD đánh giá: **chất lượng review kém** (quá ít so với quy mô)  
- → QD **không tự review 100 màn**, mà **yêu cầu verify lại SPEC** (vì khả năng SPEC cũng có vấn đề chưa bị bắt)

```
Reviewer: soi nội dung → ra 指摘数
                │
                ▼
QD: nhìn (quy mô + 指摘数 + mức độ) → OK đi tiếp / Yêu cầu verify lại
```

---

## 2. Output QD cần thu thập (mọi giai đoạn)

Trước khi kết luận, QD phải có đủ các số / bằng chứng sau:

| # | Hạng mục | Ý nghĩa |
|---|---|---|
| 1 | **Quy mô** | Làm bao nhiêu đơn vị? (màn / chức năng / trang Figma / mục 要件…) |
| 2 | **Review đã xong** | Ai review, ngày xong, link record |
| 3 | **指摘数** | Tổng số 指摘 Reviewer đưa ra |
| 4 | **Phân mức 指摘** | Critical / High / Medium / Low (còn mở & đã đóng nếu có) |
| 5 | **Kết luận QD** | Đi tiếp / Yêu cầu verify lại + lý do ngắn |

---

## 3. Cách QD kết luận (dễ đánh giá)

QD chọn **1 trong 2**:

| Kết luận | Khi nào |
|---|---|
| **ĐỦ — đi tiếp** | Review đã xong + tín hiệu review hợp lý so với quy mô + Critical/High còn mở = 0 |
| **CHƯA ĐỦ — yêu cầu verify lại** | Chưa có kết quả review, **hoặc** tín hiệu review bất thường (quá mỏng so với quy mô), **hoặc** Critical/High còn mở > 0 |

### Tín hiệu “review quá mỏng” (áp dụng chung)

Dùng khi đã có quy mô và 指摘数:

| Tín hiệu | Ví dụ | Việc QD làm |
|---|---|---|
| 指摘数 quá thấp so với quy mô lớn | 100 màn / 1 指摘 | **Yêu cầu verify lại** |
| Không có 指摘 nào ở quy mô vừa/lớn mà không có giải thích | 30+ đơn vị / 0 指摘 / không note “đã confirm sạch” | **Yêu cầu verify lại** hoặc bắt Reviewer giải thích bằng văn bản |
| Chỉ có Low rất ít, không có ghi chú phạm vi đã cover | Quy mô lớn nhưng cover không rõ | **Yêu cầu verify lại** hoặc bổ sung bằng chứng cover |

> Ngưỡng số cụ thể (vd. “dưới X 指摘 / 100 màn = mỏng”) team có thể chốt sau.  
> **Nguyên tắc đã chắc:** QD nhìn **tỷ lệ quy mô ↔ 指摘数**, không thay Reviewer soi nội dung.

---

## 4. Output đánh giá QD từng giai đoạn

---

### 4.1 要件・計画

| | |
|---|---|
| **Reviewer** | Review nội dung 要件・計画 → đưa 指摘数 |
| **QD** | Xác nhận kết quả review 要件・計画 |
| **担当 khi phải verify lại** | Dir / PM |

#### Output QD cần có

| # | Output | ĐỦ khi |
|---|---|---|
| 1 | Link 要件定義書 + PJ計画書 | Mở được |
| 2 | **Quy mô** | Ghi rõ: số epic/chức năng/mục In-scope (hoặc tương đương) |
| 3 | Record review đã xong | Ai review + ngày + link |
| 4 | **指摘数** (+ phân mức) | Có số liệu từ Reviewer |
| 5 | Critical / High còn mở | **= 0** |
| 6 | Kết luận QD về chất lượng review | “Hợp lý so với quy mô” **hoặc** “Quá mỏng → verify lại” |

#### QD kết luận thế nào

- Có đủ output 1–5, và 指摘数 không bất thường so với quy mô → **ĐỦ**  
- 指摘数 quá mỏng so với quy mô (không giải thích được) → **Yêu cầu verify lại 要件・計画**  
- Critical/High còn mở → **CHƯA ĐỦ** (đối ứng hết rồi mới xét tiếp)

---

### 4.2 設計 SPEC  ← đúng ví dụ PM

| | |
|---|---|
| **Spec Reviewer** | Review nội dung SPEC → đưa **指摘数** |
| **Spec QD** | Xác nhận kết quả review SPEC |
| **担当 khi phải verify lại** | BrSE / Dir (+ Spec Reviewer làm lại) |

#### Output QD cần có

| # | Output | ĐỦ khi |
|---|---|---|
| 1 | Link SPEC (+ AC nếu tách file) | Mở được |
| 2 | **Quy mô** | Số **màn hình** (và/hoặc số chức năng) trong scope review — *vd. 100 màn* |
| 3 | Record Spec Review đã xong | Ai review + ngày + link |
| 4 | **指摘数** (+ phân mức Critical/High/Medium/Low) | Có số từ Spec Reviewer — *vd. 1* |
| 5 | Critical / High còn mở | **= 0** |
| 6 | Kết luận QD | Đi tiếp **hoặc** yêu cầu verify SPEC |

#### Ví dụ áp dụng

| Quy mô | 指摘数 | QD đánh giá | Hành động |
|---|---|---|---|
| 100 màn | 1 | Review kém; SPEC có thể còn vấn đề | **Yêu cầu verify lại SPEC** |
| 100 màn | Nhiều 指摘, đã đóng hết High+, có record | Review có chiều sâu | Có thể **ĐỦ** (nếu đủ output khác) |
| 5 màn | 1 | Có thể hợp lý | Xem thêm phân mức + giải thích cover |

#### Câu QD ghi vào ticket (mẫu)

```
【Spec QD】
Quy mô: 100 màn
指摘数: 1 (C0/H0/M1/L0)
Đánh giá review: Kém (quá mỏng so với quy mô)
Kết luận: Yêu cầu verify lại SPEC
Lý do: 100 màn chỉ 1 指摘 → chất lượng review không đáng tin; cần review lại trước khi sang デザイン/開発
```

---

### 4.3 デザイン

| | |
|---|---|
| **Design Reviewer** | Review nội dung Figma → đưa 指摘数 |
| **Design QD** | Xác nhận kết quả review Design |
| **担当 khi phải verify lại** | Designer |

#### Output QD cần có

| # | Output | ĐỦ khi |
|---|---|---|
| 1 | Link Figma Final / Approved | Mở được; có dấu Final/Approved |
| 2 | **Quy mô** | Số màn / frame trong scope review |
| 3 | Record Design Review đã xong | Ai review + ngày + link (Dir/Dev hoặc reviewer chỉ định) |
| 4 | **指摘数** (+ phân mức) | Có số từ Design Reviewer |
| 5 | Critical / High còn mở | **= 0** |
| 6 | Kết luận QD | Đi tiếp **hoặc** yêu cầu verify Design |

#### Tín hiệu giống SPEC

- Nhiều màn / frame nhưng 指摘数 ≈ 0~1 và không giải thích → QD **yêu cầu verify lại Design**  
- Không phải QD tự soi từng frame như Design Reviewer

---

## 5. Bảng tra nhanh

| Giai đoạn | Reviewer làm | QD cần thấy | QD bất thường thì |
|---|---|---|---|
| 要件・計画 | Review 要件・計画 → 指摘数 | Quy mô + record review + 指摘数 + High=0 | Yêu cầu verify 要件・計画 |
| 設計 SPEC | Review SPEC → 指摘数 | Số màn + record review + 指摘数 + High=0 | Yêu cầu verify SPEC |
| デザイン | Review Figma → 指摘数 | Số frame/màn + record review + 指摘数 + High=0 | Yêu cầu verify Design |

---

## 6. Phiếu QD (copy ticket)

```
【Giai đoạn】 要件・計画 / 設計 SPEC / デザイン
【Reviewer】 ____
【QD】 ____ / ngày ____

Quy mô (đơn vị + số): ____
Review xong: link ____ | ngày ____
指摘数 tổng: __
  Critical: __ (còn mở __)
  High: __ (còn mở __)
  Medium: __ | Low: __

Đánh giá chất lượng review:
  ☐ Hợp lý so với quy mô
  ☐ Quá mỏng so với quy mô
  ☐ Khác: ____

Kết luận QD:
  ☐ ĐỦ — đi tiếp
  ☐ CHƯA ĐỦ — đối ứng 指摘 High/Critical
  ☐ YÊU CẦU VERIFY LẠI — giao 担当 ____ hạn ____
```

---

## 7. 2 câu nhớ

1. **Reviewer** ra 指摘数; **QD** xác nhận kết quả review có đáng tin so với quy mô không.  
2. Quy mô lớn mà 指摘数 quá thấp (vd. 100 màn / 1 指摘) → QD **yêu cầu verify lại**, không tự thay Reviewer soi nội dung.
