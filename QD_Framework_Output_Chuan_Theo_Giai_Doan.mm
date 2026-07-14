<map version="1.0.1">
<node TEXT="QD Framework&#xa;Đánh giá 2 vòng" FOLDED="false" STYLE="bubble" COLOR="#0f6b5c">
  <font NAME="SansSerif" SIZE="16" BOLD="true"/>

  <node TEXT="Bức tranh tổng quát" POSITION="left" COLOR="#1c2430">
    <font BOLD="true"/>
    <node TEXT="Vòng 1: Đủ điều kiện chưa?">
      <node TEXT="Check mục bắt buộc"/>
      <node TEXT="Check số 指摘"/>
      <node TEXT="ĐỦ / CHƯA ĐỦ"/>
    </node>
    <node TEXT="CHƯA ĐỦ → liên hệ 担当 đối ứng"/>
    <node TEXT="ĐỦ → sang Vòng 2"/>
    <node TEXT="Vòng 2: Chấm điểm sâu">
      <node TEXT="Xếp A / B / C / D"/>
      <node TEXT="Công thức điểm: 未確定"/>
    </node>
  </node>

  <node TEXT="Ngưỡng 指摘 Vòng 1" POSITION="left" COLOR="#a33b2b">
    <font BOLD="true"/>
    <node TEXT="Critical/Blocker = 0"/>
    <node TEXT="High = 0"/>
    <node TEXT="Medium/Low: có owner + hạn"/>
  </node>

  <node TEXT="6 giai đoạn" POSITION="right" COLOR="#0f6b5c">
    <font BOLD="true"/>

    <node TEXT="1. 要件・計画">
      <node TEXT="担当: Dir/PM"/>
      <node TEXT="V1: 要件 + 計画 + ticket + approve"/>
      <node TEXT="V2: phạm vi / kế hoạch / sẵn sàng / đồng thuận"/>
    </node>

    <node TEXT="2. 設計 SPEC">
      <node TEXT="担当: BrSE/Dir"/>
      <node TEXT="V1: SPEC + AC + nhánh + review"/>
      <node TEXT="V2: đủ code / đủ test / nhánh / khóa bản"/>
    </node>

    <node TEXT="3. デザイン">
      <node TEXT="担当: Designer"/>
      <node TEXT="V1: Figma Final + state + handoff + approve"/>
      <node TEXT="V2: khớp SPEC / state / handoff / nhất quán"/>
    </node>

    <node TEXT="4. 開発">
      <node TEXT="担当: Dev"/>
      <node TEXT="V1: PR + review + 影響範囲 + build"/>
      <node TEXT="V2: scope / review / ảnh hưởng / sẵn sàng test"/>
    </node>

    <node TEXT="5. 検証">
      <node TEXT="担当: QC"/>
      <node TEXT="V1: kế hoạch + case + kết quả + bug + Go/No-Go"/>
      <node TEXT="V2: bao phủ / thực thi / bug / kết luận"/>
    </node>

    <node TEXT="6. リリース">
      <node TEXT="担当: Dir"/>
      <node TEXT="V1: Go + 手順 + Rollback + smoke + báo cáo"/>
      <node TEXT="V2: chuẩn bị / thực thi / xác nhận / đóng vòng"/>
    </node>
  </node>

  <node TEXT="3 câu nhớ nhanh" POSITION="left" COLOR="#1c2430">
    <font BOLD="true"/>
    <node TEXT="1. Vòng 1 đủ chưa?"/>
    <node TEXT="2. Chưa đủ → gọi 担当"/>
    <node TEXT="3. Đủ → xếp A/B/C/D"/>
  </node>
</node>
</map>
