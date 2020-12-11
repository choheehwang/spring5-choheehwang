<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<!-- 대쉬보드 본문 Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- 본문 헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Board Write</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Board Write</li>
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
          
          <form name="write_form" action="/admin/board/board_write" method="post" encType="multipart/form-data">
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">CREATE BOARD</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                  <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" class="form-control" name="title" id="title" placeholder="Enter the title" required>
                    <!-- name 없으면 저장이 안 된다 -->
                    <!-- required는 필수입력값(html5에서 지원)이므로 입력하지 않으면 다음 단계로 넘어가지 않는다 -->
                  </div>
                  
                  <div class="form-group">
                    <label for="contents">Contents</label>
                    <textarea rows="5" class="form-control" name="contents" id="contents"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="writer">writer</label>
                    <input type="text" class="form-control" name="writer" id="writer" placeholder="Enter the writer" required>
                </div>
                
                <div class="form-group" style="margin-bottom:0px;">
                <label>attach</label>
                </div>
                
                <div class="custom-file">
                    <input type="file" name="file" class="custom-file-input" id="customFile">
                    <label class="custom-file-label" for="customFile" style="color:#999;">Choose file</label>
                  </div>

                </div>
                <!-- /.card-body -->
              
            </div>
          
          <!-- button section 시작 -->
          <div class="card-body">
          <a href="/admin/board/board_list" class="btn btn-primary float-right mr-1">LIST ALL</a>
          <button type="submit" class="btn btn-danger float-right mr-1 text-white">SUBMIT</button>
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

<!-- 첨부파일 부트 스트랩 디자인 js -->
<script src="/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- 첨부파일 선택한 내용 출력 실행 -->
<script>
$(document).ready(function () {
  bsCustomFileInput.init();
});
</script>