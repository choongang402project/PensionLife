$(() => {
	$("#admin_login_btn").click(function() {
		if ($("#admin_id").val() == "") {
			alert("아이디를 입력하세요.");
		}
		else if ($("#admin_pw").val() == "") {
			alert("패스워드를 입력하세요.");
		}
		else {
			$("#frm_admin_login").attr("method", "POST");
			$("#frm_admin_login").attr("action", "./admin_login.do");
			$("#frm_admin_login").submit();
		}
	});
});

function js_select_qa(no) {
	document.getElementById("qa_idx_value").value = no;
	frm_qa_view.method = "POST";
	frm_qa_view.action = "./admin_qawrite.jsp";
	frm_qa_view.submit();
}

function js_admin_answer() {
	if (document.getElementById("ans_content").value == "") {
		alert("답변이 입력되어 있지 않습니다.");
	}
	else {
		if (confirm("답변을 등록하시겠습니까?")) {
			frm_adm_qawr.method = "POST";
			frm_adm_qawr.action = "./aqa_insert.do";
			frm_adm_qawr.submit();
		}
	}
}

function go_qalist(n) {
	if (n == 1) {
		location.href = "./admin_qaflist.jsp";
	}
	else {
		location.href = "./admin_qalist.jsp";
	}
}