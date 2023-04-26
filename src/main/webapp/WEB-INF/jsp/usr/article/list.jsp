
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="ARTICLE LIST" />
<c:set var="totalCount" value="${totalCount}" />
<c:set var="totalPages" value="${totalPages}" />
<c:set var="pageNum" value="${pageNum}" />
<c:set var="lastPageInGroup" value="${lastPageInGroup}" />

<c:set var="beginPage" value="${(pageNum - 5 > 0) ? pageNum - 5 : 1}" />
<c:set var="endPage" value="${(pageNum + 4 < totalPages) ? pageNum + 4 : totalPages}" />
<c:set var="itemsPerPage" value="${itemsPerPage}" />
<%@ include file="../common/head.jspf"%>

<section class="mt-10 text-xs">
		<div class="mx-auto overflow-x-auto w-full">
				<table class="table-box-type-1 table w-full" style="border-collaspe: collaspe; width: 700px;">
						<thead>

								<tr>
										<div style="text-align: center; font-size: 19px">총게시물 : ${totalCount }개</div>

										<th>
												<label>
														<input type="checkbox" class="checkbox" />
												</label>
										</th>
										<th style="font-size: 19px">번호</th>
										<th style="font-size: 19px">날짜</th>
										<th style="font-size: 19px">제목</th>
										<th style="font-size: 19px">작성자</th>
										<th style="font-size: 19px">조회수</th>
								</tr>
						</thead>
						<tbody>
								<c:forEach var="article" items="${articles }">
										<tr>
												<th>
														<label>
																<input type="checkbox" class="checkbox" />
														</label>
												</th>
												<th>
														<div class="badge badge-lg">${article.id }</div>
												</th>
												<th>${article.regDate.substring(0,10) }</th>
												<th class="title">
														<a href="detail?id=${article.id }">${article.title }</a>
												</th>
												<th>${article.name }</th>
												<th>${article.hitCount }</th>
										</tr>
								</c:forEach>
						</tbody>
				</table>
				<style>
.title:hover {
	background-color: gray;
	color: pink;
}
</style>
		</div>
</section>

<div class="pagination flex justify-center mt-3">
		<c:if test="${pageNum > 1}">
				<a href="?boardId=${board.id}&pageNum=1&itemsPerPage=${itemsPerPage}&searchKeyword=${param.searchKeyword }">◀◀</a>
		</c:if>
		<c:if test="${pageNum > 10}">
				<a class="btn-text-link btn btn-outline btn-xs"
						href="?boardId=${board.id}&pageNum=${pageNum - 10}&itemsPerPage=${itemsPerPage}&searchKeyword=${param.searchKeyword }">이전</a>
		</c:if>
		<c:forEach var="i" begin="1" end="${totalPages}" varStatus="status">
				<c:if test="${status.index >= ((pageNum-1) / 10) * 10 && status.index < ((pageNum-1) / 10 + 1) * 10}">
						<c:choose>
								<c:when test="${i == pageNum}">
										<a class="btn-text-link btn btn-outline btn-xs active"
												href="?boardId=${board.id}&pageNum=${i}&itemsPerPage=${itemsPerPage}&searchKeyword=${param.searchKeyword }">${i}</a>
								</c:when>
								<c:otherwise>
										<a class="btn-text-link btn btn-outline btn-xs"
												href="?boardId=${board.id}&pageNum=${i}&itemsPerPage=${itemsPerPage}&searchKeyword=${param.searchKeyword }">${i}</a>
								</c:otherwise>
						</c:choose>
				</c:if>
		</c:forEach>
		<c:if test="${pageNum < totalPages}">
				<a class="btn-text-link btn btn-outline btn-xs"
						href="?boardId=${board.id}&pageNum=${pageNum + 10}&itemsPerPage=${itemsPerPage}&searchKeyword=${param.searchKeyword }">다음</a>
		</c:if>
		<c:if test="${pageNum < totalPages}">
				<a href="?boardId=${board.id}&pageNum=${totalPages}&itemsPerPage=${itemsPerPage}&searchKeyword=${param.searchKeyword }">▶▶</a>
		</c:if>
</div>

<form style="text-align: center;" method="get" action="list">
		<div>
				<select class="select select-bordered max-w-xs" name="searchId">
						<option disabled selected>제목+내용</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
				</select>

				<input type="hidden" name="boardId" value="${board.id}" />
				<input value="${param.searchKeyword }" class="input input-bordered w-full max-w-xs" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요" />
				<button class="btn-text-link btn btn-outline btn-xl" style="display: inline;" type="submit">검색</button>
		</div>

		<script>
			const searchSelect = document.getElementsByName("searchId")[0];
			const searchdInput = document.getElementsByName("searchId")[0];
			searchSelect.onchange = function() {
				var selectedValue = searchSelect.value;
				searchdInput.value = selectedValue;
			}
		</script>


		<!-- pageNum과 itemsPerPage 파라미터는 제거하거나 기본값 설정 -->
</form>

<%@ include file="../common/foot.jspf"%>