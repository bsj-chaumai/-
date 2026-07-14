# QD Framework — Bộ output chuẩn 2 lớp (QD / Reviewer)

## 1. Vấn đề cần giải quyết

Muốn đánh giá **chính xác** → output phải **cụ thể**.  
Nhưng nếu QD dùng checklist quá chi tiết → QD đang làm việc của **reviewer**.

**Cách xử lý:** mỗi giai đoạn có **2 lớp output chuẩn**.

| Lớp | Dành cho | Độ sâu | Câu hỏi |
|---|---|---|---|
| **Lớp A — Chuẩn cổng (QD)** | Người đánh giá giai đoạn đạt chuẩn chưa | Nông, đếm được, nhìn bằng chứng | *Có đủ chưa? Đúng người xác nhận chưa? 指摘 vượt chưa?* |
| **Lớp B — Chuẩn nội dung (Reviewer)** | Người review chuyên môn | Sâu, chi tiết chất lượng | *Nội dung đúng / đủ / dùng được chưa?* |

```
担当 tạo output
      │
      ▼
Reviewer dùng LỚP B  →  review nội dung, ghi 指摘, approve
      │
      ▼
QD dùng LỚP A        →  ĐỦ / CHƯA ĐỦ  →  (khi ĐỦ) xếp A–D
      │
      └─ Nếu QD kiêm reviewer → dùng cả A + B
```

---

## 2. Nguyên tắc thiết kế bộ output

### Lớp A (QD) — chỉ gồm thứ trả lời Yes/No hoặc đếm được

Được đưa vào Lớp A khi thỏa **cả 3**:
1. Nhìn **link / trạng thái / số** là biết ngay  
2. **Không cần** hiểu sâu nghiệp vụ màn hình  
3. Sai thì **chặn được** giai đoạn (rủi ro vận hành rõ)

Ví dụ hợp lệ cho QD: “Có SPEC link không?”, “Dev+QC đã approve chưa?”, “High còn mở = mấy?”

### Lớp B (Reviewer) — chi tiết chất lượng nội dung

Được đưa vào Lớp B khi:
1. Phải **đọc / soi** nội dung mới kết luận  
2. Cần kiến thức chuyên môn (SPEC, UI, code, test)  
3. Kết quả thường là **指摘 cụ thể** để 担当 sửa

Ví dụ của reviewer: “Validation field X thiếu”, “Thiếu nhánh quyền admin”, “Case regression API Y chưa có”.

### Quy tắc tách nhanh

| Nếu câu hỏi là… | Đưa vào |
|---|---|
| Có / không có artifact? | **Lớp A (QD)** |
| Ai đã ký / approve? | **Lớp A (QD)** |
| Số 指摘 / % chạy test / version? | **Lớp A (QD)** |
| Nội dung đúng chưa? đủ nhánh chưa? | **Lớp B (Reviewer)** |
| Design đẹp / logic nghiệp vụ đúng? | **Lớp B (Reviewer)** |
| Code có bug tinh / edge case? | **Lớp B (Reviewer)** |

---

## 3. Hai vòng đánh giá (gắn với 2 lớp)

| Vòng | Ai | Dùng lớp nào | Kết quả |
|---|---|---|---|
| **Vòng 1** | QD | **Lớp A** (+ kết quả đã có từ Lớp B: số 指摘, approve) | **ĐỦ** / **CHƯA ĐỦ** |
| **Vòng 2** | QD | **Lớp A** làm xương sống; có thể spot-check vài mục Lớp B nếu rủi ro cao | **A / B / C / D** *(công thức điểm 未確定)* |
| Review nội dung | Reviewer (hoặc QD nếu kiêm) | **Lớp B** | Approve / 指摘 list |

**CHƯA ĐỦ (Vòng 1)** → QD gọi **担当** đối ứng theo mục Lớp A bị thiếu (hoặc 指摘 Lớp B còn vượt ngưỡng).  
QD **không** tự sửa nội dung thay reviewer.

### Ngưỡng 指摘 (sau khi Reviewer xong Lớp B)

| Mức | Còn mở tối đa để QD cho ĐỦ |
|---|---|
| Critical / Blocker | **0** |
| High | **0** |
| Medium / Low | Cho phép tạm nếu có owner + hạn |

---

## 4. Bộ output chuẩn từng giai đoạn (A + B)

---

### 4.1 要件定義・PJ計画書

**担当:** Dir / PM  
**Reviewer nội dung gợi ý:** Dir + stakeholder/khách *(QD chỉ vào Lớp B nếu được giao)*

#### Lớp A — Chuẩn QD (đủ cổng chưa?)

| # | Output / điều kiện | QD check thế nào |
|---|---|---|
| A1 | 要件定義書 | Có link |
| A2 | PJ計画書 | Có link; có milestone + ngày |
| A3 | Ticket / WBS | Có trên Backlog |
| A4 | Approve khách | Có ngày + tên + link xác nhận |
| A5 | 指摘 Critical/High | = 0 |

→ **ĐỦ** chỉ khi A1–A5 đều OK.  
→ **CHƯA ĐỦ** → trả **Dir/PM**.

#### Lớp B — Chuẩn Reviewer (nội dung)

| # | Điểm review chi tiết |
|---|---|
| B1 | In / Out scope tách rõ, không mơ hồ |
| B2 | Actor và mục tiêu nghiệp vụ rõ |
| B3 | Giả định / ràng buộc / Open Question đã xử lý hoặc có owner+deadline |
| B4 | Milestone khả thi, có owner từng mốc |
| B5 | Rủi ro chính đã ghi (hoặc xác nhận “không có”) |

---

### 4.2 設計（SPEC / 設計書）

**担当:** BrSE / Dir  
**Reviewer gợi ý:** Dev + QC

#### Lớp A — Chuẩn QD

| # | Output / điều kiện | QD check |
|---|---|---|
| A1 | SPEC (link) | Có |
| A2 | AC (link hoặc trong ticket) | Có |
| A3 | Bảng nhánh / trạng thái | Có |
| A4 | Record review Dev + QC | Có approve/comment của cả hai |
| A5 | Critical/High sau review | = 0 |
| A6 | Version SPEC | Có đánh version / ngày khóa |

#### Lớp B — Chuẩn Reviewer

| # | Điểm review chi tiết |
|---|---|
| B1 | Field: tên, type, required, default, validation |
| B2 | Message lỗi / empty / quyền hiển thị |
| B3 | Flow chuyển màn / điều kiện |
| B4 | Nhánh theo role / status / lỗi |
| B5 | AC viết được test case (Given–When–Then hoặc checklist rõ) |
| B6 | Không còn TBD ở logic chính |

---

### 4.3 デザイン

**担当:** Designer  
**Reviewer gợi ý:** Dir + Dev

#### Lớp A — Chuẩn QD

| # | Output / điều kiện | QD check |
|---|---|---|
| A1 | Figma Final / Approved | Có link; đánh dấu Final |
| A2 | State tối thiểu | Có frame Error + Empty (hoặc note N/A có lý do) |
| A3 | Handoff gắn SPEC | Có link/mapping frame ↔ SPEC |
| A4 | Approve Dir + Dev | Có xác nhận cả hai |
| A5 | Critical/High | = 0 |

#### Lớp B — Chuẩn Reviewer

| # | Điểm review chi tiết |
|---|---|
| B1 | Khớp logic/copy với SPEC |
| B2 | Đủ state cần thiết (Disabled/Loading… nếu có) |
| B3 | Component / spacing / text nhất quán |
| B4 | Responsive / device đúng scope |
| B5 | Dev implement được mà không phải hỏi lại chỗ chính |

---

### 4.4 開発

**担当:** Dev  
**Reviewer:** Dev khác (PR review) — QD **không thay** code review

#### Lớp A — Chuẩn QD

| # | Output / điều kiện | QD check |
|---|---|---|
| A1 | PR gắn ticket | Có |
| A2 | Code review approve | ≥ 1 approve từ người khác |
| A3 | 影響範囲メモ | Có trong PR/ticket |
| A4 | Build / version trên env test | Có commit hoặc version |
| A5 | Critical/High trên PR/bug | = 0 |

→ A đủ = **Ready for QA**.

#### Lớp B — Chuẩn Reviewer (code review)

| # | Điểm review chi tiết |
|---|---|
| B1 | Đúng SPEC / Design; lệch thì có CR |
| B2 | Xử lý lỗi / edge case chính |
| B3 | Ảnh hưởng vùng liên quan đã xem |
| B4 | Không để debug/WIP lên nhánh chính |
| B5 | Self-check AC chính trước khi nhờ review |

---

### 4.5 検証

**担当:** QC  
**Reviewer nội dung:** QC (và peer review case nếu có); QD audit Lớp A

#### Lớp A — Chuẩn QD

| # | Output / điều kiện | QD check |
|---|---|---|
| A1 | テスト計画 | Có link |
| A2 | テスト仕様書 | Có link |
| A3 | Kết quả chạy test | Có % / Pass-Fail / version |
| A4 | Bug tickets | Có; đếm được theo severity |
| A5 | 品質サマリー + Go/No-Go | Có |
| A6 | Critical/High còn mở | = 0 (hoặc có waiver đã duyệt) |
| A7 | % case In-scope đã chạy | = 100% (Blocked phải có lý do + owner) |

#### Lớp B — Chuẩn Reviewer / QC chuyên môn

| # | Điểm review chi tiết |
|---|---|
| B1 | Case map đủ AC |
| B2 | Có regression vùng ảnh hưởng |
| B3 | Có case lỗi / quyền / dữ liệu biên (theo scope) |
| B4 | Bug ghi đủ tái hiện, expected/actual |
| B5 | Go/No-Go khớp số liệu thật |

---

### 4.6 リリース

**担当:** Dir / Release owner  
**Reviewer/checklist kỹ thuật:** Dev + QC; QD audit Lớp A trước/sau deploy

#### Lớp A — Chuẩn QD

| # | Output / điều kiện | QD check |
|---|---|---|
| A1 | Go / No-Go | Có người duyệt + thời điểm + version |
| A2 | リリース手順書 | Có |
| A3 | Rollback計画 | Có |
| A4 | Smoke production result | Pass |
| A5 | Báo cáo hoàn tất | Có giờ xong + version + đã gửi |
| A6 | Critical/High sau release | = 0 (hoặc ETA đã thống nhất) |

**Thiếu A1/A2/A3 → QD không cho deploy.**

#### Lớp B — Chuẩn Reviewer / thực thi kỹ thuật

| # | Điểm review chi tiết |
|---|---|
| B1 | Thứ tự deploy đúng, đúng môi trường |
| B2 | Rollback thử được / đủ điều kiện kích hoạt |
| B3 | Smoke cover đúng luồng chính |
| B4 | Monitoring / theo dõi sau release có người trực |
| B5 | Known issues đã thống nhất với stakeholder |

---

## 5. QD kiêm reviewer thì sao?

| Tình huống | Dùng lớp nào |
|---|---|
| QD **chỉ** đánh giá đạt chuẩn | Chỉ **Lớp A** (+ nhìn số 指摘 / approve từ Lớp B) |
| QD **kiêm** reviewer giai đoạn đó | **Lớp A + Lớp B** (làm cả hai, nhưng ghi tách: phần cổng / phần nội dung) |
| Rủi ro cao, bằng chứng yếu | QD dùng Lớp A + **spot-check 1–3 mục Lớp B** (không review hết) |

Ghi kết quả tách dòng để không lẫn:

```
Vòng 1 (Lớp A): ĐỦ / CHƯA ĐỦ
Review nội dung (Lớp B): do ____ | Critical/High = __
Vòng 2 mức: A/B/C/D | công thức điểm: 未確定
```

---

## 6. Phiếu vận hành nhanh

```
【Giai đoạn】 ____
【担当】 ____
【Reviewer nội dung】 ____   【QD】 ____
【QD có kiêm review?】 Có / Không

■ Lớp A — QD
- A1…An: OK/NG (+ link)
- Critical/High còn mở: __
→ Vòng 1: ĐỦ / CHƯA ĐỦ
→ CHƯA ĐỦ: đã gửi 担当 ____ | hạn ____

■ Lớp B — Reviewer (hoặc QD nếu kiêm)
- Đã review: Có / Không
- 指摘 mở: C__/H__/M__/L__
- Approve: Có / Không

■ Vòng 2 (chỉ khi ĐỦ)
- Mức: A / B / C / D
- Lý do ngắn (bám bằng chứng Lớp A; nêu spot-check Lớp B nếu có):
```

---

## 7. Bảng tra nhanh 1 trang

| Giai đoạn | Lớp A — QD cần thấy | Lớp B — Reviewer soi | CHƯA ĐỦ → |
|---|---|---|---|
| 要件・計画 | 要件+計画+WBS+approve+High=0 | Scope rõ, milestone khả thi, hết Blocker Q | Dir/PM |
| 設計 SPEC | SPEC+AC+nhánh+review record+version+High=0 | Field/validation/nhánh/AC testable | BrSE/Dir |
| デザイン | Figma Final+state+handoff+approve+High=0 | Khớp SPEC, đủ state, nhất quán | Designer |
| 開発 | PR+approve+影響範囲+build+High=0 | Đúng SPEC, edge case, không WIP | Dev |
| 検証 | Kế hoạch+case+kết quả+bug+Go/No-Go+100% chạy+High=0 | Cover AC/regression, bug rõ, kết luận đúng số | QC |
| リリース | Go+手順+Rollback+smoke+báo cáo+High=0 | Deploy đúng, rollback khả thi, theo dõi sau | Dir |

---

## 8. 3 câu chốt

1. **Muốn cụ thể mà không biến QD thành reviewer** → tách **Lớp A (cổng)** và **Lớp B (nội dung)**.  
2. **QD mặc định chỉ cầm Lớp A**; Lớp B là việc Reviewer (QD chỉ cầm thêm khi kiêm role hoặc spot-check).  
3. **Đạt chuẩn giai đoạn** = Lớp A ĐỦ + 指摘 Lớp B trong ngưỡng; sau đó mới xếp A–D *(điểm chi tiết 未確定)*.
