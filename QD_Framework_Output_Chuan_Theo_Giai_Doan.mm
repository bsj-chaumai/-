<map version="1.0.1">
<!-- QD Framework — Output đánh giá chuẩn theo giai đoạn -->
<node TEXT="QD Framework&#xa;Output đánh giá chuẩn" FOLDED="false" STYLE="bubble" COLOR="#0f6b5c">
  <font NAME="SansSerif" SIZE="16" BOLD="true"/>
  <node TEXT="Cách đánh giá" POSITION="left" COLOR="#1c2430">
    <font NAME="SansSerif" SIZE="13" BOLD="true"/>
    <node TEXT="Cuối giai đoạn mở 1 Ticket Gate"/>
    <node TEXT="Check đủ output (có link)"/>
    <node TEXT="Pass → sang bước sau"/>
    <node TEXT="Fail → làm nốt, không nhảy giai đoạn"/>
    <node TEXT="3 câu hỏi">
      <node TEXT="Output đâu?"/>
      <node TEXT="Ai ký Pass?"/>
      <node TEXT="Được sang bước tiếp chưa?"/>
    </node>
  </node>

  <node TEXT="Flow" POSITION="right" COLOR="#0f6b5c">
    <font NAME="SansSerif" SIZE="13" BOLD="true"/>

    <node TEXT="1. 要件・計画" COLOR="#14532d">
      <font BOLD="true"/>
      <node TEXT="Người ký: Dir / PM"/>
      <node TEXT="Output">
        <node TEXT="要件定義書 (In/Out, mục tiêu, actor)"/>
        <node TEXT="PJ計画書 (milestone + ngày + owner)"/>
        <node TEXT="Ticket / WBS + estimate"/>
        <node TEXT="Approve khách (ngày + link)"/>
      </node>
      <node TEXT="Pass: hết hỏi Blocker, khách đã chốt" COLOR="#1b7a3d"/>
      <node TEXT="Fail: scope mơ hồ, chưa có ngày milestone" COLOR="#a33b2b"/>
      <node TEXT="→ 設計 SPEC"/>
    </node>

    <node TEXT="2. 設計 SPEC" COLOR="#14532d">
      <font BOLD="true"/>
      <node TEXT="Người ký: BrSE / Dir (Dev+QC review)"/>
      <node TEXT="Output">
        <node TEXT="画面仕様書 SPEC (field/validation/lỗi/quyền/flow)"/>
        <node TEXT="AC (Given–When–Then)"/>
        <node TEXT="Bảng trạng thái / nhánh"/>
        <node TEXT="Review record (High = 0)"/>
      </node>
      <node TEXT="Pass: khóa version, hết TBD logic chính" COLOR="#1b7a3d"/>
      <node TEXT="Fail: chỉ mô tả UI, AC mơ hồ" COLOR="#a33b2b"/>
      <node TEXT="→ デザイン / 開発"/>
    </node>

    <node TEXT="3. デザイン" COLOR="#14532d">
      <font BOLD="true"/>
      <node TEXT="Người ký: Designer (Dir+Dev approve)"/>
      <node TEXT="Output">
        <node TEXT="Figma Final / Approved"/>
        <node TEXT="State: bình thường + Error + Empty"/>
        <node TEXT="Handoff (frame ↔ SPEC)"/>
        <node TEXT="Approve Dir + Dev"/>
      </node>
      <node TEXT="Pass: khớp SPEC, Dev làm được" COLOR="#1b7a3d"/>
      <node TEXT="Fail: chỉ happy path, lệch SPEC chưa CR" COLOR="#a33b2b"/>
      <node TEXT="→ 開発"/>
    </node>

    <node TEXT="4. 開発" COLOR="#14532d">
      <font BOLD="true"/>
      <node TEXT="Người ký: Dev Lead / Dev chính"/>
      <node TEXT="Output">
        <node TEXT="PR gắn Backlog ticket"/>
        <node TEXT="Code review approve"/>
        <node TEXT="影響範囲メモ"/>
        <node TEXT="Build test + version/commit"/>
      </node>
      <node TEXT="Pass: Ready for QA thật" COLOR="#1b7a3d"/>
      <node TEXT="Fail: merge không review, QC không biết build" COLOR="#a33b2b"/>
      <node TEXT="→ 検証"/>
    </node>

    <node TEXT="5. 検証" COLOR="#14532d">
      <font BOLD="true"/>
      <node TEXT="Người ký: QC"/>
      <node TEXT="Output">
        <node TEXT="テスト計画"/>
        <node TEXT="テスト仕様書 (map AC)"/>
        <node TEXT="Kết quả chạy test + version"/>
        <node TEXT="Bug tickets (severity)"/>
        <node TEXT="品質サマリー Go / No-Go"/>
      </node>
      <node TEXT="Pass: Critical/High = 0; 100% case đã chạy" COLOR="#1b7a3d"/>
      <node TEXT="Fail: không có số liệu, chỉ happy path" COLOR="#a33b2b"/>
      <node TEXT="→ リリース (khi Go)"/>
    </node>

    <node TEXT="6. リリース" COLOR="#14532d">
      <font BOLD="true"/>
      <node TEXT="Người ký: Dir / Release owner"/>
      <node TEXT="Output">
        <node TEXT="Go / No-Go"/>
        <node TEXT="リリース手順書"/>
        <node TEXT="Rollback計画"/>
        <node TEXT="Smoke test production"/>
        <node TEXT="Báo cáo hoàn tất"/>
      </node>
      <node TEXT="Pass: Go trước deploy, smoke Pass" COLOR="#1b7a3d"/>
      <node TEXT="Fail: không rollback, không smoke" COLOR="#a33b2b"/>
      <node TEXT="→ Đóng release / theo dõi 24–72h"/>
    </node>
  </node>

  <node TEXT="Ticket Gate" POSITION="left" COLOR="#1c2430">
    <font NAME="SansSerif" SIZE="13" BOLD="true"/>
    <node TEXT="Tên ví dụ: Gate: 検証"/>
    <node TEXT="1. Dán link output"/>
    <node TEXT="2. Tick đủ / thiếu"/>
    <node TEXT="3. Ký Pass hoặc Fail + ngày"/>
  </node>

  <node TEXT="Bảng tra nhanh" POSITION="left" COLOR="#1c2430">
    <font NAME="SansSerif" SIZE="13" BOLD="true"/>
    <node TEXT="要件・計画 → Dir → Blocker = 0"/>
    <node TEXT="設計 SPEC → BrSE/Dir → khóa version"/>
    <node TEXT="デザイン → Designer → khớp SPEC"/>
    <node TEXT="開発 → Dev → Ready for QA"/>
    <node TEXT="検証 → QC → Critical/High = 0"/>
    <node TEXT="リリース → Dir → Smoke Pass"/>
  </node>
</node>
</map>
