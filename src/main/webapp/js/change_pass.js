function change_pass(z){
	change_password.myid.value=z;
	if(change_password.change_pass.value==""){
			alert("변경할 비밀번호를 입력해주세요.");
	}
	else if(change_password.change_pass_ck.value==""){
			alert("변경할 비밀번호를 다시 입력해주세요.");
	}
	else if(change_password.change_pass.value!=change_password.change_pass_ck.value){
	alert("변경할 비밀번호가 일치하지 않습니다.");	
	}
	else {
			change_password.method="post";
			change_password.action="./change_pass.do";
			change_password.submit();
	}
}