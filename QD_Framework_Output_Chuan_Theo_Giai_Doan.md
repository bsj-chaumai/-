# QD Framework — Output đánh giá chuẩn theo giai đoạn

## 1. Bức tranh tổng quát

Mỗi giai đoạn dự án đều đi qua **2 vòng đánh giá**:

```
Giai đoạn (要件 → 設計 → デザイン → 開発 → 検証 → リリース)
        │
        ▼
 ┌─────────────────────────────┐
 │ VÒNG 1: Đủ điều kiện chưa?  │  ← check mục bắt buộc + số 指摘
 └─────────────┬───────────────┘
               │
      ┌────────┴────────┐
      ▼                 ▼
   CHƯA ĐỦ            ĐỦ
      │                 │
      ▼                 ▼
 Liên hệ 担当      VÒNG 2: Chấm điểm sâu
 đối ứng lại       (xếp mức theo QD Framework)
 rồi đánh giá        │
 Vòng 1 lại          ▼
                 Ghi kết quả → sang giai đoạn sau
```

| Vòng | Câu hỏi chính | Kết quả |
|---|---|---|
| **Vòng 1** | Đã đủ điều kiện để review chưa? | **ĐỦ** / **CHƯA ĐỦ** |
| **Vòng 2** | Nội dung đạt mức nào? | **A / B / C / D** *(cách tính điểm: 未確定 — chỉ định nghĩa trục đánh giá)* |

**Lưu ý:** Vòng 2 chỉ làm khi Vòng 1 = **ĐỦ**.  
Thiếu mục bắt buộc hoặc 指摘 vượt ngưỡng → **không chấm điểm**, trả về 担当 xử lý.

---

## 2. Quy tắc dùng chung (đơn giản)

| Từ | Nghĩa |
|---|---|
| Output | File / ticket / link / số liệu cụ thể |
| 担当 | Người chịu trách nhiệm giai đoạn đó |
| 指摘 | Lỗi / thiếu sót phát hiện khi review |
| ĐỦ (Vòng 1) | Có đủ mục bắt buộc **và** 指摘 trong ngưỡng |
| CHƯA ĐỦ | Thiếu mục bắt buộc **hoặc** 指摘 vượt ngưỡng → liên hệ 担当 đối ứng |
| A/B/C/D | Mức chất lượng theo QD Framework (A cao nhất) |

**Không dùng khi đánh giá:** “ổn”, “cơ bản xong”, “tạm được”, “sẽ confirm sau” (không có owner + deadline).

---

## 3. Vòng 1 — Đánh giá tổng quan (đủ điều kiện chưa?)

### Cách làm (mọi giai đoạn)

1. Mở checklist mục bắt buộc của giai đoạn  
2. Tick từng mục: **có link cụ thể** = OK; thiếu = NG  
3. Đếm 指摘 còn mở theo mức  
4. Kết luận:
   - **ĐỦ** → sang Vòng 2  
   - **CHƯA ĐỦ** → ghi rõ mục thiếu / số 指摘 vượt → **liên hệ 担当 đối ứng** → làm lại Vòng 1

### Ngưỡng 指摘 mặc định (Vòng 1)

| Mức 指摘 | Ngưỡng cho phép còn mở |
|---|---|
| Critical / Blocker | **0** |
| High | **0** |
| Medium / Low | Cho phép tạm, nhưng phải có owner + hạn xử lý |

> Dự án có thể đổi ngưỡng Medium/Low, nhưng phải **ghi trước** khi bắt đầu đánh giá giai đoạn đó.

---

## 4. Vòng 2 — Chấm điểm sâu (chỉ khi Vòng 1 = ĐỦ)

### Mục đích
Xếp nội dung vào mức **A / B / C / D** theo QD Framework.

### Trạng thái tính điểm
**Cách tính điểm chi tiết (công thức / trọng số) hiện 未確定.**  
Tài liệu này chỉ chốt:
- **Chấm cái gì** (trục đánh giá)
- **Lấy bằng chứng ở đâu** (output)
- **Mức A–D nghĩa là gì** (định nghĩa định tính tạm thời để vận hành)

### Định nghĩa mức (dùng tạm đến khi có công thức chính thức)

| Mức | Ý nghĩa vận hành |
|---|---|
| **A** | Đủ, rõ, ít phải hỏi lại; gần như không có lỗ hổng chính |
| **B** | Dùng được; còn vài điểm nhỏ cần cải thiện |
| **C** | Dùng được có điều kiện; còn thiếu / mơ hồ ở chỗ quan trọng |
| **D** | Yếu; dễ gây hiểu nhầm, handoff khó, rủi ro cao |

### Cách ghi kết quả Vòng 2

```
Giai đoạn: ____
Vòng 1: ĐỦ
Mức (A/B/C/D): ____
Lý do ngắn (1–3 gạch đầu dòng, bám trục đánh giá):
- ...
Người đánh giá / ngày: ____
```

---

## 5. Output chuẩn từng giai đoạn

---

### 5.1 要件定義・PJ計画書

**担当:** Dir / PM  
**Mục tiêu giai đoạn:** Chốt làm gì, không làm gì, khi nào xong, ai làm.

#### Vòng 1 — Mục bắt buộc

| # | Mục bắt buộc | OK khi |
|---|---|---|
| 1 | 要件定義書 | Có In / Out scope, mục tiêu, ai dùng (actor) |
| 2 | PJ計画書 | Có milestone + ngày + người phụ trách |
| 3 | Ticket / WBS | Đã tách việc, có estimate sơ bộ |
| 4 | Approve của khách | Có ngày + tên người + link |

**Vòng 1 = ĐỦ khi:** đủ 4 mục trên + Critical/High 指摘 = 0.  
**CHƯA ĐỦ →** liên hệ Dir/PM bổ sung / sửa.

#### Vòng 2 — Trục chấm điểm *(công thức 未確定)*

| Trục | Hỏi gì | Bằng chứng |
|---|---|---|
| Rõ phạm vi | In/Out có tách rõ không? | 要件定義書 |
| Khả thi kế hoạch | Milestone có ngày thật, có owner không? | PJ計画書 |
| Sẵn sàng triển khai | Ticket có đủ để bắt đầu 設計 không? | WBS / Backlog |
| Đồng thuận | Khách đã chốt chưa? | Approve link |

---

### 5.2 設計（画面仕様書 SPEC / 設計書）

**担当:** BrSE / Dir  
**Mục tiêu giai đoạn:** Viết đủ để Dev code và QC test, không phải hỏi lại ý định.

#### Vòng 1 — Mục bắt buộc

| # | Mục bắt buộc | OK khi |
|---|---|---|
| 1 | 画面仕様書 (SPEC) | Có field, validation, lỗi, quyền, flow màn |
| 2 | AC (tiêu chí nghiệm thu) | Mỗi chức năng chính có checklist / Given–When–Then |
| 3 | Bảng trạng thái / nhánh | Các nhánh chính đã ghi |
| 4 | Review Dev + QC | Đã review; Critical/High = 0 |

**Vòng 1 = ĐỦ khi:** đủ 4 mục + Critical/High 指摘 = 0.  
**CHƯA ĐỦ →** liên hệ BrSE/Dir đối ứng.

#### Vòng 2 — Trục chấm điểm *(công thức 未確定)*

| Trục | Hỏi gì | Bằng chứng |
|---|---|---|
| Đủ để code | Dev có làm được mà không hỏi lại logic chính không? | SPEC |
| Đủ để test | QC có viết case từ AC được không? | AC |
| Bao phủ nhánh | Thiếu nhánh lỗi / quyền / trạng thái không? | Bảng nhánh |
| Ổn định bản | Đã khóa version; đổi sau khóa có CR không? | Version / CR ticket |

---

### 5.3 デザイン

**担当:** Designer  
**Mục tiêu giai đoạn:** Figma đúng SPEC, đủ trạng thái để Dev làm.

#### Vòng 1 — Mục bắt buộc

| # | Mục bắt buộc | OK khi |
|---|---|---|
| 1 | Figma Final | Đủ màn trong scope, đánh dấu Final / Approved |
| 2 | State cần thiết | Ít nhất: bình thường + Error + Empty |
| 3 | Handoff | Frame gắn với SPEC; text/copy chính thức |
| 4 | Approve Dir + Dev | Dir xác nhận đúng nghiệp vụ; Dev xác nhận làm được |

**Vòng 1 = ĐỦ khi:** đủ 4 mục + Critical/High 指摘 = 0.  
**CHƯA ĐỦ →** liên hệ Designer đối ứng.

#### Vòng 2 — Trục chấm điểm *(công thức 未確定)*

| Trục | Hỏi gì | Bằng chứng |
|---|---|---|
| Khớp SPEC | Design có lệch logic / thiếu màn không? | Figma ↔ SPEC |
| Đủ state | Thiếu Error / Empty / Disabled (nếu cần) không? | Figma states |
| Sẵn sàng handoff | Dev còn phải hỏi spacing/copy/state không? | Handoff note |
| Nhất quán | Component / text có thống nhất không? | Figma |

---

### 5.4 開発

**担当:** Dev Lead / Dev chính  
**Mục tiêu giai đoạn:** Code đúng SPEC/Design; bàn giao test được.

#### Vòng 1 — Mục bắt buộc

| # | Mục bắt buộc | OK khi |
|---|---|---|
| 1 | PR gắn ticket | Rõ PR đang làm ticket nào |
| 2 | Code review approve | ≥ 1 người khác approve; Critical/High comment = 0 |
| 3 | 影響範囲メモ | Ghi màn/API bị ảnh hưởng (hoặc “không có”) |
| 4 | Build trên môi trường test | Có version/commit; QC biết test ở đâu |

**Vòng 1 = ĐỦ khi:** đủ 4 mục + Critical/High 指摘 = 0.  
**CHƯA ĐỦ →** liên hệ Dev đối ứng.  
*(Ticket chỉ được coi Ready for QA khi Vòng 1 = ĐỦ.)*

#### Vòng 2 — Trục chấm điểm *(công thức 未確定)*

| Trục | Hỏi gì | Bằng chứng |
|---|---|---|
| Đúng scope | Có code ngoài SPEC không có CR không? | PR + SPEC |
| Chất lượng review | Review có bắt được vấn đề; còn nợ High không? | PR review |
| Ảnh hưởng | Đã nêu vùng ảnh hưởng chưa? | 影響範囲メモ |
| Sẵn sàng test | QC vào test được ngay không? | Build / env note |

---

### 5.5 検証

**担当:** QC  
**Mục tiêu giai đoạn:** Có số liệu chứng minh đủ / chưa đủ để release hoặc UAT.

#### Vòng 1 — Mục bắt buộc

| # | Mục bắt buộc | OK khi |
|---|---|---|
| 1 | テスト計画 | Có phạm vi, lịch, môi trường, tiêu chí Pass |
| 2 | テスト仕様書 | Case map theo AC + regression ảnh hưởng |
| 3 | Kết quả chạy test | Có % đã chạy, Pass/Fail, gắn version |
| 4 | Bug tickets | Có severity, bước tái hiện, expected/actual |
| 5 | 品質サマリー | Có số bug theo mức + kết luận Go / No-Go |

**Vòng 1 = ĐỦ khi:** đủ 5 mục + Critical/High còn mở = 0  
*(High muốn để lại: phải có waiver viết rõ + Dir/khách duyệt).*  
**CHƯA ĐỦ →** liên hệ QC (hoặc Dev nếu bug do code) đối ứng.

#### Vòng 2 — Trục chấm điểm *(công thức 未確定)*

| Trục | Hỏi gì | Bằng chứng |
|---|---|---|
| Bao phủ | Case có cover AC + vùng ảnh hưởng không? | テスト仕様書 |
| Thực thi | Đã chạy đủ case In-scope chưa? | Kết quả test |
| Bug đang mở | Còn rủi ro chính không? | Bug list |
| Kết luận | Go / No-Go có dựa trên số liệu không? | 品質サマリー |

---

### 5.6 リリース

**担当:** Dir / Release owner  
**Mục tiêu giai đoạn:** Lên production an toàn; có rollback; có xác nhận sau release.

#### Vòng 1 — Mục bắt buộc

| # | Mục bắt buộc | OK khi |
|---|---|---|
| 1 | Go / No-Go | Có người duyệt + thời điểm + version |
| 2 | リリース手順書 | Có từng bước deploy + ai làm |
| 3 | Rollback計画 | Có điều kiện và cách rollback |
| 4 | Smoke test production | Case tối thiểu sau deploy = Pass |
| 5 | Báo cáo hoàn tất | Có giờ xong + version thực tế + đã gửi stakeholder |

**Vòng 1 = ĐỦ khi:** đủ 5 mục + Critical/High sau release = 0 (hoặc đang xử lý có ETA đã thống nhất).  
**CHƯA ĐỦ →** liên hệ Dir / Release owner đối ứng.  
**Không deploy** nếu thiếu Go, 手順書, hoặc Rollback.

#### Vòng 2 — Trục chấm điểm *(công thức 未確定)*

| Trục | Hỏi gì | Bằng chứng |
|---|---|---|
| Chuẩn bị | Go / 手順 / Rollback đủ và rõ chưa? | Tài liệu release |
| Thực thi | Deploy đúng bước, đúng version chưa? | 手順結果 |
| Xác nhận sau | Smoke Pass chưa? | Smoke result |
| Đóng vòng | Đã báo cáo và theo dõi sau release chưa? | Báo cáo / monitoring |

---

## 6. Phiếu đánh giá nhanh (copy vào ticket)

```
【Giai đoạn】 要件 / 設計 / デザイン / 開発 / 検証 / リリース
【担当】 ____

■ Vòng 1 — Đủ điều kiện?
- Mục bắt buộc thiếu: (không / liệt kê)
- 指摘 Critical/High còn mở: __
→ Kết luận Vòng 1: ĐỦ / CHƯA ĐỦ
→ Nếu CHƯA ĐỦ: đã liên hệ 担当 ____ lúc ____ ; hạn đối ứng ____

■ Vòng 2 — Chỉ khi Vòng 1 = ĐỦ
- Mức: A / B / C / D
- Lý do (bám trục đánh giá):
  1.
  2.
- Người đánh giá / ngày: ____

■ Ghi chú công thức điểm: 未確定 (chỉ xếp mức theo định nghĩa tạm)
```

---

## 7. Bảng tra nhanh 1 trang

| Giai đoạn | 担当 | Vòng 1: cần có | Vòng 1 NG thì | Vòng 2: chấm gì |
|---|---|---|---|---|
| 要件・計画 | Dir/PM | 要件 + 計画 + ticket + approve | Trả Dir bổ sung | Phạm vi, kế hoạch, sẵn sàng, đồng thuận |
| 設計 SPEC | BrSE/Dir | SPEC + AC + nhánh + review | Trả BrSE sửa | Đủ code, đủ test, nhánh, khóa bản |
| デザイン | Designer | Figma Final + state + handoff + approve | Trả Designer sửa | Khớp SPEC, state, handoff, nhất quán |
| 開発 | Dev | PR + review + 影響範囲 + build | Trả Dev sửa | Đúng scope, review, ảnh hưởng, sẵn sàng test |
| 検証 | QC | Kế hoạch + case + kết quả + bug + Go/No-Go | Trả QC/Dev xử lý | Bao phủ, thực thi, bug, kết luận |
| リリース | Dir | Go + 手順 + Rollback + smoke + báo cáo | Dừng / trả Dir | Chuẩn bị, thực thi, xác nhận, đóng vòng |

---

## 8. Nguyên tắc 3 câu (nhớ nhanh)

1. **Vòng 1:** Đủ mục bắt buộc chưa? 指摘 có vượt chưa?  
2. **Chưa đủ:** gọi 担当 đối ứng — **không chấm điểm**.  
3. **Đủ rồi:** mới Vòng 2 — xếp **A/B/C/D** theo trục đã định *(công thức điểm 未確定)*.
