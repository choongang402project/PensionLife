// 펜션 클릭으로 예약 페이지 이동
function js_sendReserv(name) {
	document.getElementById("resername").value = name;
	frm_reserv.method = "POST";
	frm_reserv.action = "./m_reservation.jsp";
	frm_reserv.submit();
}

// 펜션 예약 취소
function js_reservation_cancel() {
	if(confirm("정말로 예약을 취소하시겠습니까?")) {
		frm_del_reser.method = "POST";
		frm_del_reser.action = "reser_delete.do";
		frm_del_reser.submit();
	}
}