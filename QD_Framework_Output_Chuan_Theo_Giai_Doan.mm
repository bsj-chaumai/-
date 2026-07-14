<map version="1.0.1">
<node TEXT="Output đánh giá cho QD&#xa;(tách khỏi Reviewer)" FOLDED="false" STYLE="bubble" COLOR="#0f6b5c">
  <font NAME="SansSerif" SIZE="15" BOLD="true"/>

  <node TEXT="QD chỉ hỏi" POSITION="left" COLOR="#1c2430">
    <font BOLD="true"/>
    <node TEXT="Có link artifact?"/>
    <node TEXT="Đúng người approve?"/>
    <node TEXT="Critical/High = 0?"/>
    <node TEXT="→ ĐỦ / CHƯA ĐỦ"/>
  </node>

  <node TEXT="6 giai đoạn" POSITION="right" COLOR="#0f6b5c">
    <font BOLD="true"/>
    <node TEXT="要件・計画 → Dir/PM">
      <node TEXT="要件 + 計画 + WBS + approve + High=0"/>
    </node>
    <node TEXT="設計 SPEC → BrSE/Dir">
      <node TEXT="SPEC + AC + nhánh + review Dev&QC + version + High=0"/>
    </node>
    <node TEXT="デザイン → Designer">
      <node TEXT="Figma Final + Error/Empty + handoff + approve + High=0"/>
    </node>
    <node TEXT="開発 → Dev">
      <node TEXT="PR + approve + 影響範囲 + build + High=0"/>
    </node>
    <node TEXT="検証 → QC/Dev">
      <node TEXT="Kế hoạch + case + kết quả + Go/No-Go + 100% + High=0"/>
    </node>
    <node TEXT="リリース → Dir">
      <node TEXT="Go + 手順 + Rollback + smoke + báo cáo + High=0"/>
    </node>
  </node>
</node>
</map>
