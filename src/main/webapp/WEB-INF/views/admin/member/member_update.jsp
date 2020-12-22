<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>


  <!-- 대쉬보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문 헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Member Update</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Member Update</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- 본문 내용 Main content -->
    <section class="content">
      <div class="container-fluid">
      
      <div class="row"> <!-- 부트스트랩의 디자인 클래스 row -->
          <div class="col-12"> <!-- width=100%와 같은 말 -->
          
          <form name="update_form" action="/admin/member/member_update" method="post">
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">UPDATE MEMER</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                  <div class="form-group">
                    <label for="user_id">user_id</label>
                    <input value="${memberVO.user_id}" type="text" class="form-control" name="user_id" id="user_id" placeholder="Enter user id" required readonly>
                    <!-- name 없으면 저장이 안 된다 -->
                    <!-- required는 필수입력값(html5에서 지원)이므로 입력하지 않으면 다음 단계로 넘어가지 않는다 -->
                  </div>
                  <div class="form-group">
                    <label for="user_pw">Password</label>
                    <!-- html5에서 지원되는 유효성 검사: minlength, maxlength, required, type="email" -->
                    <input maxlength="10" minlength="5" value="" type="password" class="form-control" name="user_pw" id="user_pw" placeholder="Enter password">
                  </div>
                  <div class="form-group">
                    <label for="user_name">user_name</label>
                    <input value="${memberVO.user_name}" type="text" class="form-control" name="user_name" placeholder="Enter your name" required>
                </div>
                <div class="form-group">
                    <label for="email">e-mail</label>
                    <input value="${memberVO.email}" type="email" class="form-control" name="email" id="email" placeholder="Enter your e-mail" required>
                </div>
                <div class="form-group">
                    <label for="point">point</label>
                    <input value="${memberVO.point}" type="text" class="form-control" name="point" id="point" placeholder="Enter your point" required>
                </div>
                <div class="form-group">
                    <label for="enabled">enabled</label>
                    <select class="form-control" name="enabled" id="enabled">
                    	<option value="0" <c:out value="${(memberVO.enabled=='false')?'selected':''}" /> >false</option>
                    	<option value="1" <c:out value="${(memberVO.enabled=='true')?'selected':''}" /> >true</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="levels">levels</label>
                    <select class="form-control" name="levels" id="levels">
                    	<option value="ROLE_ADMIN" <c:out value="${(memberVO.levels=='ROLE_ADMIN')?'selected':''}" /> >ROLE_ADMIN</option>
                    	<option value="ROLE_USER" <c:out value="${(memberVO.levels=='ROLE_USER')?'selected':''}" /> >ROLE_USER</option>
                    </select>
                </div>
                </div>
                <!-- /.card-body -->
              
            </div>
          
          <!-- button section 시작 -->
          <div class="card-body">
          <a href="/admin/member/member_list?page=${pageVO.page}" class="btn btn-primary float-right mr-1">LIST ALL</a>
          <a href="/admin/member/member_view?page=${pageVO.page}&user_id=${memberVO.user_id}" class="btn btn-danger float-right mr-1">BACK</a>
          <button type="submit" class="btn btn-warning float-right mr-1 text-white">UPDATE</button>
          
          <!-- a태그는 link 이동은 되지만 form의 post값을 전송할 수 없으므로 button 태그를 사용 -->
          </div>
          <!-- button section 끝 -->
          <input name="page" type="hidden" value="${pageVO.page}" />
      	   </form>
          </div>
        </div>
      
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

<%@ include file="../include/footer.jsp" %>