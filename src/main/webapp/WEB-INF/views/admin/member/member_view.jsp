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
            <h1 class="m-0">Member view</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Member view</li>
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
          
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Read Member</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-book mr-1"></i> user_id</strong>
                <p class="text-muted">
                  admin
                </p>
                
                <hr>
                <strong><i class="fas fa-map-marker-alt mr-1"></i> user_name</strong>
                <p class="text-muted">관리자</p>

                <hr>
                <strong><i class="fas fa-pencil-alt mr-1"></i> e-mail</strong>
                <p class="text-muted">admin@abc.com</p>

                <hr>
                <strong><i class="far fa-file-alt mr-1"></i> point</strong>
                <p class="text-muted">100</p>
                
                <hr>
                <strong><i class="fas fa-adjust mr-1"></i> enabled</strong>
                <p class="text-muted">true</p>
                
                <hr>
                <strong><i class="fas fa-layer-group mr-1"></i> levels</strong>
                <p class="text-muted">ROLE_ADMIN</p>
              </div>
              <!-- /.card-body -->
              </div>
              
          <!-- button section 시작 -->
          <div class="card-body">
          <a href="/admin/member_list" class="btn btn-primary float-right mr-1">LIST ALL</a>
          <button type="button" class="btn btn-danger float-right mr-1">DELETE</button>
          <button type="button" class="btn btn-warning float-right mr-1 text-white">UPDATE</button>
          <!-- 부트스트랩 버튼 디자인 적용 예시 btn-primary, btn은 버튼 모양으로 변경하는 것 (위) -->
          </div>
          <!-- button section 끝 -->
         
          </div>
        </div>
      
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

<%@ include file="../include/footer.jsp" %>