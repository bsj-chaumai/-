# QD Framework — Bộ output chuẩn đánh giá chất lượng

**Giai đoạn áp dụng:** `要件・計画` → `設計書・SPEC` → `デザイン`  
**Người dùng chính:** QD (người đánh giá giai đoạn đạt chuẩn hay chưa)  
**Phân tách:** Reviewer soi nội dung đúng/sai; QD đánh giá **độ phủ cấu trúc** + **độ tin cậy kết quả review**.

---

## 0. Cách dùng bộ output này

### 0.1 Phân vai

| Role | Việc | Output |
|---|---|---|
| **Reviewer** | Review nội dung chuyên môn | Danh sách 指摘 + **指摘数** |
| **QD** | Xác nhận kết quả review + check độ phủ | **PASS / REWORK / VERIFY** |

### 0.2 QD đánh giá theo 2 trục

| Trục | Câu hỏi | Cách trả lời |
|---|---|---|
| **Độ phủ cấu trúc** | Các hạng mục bắt buộc đã có chưa? | **Có / Không** (nhìn link, mục lục, section) |
| **Độ tin cậy review** | Kết quả review có đáng tin so với quy mô không? | So **quy mô** với **指摘数** |

### 0.3 3 kết luận QD

| Kết luận | Ý nghĩa | Hành động |
|---|---|---|
| **PASS** | Đủ độ phủ + review đáng tin + Critical/High mở = 0 | Cho sang giai đoạn sau |
| **REWORK** | Độ phủ ổn, review có chiều sâu, nhưng còn Critical/High mở | 担当 đóng 指摘 → QD check lại |
| **VERIFY** | Thiếu hạng mục độ phủ **hoặc** review quá mỏng so với quy mô | Yêu cầu review/bổ sung lại → QD check lại |

### 0.4 Ví dụ chuẩn (SPEC)

- Quy mô: **100 màn** · 指摘数: **1**  
- → Review quá mỏng → QD kết luận **VERIFY** (không tự chỉ ra SPEC sai chỗ nào).

### 0.5 Ngưỡng 指摘 còn mở

| Mức | Để PASS |
|---|---|
| Critical / High | Phải = **0** |
| Medium / Low | Cho phép nếu có **owner + hạn xử lý** |

> Ngưỡng số “quá mỏng” (vd. dưới X 指摘 / 100 màn): đang chờ PM chốt.  
> Trước mắt dùng nguyên tắc: **quy mô lớn mà 指摘数 ≈ 0–1 và không giải thích được → VERIFY**.

---

## 1. Giai đoạn 要件・計画

### 1.1 Mục tiêu đánh giá
Xác nhận đã **chốt phạm vi + kế hoạch** đủ cấu trúc, và kết quả review **đáng tin** trước khi sang 設計.

| Vai trò | Người |
|---|---|
| 担当 đối ứng | Dir / PM |
| Reviewer nội dung | Dir / stakeholder (theo chỉ định dự án) |
| Người kết luận Gate | **QD** |

### 1.2 Quy mô (bắt buộc ghi)

| Trường | Cách ghi |
|---|---|
| Đơn vị | Số **chức năng** hoặc số **mục In-scope** (chọn 1, ghi rõ) |
| Ví dụ | `Quy mô: 12 chức năng In-scope` |

### 1.3 Checklist độ phủ cấu trúc (QD)

| # | Hạng mục output | Đạt khi (Có/Không) | Gợi ý nơi nhìn |
|---|---|---|---|
| R1 | **要件定義書** (link) | Có file/link mở được | Backlog / docs |
| R2 | **In scope / Out scope** | Có tách rõ hai phần | Trong 要件定義書 |
| R3 | **Mục tiêu nghiệp vụ** | Có mô tả làm gì / để ai dùng (actor) | 要件定義書 |
| R4 | **Luồng nghiệp vụ chính** hoặc use case | Có mô tả/flow các luồng chính | 要件定義書 |
| R5 | **PJ計画書** (link) | Có file/link mở được | Backlog / Sheet |
| R6 | **Milestone + ngày** | Mỗi mốc có ngày | PJ計画書 |
| R7 | **Ticket / WBS** | Backlog đã tách task (không 1 ticket chung) | Backlog |
| R8 | **Approve khách / stakeholder** | Có tên + ngày + link xác nhận | Comment / MTG note |

**Thiếu bất kỳ R1–R8** → không PASS (thiếu cấu trúc → thường **VERIFY** hoặc bổ sung rồi check lại).

### 1.4 Checklist kết quả review (QD)

| # | Hạng mục | Đạt khi |
|---|---|---|
| R9 | Review đã hoàn thành | Có Reviewer + ngày + link record |
| R10 | **指摘数** + phân mức C/H/M/L | Có số liệu |
| R11 | Critical / High còn mở | = **0** |
| R12 | Độ tin cậy review | Không bị cờ “quá mỏng” so với quy mô ở §1.2 |

### 1.5 Bảng quyết định QD — 要件・計画

| Tình huống | Kết luận |
|---|---|
| R1–R12 đều đạt | **PASS** |
| Đủ R1–R10, R12 OK, nhưng R11 fail (còn High/Critical) | **REWORK** |
| Thiếu R1–R8 (độ phủ) | **VERIFY** (bổ sung cấu trúc + review lại nếu cần) |
| R12: quy mô lớn mà 指摘数 quá thấp, không giải thích | **VERIFY** |

### 1.6 Phiếu QD — 要件・計画

```
【QD】要件・計画
Quy mô: ___ chức năng/mục In-scope
Link 要件: ___
Link 計画: ___

Độ phủ: R1__ R2__ R3__ R4__ R5__ R6__ R7__ R8__  (Có/Không)
Reviewer: ___ | ngày: ___ | link: ___
指摘数: ___ (C__/H__/M__/L__) | Còn mở C__/H__
Độ tin cậy review: Đáng tin / Quá mỏng / Thiếu dữ liệu

Kết luận: PASS / REWORK / VERIFY
担当 / hạn (nếu không PASS): ___
Lý do ngắn: ___
```

---

## 2. Giai đoạn 設計書・SPEC

### 2.1 Mục tiêu đánh giá
Xác nhận SPEC **đủ cấu trúc để Dev/QC dùng**, và Spec Review **đáng tin** trước khi sang デザイン / 開発.

| Vai trò | Người |
|---|---|
| 担当 đối ứng | BrSE / Dir |
| Spec Reviewer | Dev + QC (hoặc theo chỉ định dự án) — ra 指摘数 |
| Spec QD | **Xác nhận kết quả review + độ phủ** |

### 2.2 Quy mô (bắt buộc ghi)

| Trường | Cách ghi |
|---|---|
| Đơn vị chính | Số **màn hình** trong scope đã review |
| Đơn vị phụ (nếu có) | Số chức năng |
| Ví dụ | `Quy mô: 100 màn (24 chức năng)` |

### 2.3 Checklist độ phủ cấu trúc (QD)

| # | Hạng mục output | Đạt khi (Có/Không) | Ý nghĩa ngắn |
|---|---|---|---|
| S1 | **設計書 / SPEC** (link) | Có link mở được | Artifact gốc |
| S2 | **画面一覧** + số màn | Có list màn; khớp số quy mô | Biết scope review |
| S3 | **画面遷移** (luồng màn hình) | Có sơ đồ hoặc mục mô tả chuyển màn | Không chỉ mô tả từng màn rời |
| S4 | **Thông tin màn cơ bản** | SPEC có mục field / thành phần màn (dù QD không soi từng field) | Có section cấu trúc màn |
| S5 | **Logic / nhánh xử lý** | Có bảng/mục điều kiện, trạng thái, role, rẽ nhánh | Không bỏ trống hạng mục logic |
| S6 | **Error / validation / message** | Có mục định nghĩa lỗi, validate, message | Các trường hợp lỗi được nêu ở cấp cấu trúc |
| S7 | **Empty / trạng thái đặc biệt** (nếu In-scope) | Có mục — hoặc ghi N/A + lý do | Tránh quên empty state |
| S8 | **AC (tiêu chí nghiệm thu)** | Có AC theo màn hoặc theo chức năng | Đủ để QC viết case sau này |
| S9 | **Version / ngày khóa SPEC** | Có ghi version hoặc ngày khóa | Biết bản đã review |
| S10 | **Record Spec Review** | Có approve/comment của đúng Reviewer quy định (vd. Dev và QC) | Review đã diễn ra thật |

**Thiếu S1–S6, S8–S10** → không PASS.  
**S7:** thiếu mà không có N/A → không PASS.

### 2.4 Checklist kết quả review (QD)

| # | Hạng mục | Đạt khi |
|---|---|---|
| S11 | **指摘数** + phân mức C/H/M/L | Có số từ Spec Reviewer |
| S12 | Critical / High còn mở | = **0** |
| S13 | Độ tin cậy review | Không “quá mỏng” so với số màn |

#### Tham chiếu tín hiệu độ tin cậy (SPEC)

| Quy mô | 指摘数 (ví dụ) | Hướng xử lý QD |
|---|---|---|
| ~100 màn | 1 | **VERIFY** — review kém, SPEC có thể còn vấn đề chưa bị bắt |
| ~100 màn | Nhiều 指摘; High đã đóng; có record | Có thể **PASS** nếu độ phủ đủ |
| ~5 màn | 1 | Có thể hợp lý — xem thêm S2–S6 đã Có hết chưa |

### 2.5 Bảng quyết định QD — 設計書・SPEC

| Tình huống | Kết luận |
|---|---|
| S1–S13 đạt | **PASS** |
| Độ phủ + độ tin cậy OK, còn High/Critical mở | **REWORK** |
| Thiếu hạng mục độ phủ (S1–S10) | **VERIFY** |
| 指摘数 quá mỏng so với số màn (vd. 100/1) | **VERIFY** |

### 2.6 Phiếu QD — 設計書・SPEC

```
【Spec QD】設計書・SPEC
Quy mô: ___ màn (___ chức năng)
Link SPEC: ___ | Version/ngày khóa: ___
Link AC: ___

Độ phủ:
S1__ S2__ S3 画面遷移__ S4__ S5 Logic/nhánh__
S6 Error/message__ S7 Empty/N/A__ S8 AC__ S9 Version__ S10 Review record__

Spec Reviewer: ___ | ngày: ___ | link: ___
指摘数: ___ (C__/H__/M__/L__) | Còn mở C__/H__
Độ tin cậy: Đáng tin / Quá mỏng (vd. kiểu 100 màn/1 指摘)

Kết luận: PASS / REWORK / VERIFY
担当 / hạn: ___
Lý do ngắn: ___
```

---

## 3. Giai đoạn デザイン

### 3.1 Mục tiêu đánh giá
Xác nhận Design **đủ trạng thái & gắn SPEC**, và Design Review **đáng tin** trước khi Dev implement quy mô lớn.

| Vai trò | Người |
|---|---|
| 担当 đối ứng | Designer |
| Design Reviewer | Dir + Dev (hoặc theo chỉ định) — ra 指摘数 |
| Design QD | **Xác nhận kết quả review + độ phủ** |

### 3.2 Quy mô (bắt buộc ghi)

| Trường | Cách ghi |
|---|---|
| Đơn vị | Số **màn** hoặc số **frame Final** trong scope |
| Ví dụ | `Quy mô: 40 frame Final (18 màn)` |

### 3.3 Checklist độ phủ cấu trúc (QD)

| # | Hạng mục output | Đạt khi (Có/Không) | Ý nghĩa ngắn |
|---|---|---|---|
| D1 | **Figma Final / Approved** (link) | Có link; có dấu Final hoặc Approved | Bản chốt |
| D2 | **Danh sách màn/frame** khớp scope | Có list; có số quy mô | Biết đã cover bao nhiêu |
| D3 | **Happy path** đủ màn In-scope | Mỗi màn In-scope có frame chính | Không thiếu màn |
| D4 | **State Error** | Có frame/mục Error — hoặc N/A + lý do | Cover lỗi hiển thị |
| D5 | **State Empty** | Có frame/mục Empty — hoặc N/A + lý do | Cover rỗng dữ liệu |
| D6 | **State khác In-scope** (Loading/Disabled… nếu có yêu cầu) | Có — hoặc N/A + lý do | Theo scope dự án |
| D7 | **Mapping frame ↔ SPEC** | Có comment/bảng map | Design không lệch khỏi SPEC về phạm vi |
| D8 | **Handoff cơ bản** | Có note copy/text chính thức hoặc link SPEC gắn frame | Dev nhận được điểm neo |
| D9 | **Record Design Review** | Có xác nhận đúng Reviewer quy định (vd. Dir và Dev) | Review đã diễn ra |
| D10 | Approve Final sau khi đóng 指摘 cấu trúc | Bản đang đánh giá là bản sau review | Không đánh giá nhầm bản draft |

### 3.4 Checklist kết quả review (QD)

| # | Hạng mục | Đạt khi |
|---|---|---|
| D11 | **指摘数** + phân mức | Có số từ Design Reviewer |
| D12 | Critical / High còn mở | = **0** |
| D13 | Độ tin cậy review | Không quá mỏng so với số frame/màn |

### 3.5 Bảng quyết định QD — デザイン

| Tình huống | Kết luận |
|---|---|
| D1–D13 đạt | **PASS** |
| Độ phủ + độ tin cậy OK, còn High/Critical | **REWORK** |
| Thiếu Error/Empty/map SPEC/Final… | **VERIFY** |
| Nhiều frame mà 指摘数 ≈ 0–1 không giải thích | **VERIFY** |

### 3.6 Phiếu QD — デザイン

```
【Design QD】デザイン
Quy mô: ___ màn / ___ frame Final
Link Figma: ___

Độ phủ:
D1 Final__ D2 List__ D3 Happy path__
D4 Error__ D5 Empty__ D6 State khác/N/A__
D7 Map↔SPEC__ D8 Handoff__ D9 Review record__ D10 Bản sau review__

Design Reviewer: ___ | ngày: ___ | link: ___
指摘数: ___ (C__/H__/M__/L__) | Còn mở C__/H__
Độ tin cậy: Đáng tin / Quá mỏng

Kết luận: PASS / REWORK / VERIFY
担当 / hạn: ___
Lý do ngắn: ___
```

---

## 4. Bảng tra nhanh 1 trang

| Giai đoạn | Độ phủ QD bắt buộc nhìn | Review QD bắt buộc nhìn | VERIFY khi |
|---|---|---|---|
| **要件・計画** | In/Out, mục tiêu/actor, luồng nghiệp vụ, 計画+ngày, WBS, approve khách | Quy mô chức năng + 指摘数 + High=0 | Thiếu cấu trúc **hoặc** review mỏng |
| **設計書・SPEC** | 画面一覧, 画面遷移, logic/nhánh, error/message, AC, version, record review | Số màn + 指摘数 + High=0 | Thiếu độ phủ **hoặc** kiểu 100 màn/1 指摘 |
| **デザイン** | Final, đủ màn, Error, Empty, map↔SPEC, handoff, record review | Số frame/màn + 指摘数 + High=0 | Thiếu state/map **hoặc** review mỏng |

---

## 5. Quy tắc ngôn ngữ khi đánh giá (tránh 曖昧)

| Không viết | Viết thay |
|---|---|
| “SPEC ổn” | “PASS — S1–S13 đạt; 100 màn / 指摘数 18; High mở = 0” |
| “Review qua loa” | “VERIFY — quy mô 100 màn, 指摘数 1, quá mỏng” |
| “Thiếu logic” *(nếu là QD)* | “VERIFY — hạng mục S5 Logic/nhánh = Không (không có section)” |
| “Chất lượng kém” | Nêu **thiếu hạng mục nào** hoặc **quy mô/指摘数** cụ thể |

---

## 6. Nhớ 3 câu

1. **Reviewer** = đúng/sai nội dung → 指摘数.  
2. **QD** = độ phủ (Có/Không) + độ tin cậy (quy mô ↔ 指摘数) → PASS / REWORK / VERIFY.  
3. Output chuẩn = checklist từng giai đoạn ở trên — đánh giá bằng bằng chứng (link + số), không bằng cảm tính.
