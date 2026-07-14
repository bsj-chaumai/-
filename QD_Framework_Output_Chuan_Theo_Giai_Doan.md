# QD Framework — Output chuẩn theo giai đoạn dự án

Tài liệu này định nghĩa **output bắt buộc** và **tiêu chí đánh giá Pass/Fail** cho từng giai đoạn, để vận hành trơn và đánh giá được bằng bằng chứng (không dựa cảm tính).

---

## 0. Quy tắc chung (áp dụng mọi giai đoạn)

| Quy tắc | Định nghĩa |
|---|---|
| Output | File / ticket / link / số liệu cụ thể. Không chấp nhận “đã thảo luận”, “đã hiểu”, “ổn” |
| Pass | Đủ 100% output bắt buộc + thỏa điều kiện Gate |
| Fail | Thiếu bất kỳ mục bắt buộc, hoặc còn Open Issue mức Blocker/High chưa đóng |
| Chủ sở hữu | 1 người chịu trách nhiệm ký xác nhận Pass (có thể nhiều người làm) |
| Nơi lưu | Backlog ticket + link artifact (SPEC / Figma / GitHub / Sheet). Mọi output phải truy cập được trong ≤ 2 click từ ticket giai đoạn |
| Thời điểm đánh giá | Cuối giai đoạn, trước khi mở giai đoạn tiếp theo |

### Bản đồ QQS (đối chiếu tự động hóa)

Công thức QQS:  
`QQS = -0.30*Bug + 0.20*Review + 0.20*Spec + 0.15*Sched + 0.15*Comm`

| Chỉ số QQS | Nguồn đo | Giai đoạn chính tạo tín hiệu |
|---|---|---|
| Bug | Backlog bug ticket (ưu tiên High/Critical, tồn đọng) | 検証 / リリース |
| Review | GitHub PR review (số vòng, thời gian chờ, approve) | 開発 / デザイン |
| Spec | Độ đầy đủ & thay đổi SPEC sau khi khóa | 要件 / 設計 / デザイン |
| Sched | Trễ milestone so với kế hoạch đã chốt | Tất cả (đặc biệt 計画 / リリース) |
| Comm | Phản hồi / đồng bộ khách–team (ticket, Slack, MTG note) | 要件 / 検証 / リリース |

Level: **A ≥ 88 / B ≥ 72 / C ≥ 61 / D ≥ 48**

---

## 1. 要件定義・PJ計画書  
*(Requirements Definition / Project Plan)*

### Mục đích
Chốt **làm gì / không làm gì / khi nào xong / ai làm / rủi ro gì** trước khi thiết kế.

### Owner
Dir / PM (ký Pass). QC tham gia review phạm vi ảnh hưởng chất lượng.

### Output bắt buộc

| # | Output | Nội dung tối thiểu | Nơi lưu |
|---|---|---|---|
| 1.1 | **要件定義書** (Requirements) | Mục tiêu nghiệp vụ; phạm vi In/Out; actor; use case hoặc user story; ràng buộc; giả định; Open Question còn lại = 0 hoặc có owner + deadline | Backlog + docs |
| 1.2 | **非機能要件** | Hiệu năng, quyền hạn, trình duyệt/OS, data retention, i18n — ghi rõ hoặc ghi N/A có lý do | Cùng file hoặc phụ lục |
| 1.3 | **PJ計画書** | Milestone (日付), deliverable từng mốc, RACI (Dir/Dev/QC/Design/Client), lịch MTG, tiêu chí Go/No-Go release | Backlog + Sheet/WBS |
| 1.4 | **WBS / Ticket breakdown** | Ticket cha–con đủ để ước lượng; mỗi ticket có: mục tiêu, AC sơ bộ, estimate, assignee | Backlog |
| 1.5 | **Risk log** | Top rủi ro (≥1 nếu có; nếu không ghi “None” có xác nhận). Mỗi risk: ảnh hưởng, mitigation, owner | Backlog hoặc Sheet |
| 1.6 | **Biên bản chốt yêu cầu** | Client/Stakeholder đã approve (ngày + người + link). Mọi thay đổi sau ngày này = Change Request | Backlog comment / MTG note |

### Tiêu chí Pass (Gate → 設計)

- [ ] In/Out scope rõ; không còn câu “tùy tình hình”
- [ ] Open Question Blocker = 0
- [ ] Milestone có ngày và owner
- [ ] Client đã approve 要件定義 + 計画書
- [ ] Estimate sơ bộ đã có; chênh lệch chưa giải thích = 0

### Fail điển hình (cấm qua Gate)
- Scope “làm thêm nếu còn thời gian”
- Không có tiêu chí nghiệm thu nghiệp vụ
- Không có ngày milestone hoặc milestone chỉ mang tính “dự kiến” không chốt

---

## 2. 設計（画面仕様書 SPEC / 設計書）  
*(Screen Spec / Design Spec)*

### Mục đích
Biến yêu cầu thành **spec có thể implement và test** mà không cần hỏi lại ý định nghiệp vụ.

### Owner
BrSE / Dir (ký Pass). Dev + QC review bắt buộc trước khi khóa.

### Output bắt buộc

| # | Output | Nội dung tối thiểu (mỗi màn/chức năng) | Nơi lưu |
|---|---|---|---|
| 2.1 | **画面仕様書 (SPEC)** | Layout mô tả; field list (tên, type, required, default, validation); event/action; API hoặc data source liên quan; message lỗi/empty; quyền hiển thị | Backlog + docs |
| 2.2 | **画面遷移図** | Flow vào/ra màn; điều kiện chuyển; back/cancel | Cùng SPEC hoặc file riêng |
| 2.3 | **状態・分岐表** | Status / role / điều kiện → hành vi. Mọi nhánh nghiệp vụ chính phải có dòng | SPEC |
| 2.4 | **IF / APIメモ** (nếu có backend) | Endpoint, request/response chính, error code dùng trên UI | SPEC hoặc 設計書 |
| 2.5 | **Acceptance Criteria (AC)** | Danh sách Given–When–Then hoặc checklist nghiệm thu; map 1-1 với ticket | Backlog ticket |
| 2.6 | **Review record** | Dev + QC đã review; số issue mở = 0 (hoặc chỉ còn Low đã chấp nhận viết rõ) | Backlog / PR comment / checklist |

### Template checklist SPEC (đánh giá nhanh)

Với **mỗi màn hình / chức năng**, phải trả lời được Yes:

1. Input hợp lệ xử lý thế nào?  
2. Input sai / thiếu hiển thị message gì?  
3. Empty state là gì?  
4. Ai được thấy / thao tác?  
5. Sau thao tác, data đổi gì và màn nào tiếp theo?  
6. Ảnh hưởng màn/chức năng khác là gì?  

Nếu thiếu bất kỳ câu → SPEC **chưa Pass**.

### Tiêu chí Pass (Gate → デザイン / 開発)

- [ ] Mọi ticket In-scope có SPEC + AC
- [ ] Review Dev + QC hoàn tất; Blocker/High = 0
- [ ] Không còn “TBD” trên logic chính
- [ ] Version SPEC đã khóa (v1.0); thay đổi sau khóa = Change Request có ticket

### Fail điển hình
- SPEC chỉ mô tả UI đẹp, không có validation / quyền / nhánh lỗi
- AC viết kiểu “hoạt động bình thường”
- Dev hoặc QC chưa review mà đã bắt đầu code lớn

---

## 3. デザイン  
*(UI/UX Design)*

### Mục đích
Chốt giao diện **đúng SPEC**, đủ trạng thái để Dev implement và QC soi, không còn khoảng trống “tự suy ra”.

### Owner
Designer (ký Pass). Dir/BrSE xác nhận đúng nghiệp vụ; Dev xác nhận khả thi.

### Output bắt buộc

| # | Output | Nội dung tối thiểu | Nơi lưu |
|---|---|---|---|
| 3.1 | **Figma final (locked)** | Frame theo từng màn trong scope; đặt tên rõ; version/page “Final” hoặc stamp Approved | Figma |
| 3.2 | **State coverage** | Default / Hover-Focus (nếu web) / Disabled / Error / Empty / Loading / Success — theo mức cần thiết của màn | Figma |
| 3.3 | **Component & token note** | Component tái sử dụng; spacing/color/font theo design system dự án (hoặc ghi exception) | Figma + short note |
| 3.4 | **Responsive / device** | Nếu In-scope đa thiết bị: breakpoint hoặc bản mobile/desktop tách rõ. Nếu chỉ 1 device: ghi N/A | Figma |
| 3.5 | **Handoff note** | Asset export (nếu cần); icon/image; copy text chính thức; link SPEC tương ứng từng frame | Figma / Backlog |
| 3.6 | **Design review record** | Dir + Dev approve; lệch SPEC đã xử lý hoặc Change Request đã mở | Backlog |

### Tiêu chí Pass (Gate → 開発 UI)

- [ ] Mọi màn In-scope có frame Final
- [ ] State bắt buộc (Error/Empty tối thiểu) đã có
- [ ] Không còn placeholder “lorem / tạm”
- [ ] Lệch SPEC đã đóng hoặc đã có CR ticket
- [ ] Dev confirm “implement được” (không còn hỏi spacing/copy/state thiếu)

### Fail điển hình
- Chỉ có happy path
- Copy trên design khác copy trên SPEC mà chưa cập nhật
- Design đổi sau khi Dev đã code mà không có CR

---

## 4. 開発  
*(Development)*

### Mục đích
Implement đúng SPEC/Design; để lại bằng chứng review và bàn giao test được.

### Owner
Dev Lead / assignee chính (ký Pass từng ticket). Reviewer bắt buộc khác người code.

### Output bắt buộc (theo ticket / PR)

| # | Output | Nội dung tối thiểu | Nơi lưu |
|---|---|---|---|
| 4.1 | **PR gắn ticket** | 1 PR map rõ Backlog ticket; mô tả: phạm vi thay đổi, ảnh hưởng, cách test | GitHub |
| 4.2 | **Code Review Approve** | ≥ 1 approve từ reviewer; comment Blocker/High = 0 trước merge | GitHub |
| 4.3 | **Self-check evidence** | Dev đã chạy AC chính (checklist trong PR hoặc comment). Screenshot/log nếu UI/bugfix | GitHub / Backlog |
| 4.4 | **Testable build** | Môi trường test có bản build/deploy tương ứng ticket; version/commit hash ghi rõ | CI / env note |
| 4.5 | **影響範囲メモ** | Danh sách màn/API/job bị ảnh hưởng (kể cả “không có”) | PR body |
| 4.6 | **DoD ticket** | Code merged theo rule; không để WIP/debug trên nhánh chính; ticket chuyển trạng thái “Ready for QA” đúng nghĩa | Backlog + GitHub |

### Definition of Done (ticket Dev)

Ticket chỉ được chuyển QA khi:

1. SPEC version đã khóa được implement đủ AC  
2. PR approved + merged (hoặc sẵn sàng trên test env theo quy ước dự án)  
3. 影響範囲 đã ghi  
4. Không còn known bug High do chính thay đổi này gây ra  

### Tiêu chí Pass (Gate → 検証)

- [ ] 100% ticket In-scope Sprint/Release đạt DoD
- [ ] Open PR Blocking = 0
- [ ] Build test env ổn định (smoke cơ bản do Dev chạy pass)
- [ ] Change ngoài SPEC = có CR, không “code chui”

### Fail điển hình
- Merge không review
- “Dev xong” nhưng QC không biết test ở đâu / commit nào
- Sửa logic ngoài scope không báo cáo

---

## 5. 検証  
*(Verification / QA)*

### Mục đích
Chứng minh bản build **đủ điều kiện đưa đi nghiệm thu/release** bằng kết quả test có số liệu.

### Owner
QC Lead / QC assignee (ký Pass). Dir xác nhận phạm vi release.

### Output bắt buộc

| # | Output | Nội dung tối thiểu | Nơi lưu |
|---|---|---|---|
| 5.1 | **テスト計画** | Phạm vi test / ngoài phạm vi; môi trường; lịch; loại test (functional, regression, smoke, monkey nếu cần); tiêu chí Pass release | Backlog / docs |
| 5.2 | **テスト仕様書** | Case map AC + regression ảnh hưởng; mỗi case: precondition, steps, expected | Sheet/docs + ticket |
| 5.3 | **実行結果** | Pass/Fail/Blocked theo case; % thực thi; ngày chạy; build/version | Sheet |
| 5.4 | **Bug tickets** | Mỗi bug: severity, bước tái hiện, expected/actual, môi trường, screenshot/log, link SPEC/PR | Backlog |
| 5.5 | **品質サマリー** | Số case; pass rate; bug theo severity; bug tồn đọng; rủi ro còn lại; khuyến nghị Go/No-Go | Backlog / Slack scorecard |
| 5.6 | **受け入れ準備** | Checklist giao khách (nếu có UAT): tài khoản, data, kịch bản demo, known issues đã thống nhất | Backlog |

### Ngưỡng Pass mặc định (có thể chỉnh theo PJ, nhưng phải ghi trước khi test)

| Hạng mục | Ngưỡng Pass |
|---|---|
| Critical / Blocker open | **0** |
| High open | **0** (hoặc có waiver viết rõ + Dir+Client approve) |
| Medium open | Cho phép nếu có plan fix version + không phá main flow |
| Test execution | ≥ **100%** case In-scope đã chạy (Blocked phải có lý do + owner) |
| AC coverage | 100% AC có case tương ứng |

### Tiêu chí Pass (Gate → リリース)

- [ ] テスト計画 + 仕様書 + 実行結果 đủ bộ
- [ ] Ngưỡng bug thỏa bảng trên
- [ ] 品質サマリー có kết luận **Go** hoặc **No-Go** rõ ràng
- [ ] Regression ảnh hưởng đã chạy (không chỉ test đúng chỗ mới)

### Fail điển hình
- “Test xong” không có số liệu
- Chỉ test happy path
- Bug High để sang release mà không có waiver

---

## 6. リリース  
*(Release)*

### Mục đích
Đưa bản đã Pass verification lên production **an toàn, hoàn nguyên được, có bằng chứng vận hành ổn**.

### Owner
Dir / Release owner (ký Go). Dev thực thi kỹ thuật; QC xác nhận hậu kiểm.

### Output bắt buộc

| # | Output | Nội dung tối thiểu | Nơi lưu |
|---|---|---|---|
| 6.1 | **リリース判定書 (Go/No-Go)** | Version; phạm vi; kết quả QA; known issues; quyết định Go/No-Go; người duyệt + thời điểm | Backlog |
| 6.2 | **リリース手順書** | Checklist từng bước deploy; thứ tự; người làm; ước lượng thời gian; maintenance window (nếu có) | Backlog / docs |
| 6.3 | **Rollback計画** | Điều kiện rollback; cách rollback; ai quyết định; RTO mục tiêu | Cùng 手順書 |
| 6.4 | **リリースリハーサル結果** (nếu production-risk ≥ Medium) | Đã dry-run; issue phát hiện + xử lý | Backlog |
| 6.5 | **本番スモーク結果** | Case smoke tối thiểu sau release; Pass bắt buộc | Sheet / Backlog |
| 6.6 | **リリース完了報告** | Thời điểm xong; version thực tế; lệch kế hoạch; incident (nếu có); link PR/tag | Backlog + Slack |
| 6.7 | **監視ウィンドウ** | Theo dõi sau release (mặc định 24–72h hoặc theo PJ); tiêu chí “ổn định” | Slack / Sheet |

### Tiêu chí Pass (đóng giai đoạn / đóng release)

- [ ] Go đã được duyệt trước khi deploy
- [ ] 手順書 + Rollback có đủ
- [ ] Smoke production Pass
- [ ] Không còn Incident mở mức High+ do release này (hoặc đang xử lý có ETA)
- [ ] Báo cáo hoàn tất đã gửi stakeholder/Slack

### Fail điển hình
- Deploy không có rollback
- “Release xong” nhưng không smoke
- Scope thực tế khác Go-list mà không ghi nhận

---

## 7. Bảng Gate tóm tắt (1 trang vận hành)

| Giai đoạn | Artifact khóa | Người ký Pass | Điều kiện cứng |
|---|---|---|---|
| 要件・計画 | 要件定義書 + PJ計画書 + Client approve | Dir/PM | Open Question Blocker = 0 |
| 設計 SPEC | SPEC + AC + Review Dev/QC | BrSE/Dir | TBD logic chính = 0 |
| デザイン | Figma Final + states + approve | Designer + Dir | Lệch SPEC chưa xử lý = 0 |
| 開発 | PR approved + DoD + 影響範囲 | Dev Lead | Ready-for-QA giả = 0 |
| 検証 | Kế hoạch + case + kết quả + 品質サマリー | QC | Critical/High open = 0* |
| リリース | Go/No-Go + 手順 + Rollback + Smoke | Dir | Smoke Fail = không đóng |

\* High open chỉ Pass nếu có waiver viết rõ + duyệt.

---

## 8. Cách chấm nhanh từng giai đoạn (điểm vận hành nội bộ)

Dùng khi cần scorecard thủ công song song QQS tự động.

**Thang 0–100 / giai đoạn** = trung bình các mục bắt buộc:

- Đủ artifact: 40 điểm (đủ = 40, thiếu 1 mục chính = 0 mục đó)
- Chất lượng nội dung (checklist Yes/No): 40 điểm  
- Đúng hạn milestone giai đoạn: 20 điểm  

Map gợi ý: ≥88 A / ≥72 B / ≥61 C / ≥48 D — đồng bộ level QQS.

> Lưu ý: Điểm giai đoạn **không thay** QQS tự động. QQS vẫn lấy từ Bug/Review/Spec/Sched/Comm qua API. Điểm giai đoạn dùng để gate vận hành và Weekly Scorecard giải thích “vì sao”.

---

## 9. Real-time Alert — ngưỡng đề xuất gắn output

| Sự kiện | Ngưỡng | Hành động |
|---|---|---|
| Bug High/Critical tồn đọng | > 3 ngày chưa có owner xử lý hoặc chưa có ETA | Slack tag @qa-team + Dir |
| Gate Fail nhưng ticket đã chuyển giai đoạn sau | Phát hiện sai trạng thái | Alert + bắt buộc trả về giai đoạn đúng |
| SPEC thay đổi sau khóa mà không có CR | Diff/version tăng không có ticket CR | Alert Spec drift |
| Trễ milestone giai đoạn | > 1 ngày so với ngày chốt | Alert Sched |
| Release smoke Fail | Ngay khi Fail | Alert + giữ/rollback theo 手順書 |

---

## 10. Checklist copy-paste cho Backlog (mỗi giai đoạn 1 ticket Gate)

### Gate: 要件・計画
- [ ] 要件定義書 (In/Out, AC nghiệp vụ)
- [ ] 非機能要件 hoặc N/A
- [ ] PJ計画書 + milestone ngày
- [ ] WBS/ticket breakdown
- [ ] Risk log
- [ ] Client approve link
- [ ] Pass ký: ______ ngày: ______

### Gate: 設計 SPEC
- [ ] SPEC đủ field/validation/error/quyền/flow
- [ ] 状態・分岐表
- [ ] AC Given–When–Then
- [ ] Review Dev + QC done
- [ ] Version khóa
- [ ] Pass ký: ______ ngày: ______

### Gate: デザイン
- [ ] Figma Final theo đúng scope
- [ ] State Error/Empty (và state khác nếu cần)
- [ ] Handoff note + link SPEC
- [ ] Dir + Dev approve
- [ ] Pass ký: ______ ngày: ______

### Gate: 開発
- [ ] PR–ticket map
- [ ] Review approve
- [ ] 影響範囲メモ
- [ ] Build testable + commit/version
- [ ] DoD đủ → Ready for QA
- [ ] Pass ký: ______ ngày: ______

### Gate: 検証
- [ ] テスト計画
- [ ] テスト仕様書 map AC
- [ ] 実行結果 (% + version)
- [ ] Bug triage đủ severity
- [ ] 品質サマリー Go/No-Go
- [ ] Pass ký: ______ ngày: ______

### Gate: リリース
- [ ] Go/No-Go duyệt
- [ ] 手順書 + Rollback
- [ ] Rehearsal (nếu cần)
- [ ] 本番スモーク Pass
- [ ] 完了報告 + monitoring window
- [ ] Pass ký: ______ ngày: ______

---

## 11. Từ cấm trong đánh giá (để tránh 曖昧)

| Không dùng | Thay bằng |
|---|---|
| “Cơ bản xong” | “Đủ output #… ; thiếu #…” |
| “Chất lượng ổn” | “Pass rate X%; High open = N” |
| “Đã communicate” | “Link MTG note / Slack / approve ngày …” |
| “Tùy chọn sau” | “Out of scope” hoặc “CR #ticket” |
| “Sẽ confirm sau” | Open Question + owner + deadline; quá hạn = Fail Gate |

---

**Phiên bản:** 1.0  
**Đối tượng dùng:** Dir / BrSE / Design / Dev / QC khi vận hành QD Framework  
**Mục tiêu:** Mỗi giai đoạn chỉ cần trả lời: *Artifact đâu? Ai ký Pass? Gate đã xanh chưa?*
