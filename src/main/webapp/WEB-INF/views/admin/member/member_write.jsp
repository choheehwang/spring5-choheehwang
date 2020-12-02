<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


  <!-- 대쉬보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문 헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Member Write</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Member Write</li>
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
          
          <form name="write_form" action="/admin/member_write" method="post">
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">CREATE MEMER</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                  <div class="form-group">
                    <label for="user_id">user_id</label>
                    <input type="text" class="form-control" name="user_id" id="user_id" placeholder="Enter user id" required>
                    <!-- name 없으면 저장이 안 된다 -->
                    <!-- required는 필수입력값(html5에서 지원)이므로 입력하지 않으면 다음 단계로 넘어가지 않는다 -->
                  </div>
                  <div class="form-group">
                    <label for="user_pw">Password</label>
                    <input type="password" class="form-control" name="user_pw" id="user_pw" placeholder="Enter password" required>
                  </div>
                  <div class="form-group">
                    <label for="user_name">user_name</label>
                    <input type="text" class="form-control" name="user_name" placeholder="Enter your name" required>
                </div>
                <div class="form-group">
                    <label for="email">e-mail</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="Enter your e-mail" required>
                </div>
                <div class="form-group">
                    <label for="point">point</label>
                    <input type="text" class="form-control" name="point" id="point" placeholder="Enter your point" required>
                </div>
                <div class="form-group">
                    <label for="enabled">enabled</label>
                    <select class="form-control" name="enabled" id="enabled">
                    	<option value="0">false</option>
                    	<option value="1" selected>true</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="levels">enabled</label>
                    <select class="form-control" name="levels" id="levels">
                    	<option value="ROLE-ADMIN">ROLE-ADMIN</option>
                    	<option value="ROLE_USER" selected>ROLE_USER</option>
                    </select>
                </div>
                </div>
                <!-- /.card-body -->
              
            </div>
          
          <!-- button section 시작 -->
          <div class="card-body">
          <a href="/admin/member_list" class="btn btn-primary float-right mr-1">LIST ALL</a>
          <button type="submit" class="btn btn-warning float-right mr-1 text-white">SUBMIT</button>
          <!-- a태그는 link 이동은 되지만 form의 post값을 전송할 수 없으므로 button 태그를 사용 -->
          </div>
          <!-- button section 끝 -->
      	   </form>
          </div>
        </div>
      
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

<%@ include file="../include/footer.jsp" %>