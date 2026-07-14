# QD Framework — QD focus gì? Output base theo gì?

**Phạm vi:** `要件・計画` → `設計 SPEC` → `デザイン`

---

## 1. QD focus vào điều gì?

### Câu chốt

| | Focus |
|---|---|
| **Reviewer** | **Nội dung đúng/sai** — SPEC sai chỗ nào, thiếu logic chỗ nào, message lỗi đúng chưa |
| **QD** | **Độ tin cậy của review** + **độ phủ cấu trúc** — đã review đủ tầm chưa? các hạng mục bắt buộc đã được cover chưa? |

QD **không** trả lời: *“Màn A thiếu validation field X.”*  
QD **trả lời:** *“Kết quả review chưa đủ tin / độ phủ chưa đủ → chưa cho đi tiếp, phải verify.”*

### 2 trục QD dùng để đánh giá

| Trục | Câu hỏi của QD | Ví dụ |
|---|---|---|
| **A. Độ tin cậy review** | Quy mô ↔ 指摘数 có hợp lý không? | 100 màn / 1 指摘 → review mỏng → VERIFY |
| **B. Độ phủ cấu trúc** | Các hạng mục bắt buộc đã có / đã được review chưa? | Có 画面遷移? Có error message? Có nhánh logic? |

```
Reviewer: đúng / sai nội dung  →  指摘数
                │
                ▼
QD:
  (A) review có đáng tin không?     (quy mô ↔ 指摘数)
  (B) đã cover đủ hạng mục chưa?   (checklist độ phủ)
                │
                ▼
         PASS / REWORK / VERIFY
```

---

## 2. Output QD base theo gì?

**Base theo định nghĩa chung về độ phủ (coverage) — không base theo đúng/sai chi tiết.**

Đúng như hướng bạn nghĩ:

- Có **luồng màn hình** chưa?  
- Có cover **logic / nhánh** chưa?  
- Có định nghĩa **error message** chưa?  
- … các hạng mục cấu trúc bắt buộc tương tự

| Loại tiêu chí | Ai dùng | Ví dụ |
|---|---|---|
| **Độ phủ / có–không** | **QD** | Có mục 画面遷移? Có mục error? Reviewer đã tick cover logic? |
| **Đúng–sai nội dung** | **Reviewer** | Logic màn A sai; message lỗi field B chưa đúng copy |

### Quy tắc viết tiêu chí cho QD

Chỉ đưa vào output QD nếu trả lời được bằng **Có / Không / Số** trong thời gian ngắn, **không cần** hiểu sâu nghiệp vụ từng màn.

| Được (QD) | Không đưa cho QD (để Reviewer) |
|---|---|
| Có mục/luồng 画面遷移 trong SPEC? | Luồng màn A→B điều kiện đúng nghiệp vụ chưa? |
| Có mục error message / validation? | Message field Email wording đúng chưa? |
| Có bảng nhánh / trạng thái? | Nhánh role Admin xử lý đúng chưa? |
| Reviewer đã confirm cover các mục trên? | Tự tìm thêm 指摘 nội dung |
| 指摘数 so với số màn có bất thường? | — |

---

## 3. Bộ hạng mục độ phủ đề xuất (để QD check)

> Đây là **định nghĩa chung** — QD chỉ hỏi “có / đã cover chưa”, không chấm đúng sai.

### 3.1 設計 SPEC — hạng mục độ phủ (QD)

| # | Hạng mục độ phủ | QD check (Có/Không) |
|---|---|---|
| S1 | **画面一覧 / danh sách màn** trong scope | Có list màn + số lượng (quy mô) |
| S2 | **画面遷移** (luồng màn hình) | Có sơ đồ hoặc mô tả chuyển màn |
| S3 | **Logic / nhánh xử lý** (điều kiện, trạng thái, role…) | Có mục/bảng nhánh — không bị bỏ trống hạng mục |
| S4 | **Error / validation / message** | Có định nghĩa trường hợp lỗi / message |
| S5 | **AC (tiêu chí nghiệm thu)** | Có AC gắn màn/chức năng |
| S6 | **Record review + 指摘数** | Reviewer đã xong; có số 指摘 theo mức |
| S7 | **Tín hiệu độ tin cậy** | Quy mô ↔ 指摘数 không quá mỏng |

**QD PASS khi:** S1–S6 = Có, Critical/High mở = 0, và S7 không bị cờ “quá mỏng”.  
**VERIFY khi:** thiếu hạng mục độ phủ **hoặc** 100 màn / 1 指摘 (review không đáng tin).

### 3.2 要件・計画 — hạng mục độ phủ (QD)

| # | Hạng mục độ phủ | QD check |
|---|---|---|
| R1 | In / Out scope | Có tách rõ |
| R2 | Mục tiêu / actor (ai dùng, để làm gì) | Có |
| R3 | Luồng nghiệp vụ chính (hoặc use case) | Có |
| R4 | Milestone + ngày (計画) | Có |
| R5 | Record review + 指摘数 | Có |
| R6 | Quy mô ↔ 指摘数 | Không quá mỏng |

### 3.3 デザイン — hạng mục độ phủ (QD)

| # | Hạng mục độ phủ | QD check |
|---|---|---|
| D1 | Figma Final + danh sách màn/frame (quy mô) | Có |
| D2 | Happy path đủ màn In-scope | Có |
| D3 | State Error | Có hoặc N/A + lý do |
| D4 | State Empty | Có hoặc N/A + lý do |
| D5 | Mapping frame ↔ SPEC | Có |
| D6 | Record review + 指摘数 | Có |
| D7 | Quy mô ↔ 指摘数 | Không quá mỏng |

---

## 4. Quan hệ với ví dụ PM (100 màn / 1 指摘)

Hai lý do QD bắt VERIFY — cùng lúc hoặc một trong hai:

| Lý do | Base | Ví dụ |
|---|---|---|
| Review mỏng | Trục A — độ tin cậy | 100 màn / 1 指摘 |
| Thiếu độ phủ | Trục B — cấu trúc | SPEC không có 画面遷移 / không có error message |

Cả hai đều **không** yêu cầu QD chỉ ra “màn số 37 sai logic”.

---

## 5. Output ghi nhận của QD (mỗi lần đánh giá)

```
【Giai đoạn】 設計 SPEC
【Quy mô】 100 màn
【Độ phủ cấu trúc】
  S1 画面一覧: Có/Không
  S2 画面遷移: Có/Không
  S3 Logic/nhánh: Có/Không
  S4 Error/validation/message: Có/Không
  S5 AC: Có/Không
【Review】
  Reviewer: ___ | 指摘数: ___ (C/H/M/L)
  Độ tin cậy: Đáng tin / Quá mỏng
【Quyết định】 PASS / REWORK / VERIFY
【Lý do ngắn】 ...
```

---

## 6. Cần chốt với PM (để khóa danh sách độ phủ)

Hướng bạn đề xuất (luồng màn, logic, error message…) **đúng lớp QD** nếu giữ ở mức Có/Không.

Nên hỏi PM:

1. Danh sách hạng mục độ phủ SPEC **bắt buộc** có phải là: 画面遷移 · logic/nhánh · error message · AC? Còn thiếu mục nào (quyền, API, empty state…)?  
2. QD chỉ check **“có mục trong SPEC”**, hay bắt buộc Reviewer **tick đã review từng hạng mục**?  
3. Thiếu 1 hạng mục độ phủ = luôn VERIFY, hay cho PASS có điều kiện?  
4. Ngưỡng “quá mỏng” (100 màn / 1 指摘) chốt số thế nào?

---

## 7. 3 câu nhớ

1. QD **không focus nội dung đúng/sai** — focus **độ tin cậy review** + **độ phủ cấu trúc**.  
2. Output QD **base theo định nghĩa chung** (có luồng màn, có logic/nhánh, có error message…) ở mức **Có/Không**.  
3. Đúng/sai chi tiết từng màn = **Reviewer** + 指摘数.
