# QD Framework — Output đánh giá cho QD (theo giai đoạn)

## 0. Phạm vi tài liệu này

Hiện tại **chắc chắn:** vai trò **QD** và **Reviewer** có thể tách rời.

Tài liệu này **chỉ định nghĩa output / điều kiện đánh giá cho QD**.  
Không mô tả checklist review nội dung chuyên môn (việc của Reviewer).

| Ai | Việc |
|---|---|
| **Reviewer** | Review nội dung, ghi 指摘, approve chuyên môn |
| **QD** | Đối chiếu bảng dưới đây bằng bằng chứng → kết luận giai đoạn **ĐỦ / CHƯA ĐỦ** → (sau đó) xếp mức nếu cần |

---

## 1. Cách QD đánh giá (chung mọi giai đoạn)

```
Giai đoạn kết thúc (hoặc sắp sang bước sau)
        │
        ▼
QD mở checklist giai đoạn (bảng dưới)
        │
        ├─ Thiếu mục / 指摘 vượt ngưỡng → CHƯA ĐỦ → trả 担当 đối ứng
        └─ Đủ hết → ĐỦ → cho sang bước sau (và xếp mức nếu team đã sẵn sàng)
```

### QD chỉ hỏi 3 nhóm

| Nhóm | Câu hỏi | Cách trả lời |
|---|---|---|
| **Có artifact?** | Output bắt buộc đã có chưa? | Phải có **link** |
| **Đúng người xác nhận?** | Approve / record đúng vai trò chưa? | Có tên + ngày + link |
| **Trong ngưỡng?** | Critical/High còn mở bao nhiêu? | **Phải = 0** |

### Ngưỡng 指摘 (input từ Reviewer / hệ thống ticket)

| Mức | Còn mở tối đa để QD cho **ĐỦ** |
|---|---|
| Critical / Blocker | **0** |
| High | **0** |
| Medium / Low | Cho phép tạm nếu có **owner + hạn xử lý** ghi rõ |

### Kết quả QD ghi nhận

```
Giai đoạn: ____
Kết luận: ĐỦ / CHƯA ĐỦ
Mục thiếu: (không / liệt kê)
Critical/High còn mở: __
Đã trả 担当: ____ | Hạn đối ứng: ____
QD / ngày: ____
```

> Xếp điểm A/B/C/D và công thức tính điểm: **chưa chốt (未確定)**.  
> Trước mắt QD chỉ cần làm tốt việc **ĐỦ / CHƯA ĐỦ** theo bảng output dưới đây.

---

## 2. Output đánh giá QD — từng giai đoạn

---

### 2.1 要件定義・PJ計画書

**担当 đối ứng khi CHƯA ĐỦ:** Dir / PM

| # | Output QD cần thấy | ĐỦ khi |
|---|---|---|
| 1 | 要件定義書 | Có **link** |
| 2 | PJ計画書 | Có **link**; trong đó có milestone + **ngày** |
| 3 | Ticket / WBS trên Backlog | Đã tách task (nhìn thấy trên Backlog) |
| 4 | Approve của khách / stakeholder | Có **ngày + tên người + link** xác nhận |
| 5 | 指摘 Critical / High còn mở | **= 0** |

**ĐỦ** = đủ mục 1–5.  
**CHƯA ĐỦ** → QD liên hệ Dir/PM bổ sung / đóng 指摘 → đánh giá lại.

---

### 2.2 設計（画面仕様書 SPEC / 設計書）

**担当 đối ứng khi CHƯA ĐỦ:** BrSE / Dir

| # | Output QD cần thấy | ĐỦ khi |
|---|---|---|
| 1 | 画面仕様書 (SPEC) | Có **link** |
| 2 | AC (tiêu chí nghiệm thu) | Có **link** (file hoặc trong ticket) |
| 3 | Bảng trạng thái / nhánh | Có **link** (hoặc mục rõ trong SPEC) |
| 4 | Record review của Dev **và** QC | Có approve/comment của **cả hai** |
| 5 | Version / ngày khóa SPEC | Có ghi version hoặc ngày khóa |
| 6 | 指摘 Critical / High còn mở | **= 0** |

**ĐỦ** = đủ mục 1–6.  
**CHƯA ĐỦ** → trả BrSE/Dir.

---

### 2.3 デザイン

**担当 đối ứng khi CHƯA ĐỦ:** Designer

| # | Output QD cần thấy | ĐỦ khi |
|---|---|---|
| 1 | Figma Final / Approved | Có **link**; có dấu Final hoặc Approved |
| 2 | State Error và Empty | Có frame/trang tương ứng — hoặc note **N/A + lý do** |
| 3 | Handoff gắn với SPEC | Có mapping frame ↔ SPEC (link/comment) |
| 4 | Approve của Dir **và** Dev | Có xác nhận của **cả hai** |
| 5 | 指摘 Critical / High còn mở | **= 0** |

**ĐỦ** = đủ mục 1–5.  
**CHƯA ĐỦ** → trả Designer.

---

### 2.4 開発

**担当 đối ứng khi CHƯA ĐỦ:** Dev (Lead / assignee)

| # | Output QD cần thấy | ĐỦ khi |
|---|---|---|
| 1 | PR gắn Backlog ticket | PR ghi rõ ticket |
| 2 | Code review approve | ≥ **1** approve từ người **khác** người code |
| 3 | 影響範囲メモ | Có ghi trong PR hoặc ticket (kể cả “không có”) |
| 4 | Build trên môi trường test | Có **version hoặc commit**; biết chỗ test |
| 5 | 指摘 Critical / High còn mở (PR/bug) | **= 0** |

**ĐỦ** = Ready for QA.  
**CHƯA ĐỦ** → trả Dev.  
*(QD không thay code review — chỉ kiểm các mục trên.)*

---

### 2.5 検証

**担当 đối ứng khi CHƯA ĐỦ:** QC *(bug do code → chuyển Dev)*

| # | Output QD cần thấy | ĐỦ khi |
|---|---|---|
| 1 | テスト計画 | Có **link** |
| 2 | テスト仕様書 | Có **link** |
| 3 | Kết quả chạy test | Có % đã chạy + Pass/Fail + **version build** |
| 4 | Bug tickets | Có trên Backlog; đếm được theo severity |
| 5 | 品質サマリー | Có kết luận **Go** hoặc **No-Go** |
| 6 | % case In-scope đã chạy | **= 100%** (Blocked: có lý do + owner) |
| 7 | Critical / High còn mở | **= 0** *(High để lại: phải có waiver đã duyệt)* |

**ĐỦ** = đủ mục 1–7.  
**CHƯA ĐỦ** → trả QC (hoặc Dev nếu còn bug High/Critical).

---

### 2.6 リリース

**担当 đối ứng khi CHƯA ĐỦ:** Dir / Release owner

| # | Output QD cần thấy | ĐỦ khi |
|---|---|---|
| 1 | Go / No-Go | Có người duyệt + thời điểm + **version** |
| 2 | リリース手順書 | Có **link** |
| 3 | Rollback計画 | Có **link** (hoặc mục trong 手順書) |
| 4 | Smoke test production | Có kết quả **Pass** |
| 5 | Báo cáo hoàn tất | Có giờ xong + version thực tế + đã gửi stakeholder/Slack |
| 6 | Critical / High sau release còn mở | **= 0** *(hoặc có ETA đã thống nhất)* |

**ĐỦ** = đủ mục 1–6.  
**CHƯA ĐỦ** → trả Dir.  

**Cứng:** thiếu mục **1 hoặc 2 hoặc 3** → QD **không cho deploy**.

---

## 3. Bảng tra nhanh (pin Slack / in 1 trang)

| Giai đoạn | QD cần thấy (output) | CHƯA ĐỦ → |
|---|---|---|
| 要件・計画 | 要件 + 計画(có ngày) + WBS + approve khách + High=0 | Dir/PM |
| 設計 SPEC | SPEC + AC + nhánh + review Dev&QC + version khóa + High=0 | BrSE/Dir |
| デザイン | Figma Final + Error/Empty (hoặc N/A) + handoff↔SPEC + approve Dir&Dev + High=0 | Designer |
| 開発 | PR–ticket + ≥1 approve + 影響範囲 + build/version + High=0 | Dev |
| 検証 | Kế hoạch + 仕様書 + kết quả(+%) + bug + Go/No-Go + 100% chạy + High=0 | QC/Dev |
| リリース | Go + 手順 + Rollback + smoke Pass + báo cáo + High=0 | Dir |

---

## 4. Phiếu QD (copy vào ticket Gate)

```
【Giai đoạn】 要件 / 設計 / デザイン / 開発 / 検証 / リリース
【担当】 ____
【QD】 ____

Checklist output (điền link):
1. ____
2. ____
3. ____
...

Approve đúng vai trò: Có / Không — thiếu: ____
Critical còn mở: __ | High còn mở: __
Medium/Low còn mở có owner+hạn?: Có / Không / Không còn

→ Kết luận: ĐỦ / CHƯA ĐỦ
→ Nếu CHƯA ĐỦ: đã liên hệ 担当 ____ lúc ____ | hạn đối ứng ____
```

---

## 5. 3 câu nhớ cho QD

1. Chỉ check **có link / đúng người approve / 指摘 trong ngưỡng**.  
2. **CHƯA ĐỦ** → trả **担当**, không tự review/sửa nội dung thay Reviewer.  
3. **ĐỦ** → cho giai đoạn đi tiếp. (Chấm A–D để sau khi công thức điểm được chốt.)
