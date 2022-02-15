<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	header {
	    color: #fff;
   	 	height: 64px;
    	background: #333b3d;
	}
		
	.header-wrapper {
		max-width: 1280px;
		height: 100%;
		margin: 0 auto;
		display: flex;
   		align-items: center;
	}
	.header-wrapper h1 {
		font-weight: 800;
   		 font-size: 24px;
	}		
	
	.main {
		background-color: #f5f5f5;
		padding-top: 24px;
	}

	.curriculum-wrapper {
	background-color: #fff;
	 max-width: 996px;
	 margin: 0 auto;
  	 box-shadow: 0 2px 10px 0 hsl(0deg 0% 75% / 50%);
   	 padding: 20px;
   	 
	}

	.title-heading {
		font-size: 14px;
   		color: #929292;
  	 	font-weight: 800;
	}
	
	.title-sub-heading {
		font-size: 24px;
	    color: #330;
	    font-weight: 800;
	    padding-bottom: 1rem;
	}
	
	.w-200 {
		width: 200px;
		display: flex;
	}
	
	.form-label {
		font-size: 24px;
	    color: #330;
	    font-weight: 800;
	    padding-bottom: 1rem;
	}
	
</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<header>
		<div class="header-wrapper">
			<h1>내 강의 만들기</h1>
		</div>
	</header>
		<div class="curriculum-wrapper">
			<p class="title-heading">강의제작</p>
			<p class="title-sub-heading">강의정보</p>
			<form class="border bg-light p-3" method="post" action="insert.do" enctype="multipart/form-data">
				<div class="mb-3">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="title" />
				</div>
				<div class="mb-3">
						<input type="hidden" name="teacherNo" value="${teacherNo }" />
						<div class="form-label">카테고리</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="1">
		  						<label class="form-check-label" for="">개발-프로그래밍</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="2">
		  						<label class="form-check-label" for="">보안-네트워크</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="3">
		  						<label class="form-check-label" for="">데이터-사이언스</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="4">
		  						<label class="form-check-label" for="">웹 개발</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="5">
		  						<label class="form-check-label" for="">프론트엔드</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="6">
		  						<label class="form-check-label" for="">HTML/CSS</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="7">
		  						<label class="form-check-label" for="">Front-end</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="8">
		  						<label class="form-check-label" for="">웹 퍼블리싱</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="9">
		  						<label class="form-check-label" for="">React</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="10">
		  						<label class="form-check-label" for="">jQuery</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="11">
		  						<label class="form-check-label" for="">ES6</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="12">
		  						<label class="form-check-label" for="">보안</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="13">
		  						<label class="form-check-label" for="">데이터분석</label>
							</div>
							</div>
							<div class="form-label">강의 수준</div>
							<div class="form-check form-check-inline">
				  						<input class="form-check-input" type="radio" name="difficultly" id="difficultly" value="입문">
				  						<label class="form-check-label" for="">입문</label>
							</div>
							<div class="form-check form-check-inline">
				  						<input class="form-check-input" type="radio" name="difficultly" id="difficultly" value="중급">
				  						<label class="form-check-label" for="">중급</label>
							</div>
							<div class="form-check form-check-inline">
				  						<input class="form-check-input" type="radio" name="difficultly" id="difficultly" value="중급이상">
				  						<label class="form-check-label" for="">중급이상</label>
							</div><br><br>
							<div class="mb-3">
								<label class="form-label">상세 내용</label><br>
								<textarea id="page-embed" name="content">
									<p style="text-align: center;"><strong>🙆&zwj;♀️ 소개글은 강의의 인상을 좌우합니다 🙆&zwj;♂️</strong></p>
									<p><img style="display: block; margin-left: auto; margin-right: auto;" title="필수 항목은 꼭 적어서 제출해주세요." src="https://cdn.inflearn.com/public/files/courses/326911/6e2812ef-bc5f-42e8-a4d0-f9671f2f2115/pilsu_seontaek (1).png" alt="" width="500" height="376" /></p>
									<p style="text-align: center;">강의 소개가 매력적일수록 수강생의 선택을 받을 확률이 높아요.<br />아래는 인프런에서 그동안의 데이터를 바탕으로<br />수강생에게 어필하기 위한 <strong>필수 항목</strong>을 정리한 강의 소개 템플릿입니다.<br />우측 상단의 가이드를 먼저 읽고 난 다음,<br /><strong>최소 800자, 이미지 3장 이상</strong>의 소개글을 작성해주세요!<br /><sub>(아래부터 강의 소개 템플릿입니다. 위 내용은 드래그해서 지워주세요.)</sub></p>
									<h4 style="text-align: center;">🌿🌿🌿</h4>
									<h3><strong>강의 주제 📖</strong></h3>
									<p>어떤 기술(개념)을 배우는지, 어떤 분야에서 주로 사용되는지 등을 설명해주세요.<br />구체적인 이미지나 그래프 등 참고할 수 있는 자료가 있으면 더 효과적으로 수강생을 설득할 수 있어요.</p>
									<ul>
									<li><strong>강의 주제</strong>: 강의에서 배우는 한 가지 핵심 내용</li>
									<li><strong>강의 기획 배경</strong>: 수강생을 설득할 수 있는, 강의 주제를 다루게 된 배경</li>
									</ul>
									<h4><strong>강의 주제</strong></h4>
									<p>(내용을 작성해주세요.)</p>
									<h4><strong>강의 기획 배경</strong></h4>
									<p>(내용을 작성해주세요.)</p>
									<hr style="margin: 2rem 0; border-top: 1px solid #ededed; border-bottom: 1px solid #fff;" />
									<h3><strong>수강 타겟/강의 목적 🔑</strong></h3>
									<p>이 강의를 들어야 하는 사람은 누구인지 정리해주세요.<br />구체적으로 작성할수록 강의가 필요하고 잘 맞는 사람들이 강의를 수강하게 됩니다.</p>
									<ul>
									<li><strong>지식공유자가 생각하는 수강생 유형</strong>: 이 강의를 들어야 하는 사람들</li>
									<li><strong>수강생의 고민</strong>: 이 강의를 들을 수강생들이 느끼던 고민과 고충</li>
									<li><strong>수강생의 고민 해결 방법</strong>: 수강생의 고민을 해결하기 위해 강의가 제안하는 방법</li>
									</ul>
									<h4><strong>지식공유자가 생각하는 수강생 유형</strong></h4>
									<p>(여기에 내용을 작성해주세요.)</p>
									<h4><strong>수강생의 고민</strong></h4>
									<p>(여기에 내용을 작성해주세요.)</p>
									<h4><strong>수강생의 고민 해결 방법</strong></h4>
									<p>(여기에 내용을 작성해주세요.)</p>
									<hr style="margin: 2rem 0; border-top: 1px solid #ededed; border-bottom: 1px solid #fff;" />
									<h3><strong>강의 특징 ✨</strong></h3>
									<p>이 강의는 다른 강의와 어떻게 다른가요? 어떤 점에서 매력적인 강의인가요?<br />다양한 실습과 예제, 이해하기 쉬운 설명, 깊이있는 개념 설명 등 이 강의의 장점을 설명해주세요.</p>
									<ul>
									<li>제작 과정에서 특히 신경썼거나 강조하고 싶은 <strong>강의의 핵심 특징 (2~4가지)</strong> 을 적어주세요.</li>
									<li>핵심 특징 외에도 커리큘럼에서 이론과 실습의 비중이 어떻게 되는지, 난이도, 사용하는 툴이나 기술, 선수 지식 등 <strong>수강생이 알아야 할 강의의 특징</strong> 등을 알려주면 더욱 좋아요.</li>
									</ul>
									<h4><strong>강의 특징</strong></h4>
									<p>(여기에 내용을 작성해주세요.)</p>
									<hr style="margin: 2rem 0; border-top: 1px solid #ededed; border-bottom: 1px solid #fff;" />
									<h3><strong>강의를 들은 후 수강생의 변화 📜</strong></h3>
									<p>강의를 듣고 나면 무엇을 이해하고, 잘 할 수 있게 되나요?<br /><strong>수강생이 어떻게 변화할 수 있는지</strong>에 대해 최대한 구체적으로 설명해줍니다.<br />생생한 실습 결과물이나 포트폴리오 등이 있다면 주저하지 말고 추가해주세요!</p>
									<p>(여기에 내용을 작성해주세요.)</p>
									<hr style="margin: 2rem 0; border-top: 1px solid #ededed; border-bottom: 1px solid #fff;" />
									<h3><strong>학습 내용 📚</strong></h3>
									<p>강의에서 어떤 순서로 무엇을 배우게 되는지 알려주세요.<br />강의를 여러 개의 섹션으로 나눈 뒤, 섹션마다 어떤 내용을 배우는지 설명합니다.<br />하나의 섹션마다 <strong>제목(필수) - 설명(필수) - 이미지(선택)</strong> 순으로 작성해주세요.</p>
									<p><img style="display: block; margin-left: auto; margin-right: auto;" title="이미지를 변경해주세요." src="https://cdn.inflearn.com/public/files/courses/324193/545543dc-1f82-4104-bf2d-127df752b172/default_img1.png" alt="" width="500" height="262" /></p>
									<p>소개글에 들어가는 이미지가 수강신청을 좌우한다는 사실, 알고 계시나요?<br />섹션별로 배우는 내용에 대한 <strong>예시 이미지</strong>가 있다면, 훨씬 매력적인 강의 소개를 만들 수 있어요.<br />프로젝트를 완성하기까지의 과정을 여러 장의 이미지로 보여줘도 좋아요.</p>
									<p>(여기에 내용을 작성해주세요.)</p>
									<hr style="margin: 2rem 0; border-top: 1px solid #ededed; border-bottom: 1px solid #fff;" />
									<h3><strong>예상 질문 Q&amp;A 💬</strong></h3>
									<p>강의를 수강하기 전, 수강생들이 궁금해할 수 있는 질문과 답변을 <strong>3개 이상</strong> 작성해주세요.<br />뻔하고 형식적인 답변보다는 지식공유자의 개성이 묻어나오는 답변을 권장합니다.</p>
									<p><strong>Q. 질문을 여기에 작성해주세요.</strong><br />A. 답변을 여기에 작성해주세요.</p>
									<p><strong>Q. 질문을 여기에 작성해주세요.</strong><br />A. 답변을 여기에 작성해주세요.</p>
									<p><strong>Q. 질문을 여기에 작성해주세요.</strong><br />A. 답변을 여기에 작성해주세요.</p>
									<p><strong>예시 질문 목록</strong> (이 부분은 모두 지워주세요!)</p>
									<ul>
									<li>비전공자도 들을 수 있는 강의인가요?</li>
									<li>왜 OOO을 배워야 하나요?</li>
									<li>OOO을 배우면 뭐가 좋은가요?</li>
									<li>OOO을 배우면 어떤 일을 할 수 있나요?</li>
									<li>강의를 듣기 전 준비해야 할 것이 있나요?</li>
									<li>수업 내용을 어느 수준까지 다루나요?</li>
									<li>수강 관련 참고 사항(갖춰야 할 환경, 기타 유의사항 등)이 있나요?</li>
									</ul>
									<hr style="margin: 2rem 0; border-top: 1px solid #ededed; border-bottom: 1px solid #fff;" />
									<h3><strong>지식공유자 소개 ✒️</strong></h3>
									<p><strong>강의 주제와 관련이 있는 이력이나 포트폴리오</strong>를 적어주세요.<br />수강생에게 이 강의를 만든 &lsquo;나&rsquo;라는 사람에 대한 믿음을 주고, 매력을 느끼게 할 수 있어요.</p>
									<ul>
									<li><strong>이력 사항</strong>: 강의 주제와 관련 있는 이력 중심</li>
									<li><strong>포트폴리오/개인 영상</strong>: 강의 주제와 관련 있는 포트폴리오나 참고 영상</li>
									</ul>
									<h4><strong>이력 사항</strong></h4>
									<p>(여기에 내용을 작성해주세요.)</p>
									<h4><strong>포트폴리오/개인 영상</strong></h4>
									<p>(여기에 내용을 작성해주세요.)</p>
									<hr style="margin: 2rem 0; border-top: 1px solid #ededed; border-bottom: 1px solid #fff;" />
									<h3><strong>그밖에 (선택 작성) ✔️</strong></h3>
									<p>꼭 작성할 필요는 없지만, 강의 소개에 있으면 더 좋은 내용을 정리했습니다.<br />이외에도 인프런에서 강의 소개를 다듬고 홍보할 때 참고할 내용이 있다면 알려주세요.</p>
									<ul>
									<li><strong>콘텐츠 발행 시 유의사항:</strong> 인프런에서 강의 소개글을 편집하고, 홍보할 때 참고해야 할 유의사항 혹은 지향점</li>
									<li><strong>수강 전 참고 사항</strong>: 강의 진행 환경, 음질/화질, 저작권 등 수강과 직접 연관된 내용 안내</li>
									<li><strong>강의 자료 관련 안내</strong>: 강의 자료 종류, 분량이나 용량, 특징 등</li>
									<li><strong>강의 제작을 결심한 배경</strong>: 강의 제작을 결심한 이유나 사연, 분야에 대한 최신 동향 소개 등</li>
									</ul>
									<p>(여기에 내용을 작성해주세요.)</p>
								</textarea>
							</div>
							<div class="mb-3">
								<label class="form-label w-200">대표 이미지</label> 
								<input type="file" class="form-control" name="uploadFiles">
							</div>
							<div class="d-inline-flex p-1 bd-highlight">
								<label class="form-label w-200">가격</label>
								<input type="number" class="form-control" name="price"/>
							</div><br>
							<div class="d-inline-flex p-1 bd-highlight">
								<label class="form-label w-200">할인가격</label>
								<input type="number" class="form-control" name="discountPrice"/>
							</div><br><br>
								<div class="text-end">
								<a href="list.do" class="btn btn-secondary">취소</a>
								<button type="submit" class="btn btn-primary">저장 후 다음</button>
							</div>
						</form>
					</div>
			</div>
</body>
<script type="text/javascript">
var categoryNo =$('input[name=categoryNo]:checked').val();
$('input:radio[name=categoryNo]').is(':checked');

var difficultly =$('input[name=difficultly]:checked').val();
$('input:radio[name=difficultly]').is(':checked');


tinymce.init({
  selector: 'textarea#page-embed',
  toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
  plugins: [
	    'advlist autolink lists link image charmap print preview anchor',
	    'searchreplace visualblocks code fullscreen',
	    'insertdatetime media table paste imagetools wordcount'
	  ],
  tiny_pageembed_classes: [
    { text: 'Big embed', value: 'my-big-class' },
    { text: 'Small embed', value: 'my-small-class' }
  ],
  height: 500,
  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
});

$.ajax({
    type : "POST",
    url : "insert.do", 
    data : $('form').serialize()
});

</script>

</html>