var result;
function loaddata() {
	var rname = document.getElementById("resername");
	var http;
	http = new XMLHttpRequest();
	http.onreadystatechange = function() {
		if (http.readyState == 4 && http.status == 200) {
			eval(this.response);
			result = sdata;
		}
	}
	http.open("POST", "./pension_reservation.do", true);
	http.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	http.send("rname=" + rname.value);
}
loaddata();

var today = new Date(Date.now() - (new Date().getTimezoneOffset() * 60000)).toISOString().substring(0, 16);
document.getElementById("input_reser_datetime").setAttribute("min", today);

function js_reservation_submit() {
	var a = document.getElementById("input_reser_datetime").value.split("T");
	var datevalue = a[0] + " " + a[1] + ":00";
	var b = document.getElementById("room_price").innerText.split("원");
	document.getElementById("reser_date").value = datevalue;
	document.getElementById("reser_price").value = b[0];
	const cellPhone = /^(?:(010)|(01[1|6|7|8|9]))(\d{3,4})(\d{4})$/;
	const eMail = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
	if (frm_reservation_submit.reser_room_idx.value == "") {
		alert("객실을 선택해주세요.");
	}
	else if (frm_reservation_submit.reser_date.value.length < 16) {
		alert("예약 일자를 선택해주세요.");
	}
	else if (frm_reservation_submit.reser_gname.value.length < 2) {
		alert("예약자명을 입력해주세요.");
	}
	else if (!cellPhone.test(frm_reservation_submit.reser_gtel.value)) {
		alert("휴대폰 번호를 정확히 입력해주세요.");
	}
	else if (frm_reservation_submit.reser_gnum.value == "") {
		alert("입실인원을 선택해주세요.");
	}
	else if (!eMail.test(frm_reservation_submit.reser_email.value)) {
		alert("이메일을 정확히 입력해주세요.");
	}
	else {
		if (confirm("정말로 예약 하시겠습니까?")) {
			frm_reservation_submit.method = "POST";
			frm_reservation_submit.action = "./reser_insert.do";
			frm_reservation_submit.submit();
		}
	}
}

$(() => {
	$("#select_box").change(function() {
		var $w = 0;
		var $gns = 0;
		if ($(this).val() =="") {
			$("#reser_room_idx").val("");
		}
		else {
			do {
				if ($(this).val() == result[$w][1]) {
					$("#reser_room_idx").val(result[$w][0]);
					$("#room_layout").text(result[$w][2]);
					$("#room_personnum").text("기준 " + result[$w][3] + "인/최대 " + result[$w][4] + "인");
					$("#room_price").text(result[$w][5] + "원");
					$gns = result[$w][4];
					break;
				}
				$w++;
			} while ($w < result.length);
		}
		$("#guest_number_select").empty();
		var $option1 = $("<option>").attr("value", "");
		$option1.text("입실 인원선택");
		$("#guest_number_select").append($option1);
		$w = 1;
		do {
			var $optiontag = $("<option>").attr("value", $w);
			$optiontag.text($w + "인");
			$("#guest_number_select").append($optiontag);
			$w++;
		} while ($w <= $gns);
	});
});