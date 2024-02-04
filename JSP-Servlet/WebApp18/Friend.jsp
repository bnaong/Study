<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function submitAction()
	{
		// 확인
		//alert("함수 호출~!!!");
		
		var f = document.myForm;
		if (!f.userName.value)
		{
			alert("이름을 입력하세요.");
			f.userName.focus();
			return;
		}
		
		f.submit();
	}
</script>
</head>
<body>

<div>
	<h1>데이터 입력</h1>
	<hr>
</div>

<!-- com.test.FriendDTO -->
<!-- Friend_ok.jsp -->

<div>
	<form action="Friend_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" name="age" class="txt">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" name="gender" value="남자"> 남자
					</label>
					<label>
						<input type="radio" name="gender" value="여자"> 여자
					</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label>
						<input type="checkbox" name="ideal" value="원빈"> 원빈
					</label>
					<label>
						<input type="checkbox" name="ideal" value="천우희"> 천우희
					</label>
					<label>
						<input type="checkbox" name="ideal" value="카리나"> 카리나
					</label>
					<label>
						<input type="checkbox" name="ideal" value="정우성"> 정우성
					</label>
					<label>
						<input type="checkbox" name="ideal" value="이동욱"> 이동욱
					</label>
					<label>
						<input type="checkbox" name="ideal" value="한소희"> 한소희
					</label>
					<label>
						<input type="checkbox" name="ideal" value="정해인"> 정해인
					</label>
					<label>
						<input type="checkbox" name="ideal" value="수지"> 수지
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<button type="button" class="btn" style="width: 100%;" onclick="submitAction()">등록</button>
			</tr>
		</table>
	</form>
</div>

</body>
</html>