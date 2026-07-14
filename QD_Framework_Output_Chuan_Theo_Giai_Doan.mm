<map version="1.0.1">
<node TEXT="Bộ output 2 lớp&#xa;QD / Reviewer" FOLDED="false" STYLE="bubble" COLOR="#0f6b5c">
  <font NAME="SansSerif" SIZE="15" BOLD="true"/>

  <node TEXT="Vì sao 2 lớp" POSITION="left">
    <font BOLD="true"/>
    <node TEXT="Muốn cụ thể → dễ biến QD thành reviewer"/>
    <node TEXT="Tách A cổng / B nội dung"/>
  </node>

  <node TEXT="Lớp A — QD" POSITION="left" COLOR="#0b4f8a">
    <font BOLD="true"/>
    <node TEXT="Có link artifact?"/>
    <node TEXT="Ai đã approve?"/>
    <node TEXT="Số 指摘 / % / version"/>
    <node TEXT="ĐỦ / CHƯA ĐỦ"/>
  </node>

  <node TEXT="Lớp B — Reviewer" POSITION="left" COLOR="#6b3fa0">
    <font BOLD="true"/>
    <node TEXT="Nội dung đúng/đủ?"/>
    <node TEXT="Ghi 指摘 chi tiết"/>
    <node TEXT="Approve chuyên môn"/>
  </node>

  <node TEXT="6 giai đoạn" POSITION="right" COLOR="#0f6b5c">
    <font BOLD="true"/>
    <node TEXT="要件・計画"/>
    <node TEXT="設計 SPEC"/>
    <node TEXT="デザイン"/>
    <node TEXT="開発"/>
    <node TEXT="検証"/>
    <node TEXT="リリース"/>
  </node>

  <node TEXT="QD kiêm reviewer?" POSITION="right">
    <font BOLD="true"/>
    <node TEXT="Không → chỉ Lớp A"/>
    <node TEXT="Có → A + B"/>
    <node TEXT="Rủi ro cao → A + spot-check B"/>
  </node>
</node>
</map>
