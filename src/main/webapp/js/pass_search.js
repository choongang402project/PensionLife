
function change_mypass(){
	const a=/^[A-Za-z0-9]/;
	const b=/^[ㄱ-ㅎ|ㅏ-ㅢ|가-힁]/;
	const c=/^[0-9]/;
	if(id_pass_search.pass_search_id.value==""){
		alert("아이디를 입력해주세요.");	
	}
	else if(id_pass_search.pass_search_name.value==""){
	alert("고객명을 입력해주세요.");	
	}
	else if(id_pass_search.pass_search_mhp.value==""){
	alert("연락처를 입력해주세요.");	
	}
	else if(!a.test(id_pass_search.pass_search_id.value)){
		alert("아이디는 영문/숫자만 입력가능합니다.");
	}
	else if(!b.test(id_pass_search.pass_search_name.value)){
		alert("고객명은 한글만 입력해주세요.");	
	}
	else if(!c.test(id_pass_search.pass_search_mhp.value)){
		alert("연락처는 숫자만 입력해주세요.");	
	}
	else {
		id_pass_search.method="post";
		id_pass_search.action="./pass_search.do";
		id_pass_search.submit();
		}
}


