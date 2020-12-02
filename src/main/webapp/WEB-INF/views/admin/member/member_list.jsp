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
            <h1 class="m-0">Member list</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Member list</li>
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
            <div class="card"> <!-- 부트스트랩의 card class = 네모난 디자인 -->
              <div class="card-header">
                <h3 class="card-title">Member search</h3>

                <div class="card-tools">
                
                <form name="search_form" action="/admin/member_list" method="get">
                  <div class="input-group input-group-sm">
               <div>
                 <select name="search_type" class="form-control">
                 <option value="" selected>-전체-</option>
                     <option value="user_id" data-select2-id="8">ID</option>
                     <option value="user_name" data-select2-id="16">NAME</option>
                 </select>
                 </div>
                 
                    <div>
                    <input type="text" name="search_keyword" class="form-control float-right" placeholder="Search">
                    </div>

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                  </form>
                  
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr class="text-center">
                      <th>user_id</th> <!-- table head title tag (th) -->
                      <th>user_name[point]</th>
                      <th>e-mail</th>
                      <th>use</th>
                      <th>regdate</th>
                      <th>levels</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr onclick="javascript:location.href='/admin/member_view?user_id=admin';" style="cursor:pointer;" class="text-center">
                      <td><a href="/admin/member_view?user_id=admin">admin</a></td>
                      <td>관리자</td>
                      <td>admin@abc.com</td>
                      <td>true</td>
                      <td>2020-12-01</td>
                      <td><span class="badge bg-danger">ROLE_ADMIN</span></td>
                      <!-- 권한 표시 = 부트스트랩 badge class 사용 -->
                    </tr>
                    <tr class="text-center">
                      <td><a href="/admin/member_view?user_id=user">user</a></td>
                      <td>사용자</td>
                      <td>user@abc.com</td>
                      <td>false</td>
                      <td>2020-12-01</td>
                      <td><span class="badge bg-warning">ROLE_USER</span></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              
              </div>
              <!-- /.card -->
              
              <!-- button section 시작 -->
              <div class="card-body">
              <a href="/admin/member_write" class="btn btn-primary float-right">CREATE</a>
              <!-- 부트스트랩 버튼 디자인 적용 예시 btn-primary, btn은 버튼 모양으로 변경하는 것 (위) -->
              </div>
              <!-- button section 끝 -->
              
              <!-- paging section 시작 -->
              <div class="row card-body">
              <!-- 아래 style="margin:0 auto 빼고, 위 클래스에 pagination justify-content-center m-0을 넣어도 페이징 가운데 정렬 가능 -->
              <ul class="pagination" style="margin:0 auto;">
              <li class="paginate_button page-item previous disabled" id="example2_previous">
              <a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
              </li>
              <!-- 위 이전 게시물 링크 -->
              <li class="paginate_button page-item active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
              <li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
              <li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
              <!-- 아래 다음 게시물 링크 -->
              <li class="paginate_button page-item next" id="example2_next">
              <a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
              </li>
              </ul>
              </div>
              <!-- paging section 끝 -->
     
          </div>
        </div>
      
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

<%@ include file="../include/footer.jsp" %>