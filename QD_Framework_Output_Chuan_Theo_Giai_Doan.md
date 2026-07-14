# QD Framework — Output đánh giá cho QD

**Phạm vi hiện tại:** chỉ 3 giai đoạn  
`要件・計画` → `設計 SPEC` → `デザイン`

QD và Reviewer tách rời.  
QD **không review nội dung sâu** — chỉ kiểm theo bảng dưới → kết luận **ĐỦ** hoặc **CHƯA ĐỦ**.

---

## Cách QD đánh giá (chung)

Với mỗi mục trong bảng, chỉ trả lời:

| Kết quả mục | Khi nào |
|---|---|
| **OK** | Có **link** mở được + đúng điều kiện ghi ở cột “ĐỦ khi” |
| **NG** | Thiếu link, link hỏng, hoặc không đúng điều kiện |

**Kết luận giai đoạn:**
- Tất cả mục = OK **và** Critical/High còn mở = 0 → **ĐỦ**
- Có 1 mục NG **hoặc** Critical/High > 0 → **CHƯA ĐỦ** → trả **担当** đối ứng

| Mức 指摘 còn mở | Cho phép ĐỦ? |
|---|---|
| Critical / High | **Không** (phải = 0) |
| Medium / Low | Được, nếu có owner + hạn xử lý |

---

## 1. 要件・計画

**担当 khi CHƯA ĐỦ:** Dir / PM  
**Mục tiêu giai đoạn (để QD hiểu):** đã chốt làm gì, không làm gì, khi nào xong.

| # | Output | ĐỦ khi (QD check) |
|---|---|---|
| 1 | 要件定義書 | Có link. Trong file thấy rõ **In scope** và **Out scope** |
| 2 | PJ計画書 | Có link. Có **milestone** kèm **ngày** |
| 3 | Ticket / WBS | Trên Backlog đã có task tách sẵn (không phải 1 ticket chung chung) |
| 4 | Approve khách / stakeholder | Có link xác nhận. Thấy **tên người** + **ngày** |
| 5 | 指摘 Critical / High | Còn mở = **0** |

**ĐỦ** = OK hết mục 1–5.  
**CHƯA ĐỦ** → Dir/PM bổ sung hoặc đóng 指摘 → QD check lại.

---

## 2. 設計 SPEC

**担当 khi CHƯA ĐỦ:** BrSE / Dir  
**Mục tiêu giai đoạn:** đã có SPEC + AC để Dev/QC dùng; đã được Dev và QC xác nhận.

| # | Output | ĐỦ khi (QD check) |
|---|---|---|
| 1 | 画面仕様書 (SPEC) | Có link mở được |
| 2 | AC (tiêu chí nghiệm thu) | Có link (file riêng hoặc nằm trong ticket/SPEC) |
| 3 | Bảng trạng thái / nhánh | Có link — hoặc có mục rõ ràng trong SPEC |
| 4 | Review Dev | Có record approve/comment của **Dev** |
| 5 | Review QC | Có record approve/comment của **QC** |
| 6 | Version / ngày khóa SPEC | Có ghi version **hoặc** ngày khóa |
| 7 | 指摘 Critical / High | Còn mở = **0** |

**ĐỦ** = OK hết mục 1–7.  
**CHƯA ĐỦ** → BrSE/Dir đối ứng → QD check lại.

---

## 3. デザイン

**担当 khi CHƯA ĐỦ:** Designer  
**Mục tiêu giai đoạn:** Figma đã chốt, gắn SPEC, Dir và Dev đã xác nhận.

| # | Output | ĐỦ khi (QD check) |
|---|---|---|
| 1 | Figma Final / Approved | Có link. Có dấu **Final** hoặc **Approved** |
| 2 | State Error | Có frame/trang Error — **hoặc** ghi N/A + lý do ngắn |
| 3 | State Empty | Có frame/trang Empty — **hoặc** ghi N/A + lý do ngắn |
| 4 | Handoff gắn SPEC | Có comment/note map **frame ↔ SPEC** (hoặc bảng mapping) |
| 5 | Approve Dir | Có xác nhận của **Dir** |
| 6 | Approve Dev | Có xác nhận của **Dev** |
| 7 | 指摘 Critical / High | Còn mở = **0** |

**ĐỦ** = OK hết mục 1–7.  
**CHƯA ĐỦ** → Designer đối ứng → QD check lại.

---

## Bảng tra nhanh

| Giai đoạn | QD cần thấy | CHƯA ĐỦ → |
|---|---|---|
| 要件・計画 | 要件(In/Out) + 計画(ngày) + WBS + approve khách + High=0 | Dir/PM |
| 設計 SPEC | SPEC + AC + nhánh + review Dev + review QC + version khóa + High=0 | BrSE/Dir |
| デザイン | Figma Final + Error + Empty + map SPEC + approve Dir + approve Dev + High=0 | Designer |

---

## Phiếu QD (copy vào ticket)

```
【Giai đoạn】 要件・計画 / 設計 SPEC / デザイン
【担当】 ____
【QD】 ____ / ngày ____

Mục OK/NG + link:
1. 
2. 
3. 
...

Critical còn mở: __ | High còn mở: __

→ Kết luận: ĐỦ / CHƯA ĐỦ
→ Nếu CHƯA ĐỦ: đã gửi 担当 ____ | hạn ____
```

---

## Nhớ 2 câu

1. Có link + đúng điều kiện cột “ĐỦ khi” = OK.  
2. Một mục NG hoặc High > 0 = **CHƯA ĐỦ** → trả 担当.
