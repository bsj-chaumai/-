# QD Framework — Output đánh giá chuẩn theo giai đoạn

## 1. QD đánh giá thế nào nếu không phải người review chính?

**Chốt trước:** QD **không bắt buộc** là người review nội dung.  
Review nội dung do **担当 giai đoạn** (hoặc người được chỉ định) làm.  
QD dùng **bảng quy chuẩn** để kiểm tra giai đoạn **đủ chuẩn hay chưa** và yêu cầu đối ứng / cải thiện.

| Vai trò | Ai | Làm gì |
|---|---|---|
| **Người làm / review nội dung** | 担当 giai đoạn (Dir, BrSE, Designer, Dev, QC…) | Tạo output, review chuyên môn, sửa 指摘 |
| **Người đánh giá theo chuẩn (QD)** | QD (có thể kiêm review, hoặc chỉ audit) | So với bảng quy chuẩn bằng **bằng chứng**; kết luận ĐỦ/CHƯA ĐỦ; xếp mức A–D; yêu cầu đối ứng |

```
担当 tạo output + (review nội dung nếu có)
        │
        ▼
QD đối chiếu BẢNG QUY CHUẨN (không cần là reviewer chính)
        │
        ├─ Vòng 1: Đủ chuẩn vận hành chưa?  → ĐỦ / CHƯA ĐỦ
        │         CHƯA ĐỦ → trả 担当 đối ứng
        │
        └─ Vòng 2: (chỉ khi ĐỦ) xếp mức A/B/C/D theo bằng chứng
```

### QD kiểm bằng gì? (không cần đọc hết như reviewer)

QD chỉ cần trả lời bằng **bằng chứng nhìn thấy được**:

| Câu hỏi của QD | Cách kiểm (không cần review sâu) |
|---|---|
| Output bắt buộc có chưa? | Có **link** file/ticket/Figma/PR/Sheet không? |
| Đúng người đã xác nhận chưa? | Có approve / ký tên / comment của 担当 hoặc reviewer chỉ định không? |
| 指摘 còn vượt ngưỡng không? | Đếm Critical/High còn mở trên Backlog / PR |
| Sang bước sau có an toàn không? | Vòng 1 = ĐỦ thì cho đi tiếp; CHƯA ĐỦ thì dừng và trả 担当 |

**Review sâu nội dung** (đúng logic nghiệp vụ, đẹp design, bug tinh…) = việc của 担当 / reviewer được chỉ định.  
QD chỉ **bắt buộc làm** khi:
- Team giao QD review giai đoạn đó, **hoặc**
- Vòng 2 cần **kiểm mẫu** (spot-check) khi bằng chứng yếu / rủi ro cao.

---

## 2. Bức tranh tổng quát (2 vòng)

```
Giai đoạn (要件 → 設計 → デザイン → 開発 → 検証 → リリース)
        │
        ▼
 ┌──────────────────────────────────────┐
 │ VÒNG 1: Đủ chuẩn chưa? (QD audit)    │
 │ = đủ mục bắt buộc + 指摘 trong ngưỡng │
 └───────────────┬──────────────────────┘
                 │
        ┌────────┴────────┐
        ▼                 ▼
     CHƯA ĐỦ            ĐỦ
        │                 │
        ▼                 ▼
  Liên hệ 担当      VÒNG 2: Xếp mức A/B/C/D
  đối ứng / cải thiện   (theo bằng chứng + trục)
  → làm lại Vòng 1      │
                        ▼
                  Ghi kết quả → cho sang giai đoạn sau
```

| Vòng | Ai chính | Câu hỏi | Kết quả |
|---|---|---|---|
| **Vòng 1** | **QD** (theo bảng quy chuẩn) | Đủ chuẩn để đi tiếp chưa? | **ĐỦ** / **CHƯA ĐỦ** |
| **Vòng 2** | **QD** xếp mức; 担当 cung cấp bằng chứng | Đạt mức nào? | **A / B / C / D** *(công thức điểm: 未確定)* |

Vòng 2 chỉ làm khi Vòng 1 = **ĐỦ**.  
Thiếu mục bắt buộc hoặc 指摘 vượt ngưỡng → **không chấm điểm**, trả 担当.

---

## 3. Quy tắc dùng chung

| Từ | Nghĩa |
|---|---|
| Bảng quy chuẩn | Checklist mục bắt buộc + ngưỡng 指摘 + trục chấm từng giai đoạn (tài liệu này) |
| Output | File / ticket / link / số liệu cụ thể |
| 担当 | Người chịu trách nhiệm tạo / sửa output giai đoạn |
| Reviewer nội dung | Người review chuyên môn (có thể là 担当, peer, hoặc QD nếu được giao) |
| QD | Người đối chiếu bảng quy chuẩn, kết luận ĐỦ/CHƯA ĐỦ, xếp mức, yêu cầu đối ứng |
| 指摘 | Lỗi / thiếu sót còn mở (từ review nội dung hoặc từ QD khi spot-check) |
| ĐỦ | Có đủ mục bắt buộc **và** Critical/High = 0 |
| CHƯA ĐỦ | Thiếu mục **hoặc** vượt ngưỡng → 担当 phải đối ứng |

**Không dùng:** “ổn”, “cơ bản xong”, “tạm được” — chỉ chấp nhận link / số / tên người xác nhận.

---

## 4. Vòng 1 — QD kiểm đủ chuẩn (không cần là reviewer chính)

### Cách QD làm (mọi giai đoạn)

1. Mở bảng mục bắt buộc của giai đoạn  
2. Với mỗi mục: **có link + đúng loại artifact** = OK; thiếu = NG  
3. Xác nhận đã có **chữ ký / approve của đúng vai trò** (VD: Dev+QC đã review SPEC) — QD không bắt buộc tự review lại toàn bộ  
4. Đếm 指摘 Critical/High còn mở  
5. Kết luận:
   - **ĐỦ** → cho phép Vòng 2 / sang bước sau theo quy trình  
   - **CHƯA ĐỦ** → ghi mục thiếu + số 指摘 → **liên hệ 担当**, đặt hạn đối ứng → kiểm lại Vòng 1

### Ngưỡng 指摘 (Vòng 1)

| Mức | Còn mở tối đa |
|---|---|
| Critical / Blocker | **0** |
| High | **0** |
| Medium / Low | Cho phép tạm nếu có **owner + hạn xử lý** |

### QD không làm gì ở Vòng 1?

- Không viết lại SPEC/Design/Code thay 担当  
- Không bắt buộc đọc từng dòng như reviewer chính  
- Chỉ **chặn / mở cổng** theo bảng quy chuẩn + bằng chứng

---

## 5. Vòng 2 — Xếp mức A–D khi đã ĐỦ

### Mục đích
Xếp giai đoạn vào **A / B / C / D** để cải thiện và theo dõi xu hướng.

### Ai làm gì?

| Người | Việc |
|---|---|
| 担当 | Chuẩn bị bằng chứng theo từng **trục chấm** |
| QD | Xếp mức dựa trên bằng chứng; có thể **kiểm mẫu** 1–2 điểm rủi ro |
| Reviewer nội dung | Nếu đã review, QD dùng kết quả review (số 指摘, comment) làm input — không cần QD review lại toàn bộ |

### Công thức điểm
**未確定.** Hiện chỉ chốt: chấm theo trục nào, bằng chứng gì, mức A–D nghĩa là gì.

| Mức | Ý nghĩa |
|---|---|
| **A** | Đủ, rõ, ít phải hỏi lại |
| **B** | Dùng được; còn điểm nhỏ |
| **C** | Dùng được có điều kiện; còn thiếu chỗ quan trọng |
| **D** | Yếu; handoff khó, rủi ro cao |

### Khi nào QD nên spot-check (xem mẫu)?

- Bằng chứng mâu thuẫn (có approve nhưng vẫn nhiều hỏi lại trên Slack)  
- Giai đoạn rủi ro cao (リリース, 検証 trước release)  
- Điểm giai đoạn trước = C/D  
- 担当 tự chấm cao nhưng output trống / link gãy  

Spot-check = xem **vài điểm quan trọng**, không thay cả vòng review nội dung.

---

## 6. Output chuẩn từng giai đoạn

Mỗi giai đoạn dưới đây:
- **担当** = người tạo / đối ứng  
- **Vòng 1** = việc QD check theo chuẩn  
- **Vòng 2** = trục QD dùng để xếp mức (khi đã ĐỦ)

---

### 6.1 要件定義・PJ計画書

**担当:** Dir / PM  
**Mục tiêu:** Chốt làm gì / không làm gì / khi nào xong.

#### Vòng 1 — QD check mục bắt buộc

| # | Mục bắt buộc | QD coi OK khi thấy |
|---|---|---|
| 1 | 要件定義書 | Link có In/Out, mục tiêu, actor |
| 2 | PJ計画書 | Link có milestone + ngày + owner |
| 3 | Ticket / WBS | Backlog đã tách việc + estimate sơ bộ |
| 4 | Approve khách | Comment/note có ngày + tên người |

**ĐỦ** = đủ 4 mục + Critical/High = 0.  
**CHƯA ĐỦ** → QD liên hệ **Dir/PM** đối ứng.

#### Vòng 2 — Trục xếp mức *(công thức 未確定)*

| Trục | QD hỏi (nhìn bằng chứng) | Bằng chứng |
|---|---|---|
| Rõ phạm vi | In/Out có tách không? | 要件定義書 |
| Kế hoạch thật | Milestone có ngày + owner không? | PJ計画書 |
| Sẵn sàng | Ticket đủ để bắt đầu 設計 không? | WBS |
| Đồng thuận | Khách đã chốt chưa? | Approve |

---

### 6.2 設計（SPEC / 設計書）

**担当:** BrSE / Dir  
**Reviewer nội dung gợi ý:** Dev + QC (QD chỉ bắt buộc nếu được giao)

#### Vòng 1 — QD check

| # | Mục bắt buộc | QD coi OK khi thấy |
|---|---|---|
| 1 | SPEC | Link SPEC có field/validation/lỗi/quyền/flow |
| 2 | AC | Có checklist hoặc Given–When–Then |
| 3 | Bảng nhánh | Có ghi nhánh chính |
| 4 | Review Dev + QC | Có record approve/review; Critical/High = 0 |

**CHƯA ĐỦ** → QD liên hệ **BrSE/Dir**.

#### Vòng 2 — Trục xếp mức

| Trục | QD hỏi | Bằng chứng |
|---|---|---|
| Đủ để code | Còn TBD logic chính không? | SPEC |
| Đủ để test | AC viết case được không? | AC |
| Nhánh | Có bảng nhánh không? | Bảng nhánh |
| Khóa bản | Có version khóa / CR sau khóa không? | Version / CR |

---

### 6.3 デザイン

**担当:** Designer  
**Reviewer nội dung gợi ý:** Dir + Dev

#### Vòng 1 — QD check

| # | Mục | QD coi OK khi thấy |
|---|---|---|
| 1 | Figma Final | Link Final/Approved đủ màn scope |
| 2 | State | Có Error + Empty (tối thiểu) |
| 3 | Handoff | Frame gắn SPEC; copy chính thức |
| 4 | Approve Dir + Dev | Có xác nhận của cả hai |

**CHƯA ĐỦ** → QD liên hệ **Designer**.

#### Vòng 2 — Trục xếp mức

| Trục | QD hỏi | Bằng chứng |
|---|---|---|
| Khớp SPEC | Còn lệch / thiếu màn không? | Figma ↔ SPEC |
| Đủ state | Thiếu Error/Empty không? | Figma |
| Handoff | Dev còn hỏi thiếu gì không? | Note / Slack đã đóng |
| Nhất quán | Component/text thống nhất chưa? | Figma |

---

### 6.4 開発

**担当:** Dev  
**Reviewer nội dung gợi ý:** Dev khác (PR review) — QD không thay code review

#### Vòng 1 — QD check

| # | Mục | QD coi OK khi thấy |
|---|---|---|
| 1 | PR gắn ticket | PR ghi rõ ticket |
| 2 | Review approve | ≥ 1 approve; High comment = 0 |
| 3 | 影響範囲メモ | Có ghi trong PR/ticket |
| 4 | Build test | Có version/commit; chỗ test rõ |

**ĐỦ** = Ready for QA. **CHƯA ĐỦ** → QD liên hệ **Dev**.

#### Vòng 2 — Trục xếp mức

| Trục | QD hỏi | Bằng chứng |
|---|---|---|
| Đúng scope | Có CR nếu lệch SPEC không? | PR + CR |
| Review | Approve đủ; còn nợ High không? | GitHub |
| Ảnh hưởng | Đã ghi 影響範囲 chưa? | PR body |
| Sẵn sàng test | QC vào test được ngay không? | Env note |

---

### 6.5 検証

**担当:** QC  
**Reviewer nội dung:** chính là QC chạy test; QD audit số liệu & ngưỡng

#### Vòng 1 — QD check

| # | Mục | QD coi OK khi thấy |
|---|---|---|
| 1 | テスト計画 | Có phạm vi, lịch, môi trường, tiêu chí Pass |
| 2 | テスト仕様書 | Case map AC |
| 3 | Kết quả test | % chạy + Pass/Fail + version |
| 4 | Bug tickets | Có severity + tái hiện |
| 5 | 品質サマリー | Có Go/No-Go + số bug theo mức |

**ĐỦ** = đủ 5 mục + Critical/High = 0 (High để lại phải có waiver).  
**CHƯA ĐỦ** → QD liên hệ **QC** (hoặc Dev nếu bug code).

#### Vòng 2 — Trục xếp mức

| Trục | QD hỏi | Bằng chứng |
|---|---|---|
| Bao phủ | Case cover AC + ảnh hưởng chưa? | 仕様書 |
| Thực thi | Chạy đủ case In-scope chưa? | Kết quả |
| Bug mở | Còn rủi ro chính không? | Bug list |
| Kết luận | Go/No-Go có số liệu không? | サマリー |

---

### 6.6 リリース

**担当:** Dir / Release owner  
**QD:** audit đủ giấy tờ + ngưỡng trước/sau deploy (không nhất thiết tự deploy)

#### Vòng 1 — QD check

| # | Mục | QD coi OK khi thấy |
|---|---|---|
| 1 | Go / No-Go | Có người duyệt + thời điểm + version |
| 2 | 手順書 | Có bước + người làm |
| 3 | Rollback | Có điều kiện + cách làm |
| 4 | Smoke prod | Kết quả Pass |
| 5 | Báo cáo | Giờ xong + version + đã gửi |

**Thiếu Go / 手順 / Rollback → QD không cho deploy.**  
**CHƯA ĐỦ** → liên hệ **Dir**.

#### Vòng 2 — Trục xếp mức

| Trục | QD hỏi | Bằng chứng |
|---|---|---|
| Chuẩn bị | Đủ Go/手順/Rollback chưa? | Tài liệu |
| Thực thi | Đúng version chưa? | 手順結果 |
| Xác nhận | Smoke Pass chưa? | Smoke |
| Đóng vòng | Đã báo cáo + theo dõi chưa? | Báo cáo |

---

## 7. Phiếu QD dùng hàng ngày (copy vào ticket)

```
【Giai đoạn】 ____
【担当】 ____
【QD đánh giá】 ____ (có / không kiêm review nội dung: ____)

■ Vòng 1 — QD đối chiếu bảng quy chuẩn
- Link mục bắt buộc:
  1. ...
  2. ...
- Approve đúng vai trò: Có / Không (thiếu: ____)
- Critical/High còn mở: __
→ Vòng 1: ĐỦ / CHƯA ĐỦ
→ Nếu CHƯA ĐỦ: đã hỏi 担当 ____ | hạn đối ứng ____

■ Vòng 2 — chỉ khi ĐỦ
- Mức: A / B / C / D
- Bám trục (1–3 lý do có bằng chứng):
  1.
  2.
- Có spot-check không? Có / Không — phạm vi: ____

■ Công thức điểm: 未確定
```

---

## 8. Bảng tra nhanh — QD làm gì / 担当 làm gì

| Giai đoạn | 担当 (làm & đối ứng) | QD Vòng 1 (check chuẩn) | QD Vòng 2 (xếp mức) |
|---|---|---|---|
| 要件・計画 | Dir/PM | 要件+計画+ticket+approve có link? | Phạm vi, kế hoạch, sẵn sàng, đồng thuận |
| 設計 SPEC | BrSE/Dir | SPEC+AC+nhánh+record review Dev/QC? | Đủ code/test, nhánh, khóa bản |
| デザイン | Designer | Figma Final+state+handoff+approve? | Khớp SPEC, state, handoff |
| 開発 | Dev | PR+approve+影響範囲+build? | Scope, review, ảnh hưởng, sẵn sàng test |
| 検証 | QC | Đủ bộ test + Go/No-Go + High=0? | Bao phủ, thực thi, bug, kết luận |
| リリース | Dir | Go+手順+Rollback+smoke+báo cáo? | Chuẩn bị, thực thi, xác nhận, đóng vòng |

---

## 9. 3 câu nhớ nhanh cho QD

1. **Tôi không cần là reviewer chính** — tôi đối chiếu **bảng quy chuẩn + link + số 指摘**.  
2. **Vòng 1 CHƯA ĐỦ** → gọi **担当** đối ứng; chưa ĐỦ thì không chấm điểm.  
3. **Vòng 1 ĐỦ** → xếp **A/B/C/D** theo trục; chỉ spot-check khi bằng chứng yếu hoặc rủi ro cao.
