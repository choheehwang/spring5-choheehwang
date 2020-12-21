package org.edu.vo;
/**
 * PageVO : 회원, 게시물 공통으로 사용
 * 한 페이지당 보여줄 개수를 이용해서 전체 테이터를 분할해서 보여주는 역할
 * 필요한 이유: 회원 또는 게시물이 10만건을 한꺼번에 보여주면 조회 속도가 느려지므로
 * 한 페이지당 10개 또는 20개 등으로 제한을 둬 속도 향상 및 사용자 화면 개선 하기 위함이다
 * 아래 계산식에서 [] 부분은 멤버변수로 생성해야함
 * - 1페이지: 10[1페이지당 출력할 개수]*(1[페이지 번호]-1) = 0
 * - 2페이지: 10*(2-1) = 10[계산 결과 나온 시작 페이지 번호]
 * - SELECT * FROM tbl_board oder by bno desc limit 10, 10;#
 * 위에서 앞 10은 시작 인덱스, 뒤 10은 출력할 개수
 * @author 황초희
 *
 */
public class PageVO {
	//boolean과 boolean의 차이: boolean(일반형테이터형변수) / boolean(대문자로시작-클래스형변수-Null로 입력되었을때 처리하는 로직)
	private int perPageNum; //페이징 목록 개수 변수
	private int queryPerPageNum; //페이지 당 출력할 게시물 개수값의 변수
	private Integer page; //jsp에서 사용자가 클릭한 페이지 번호값의 변수
	private int queryStartNo; //쿼리에서 사용될 시작 번호값의 변수
	private boolean prev; //페이징에서 이전 페이지가 있을 때 표시값의 변수
	private boolean next; //페이징에서 이후 페이지가 있을 때 표시값의 변수
	//위 프리뷰와 넥스트와 같은 변수의 존재 유무 확인 => 계산식 필요 => 계산식 내 변수 3개 필요(아래 변수 3개)
	private int totalCount; //회원[게시물] 전체 개수값의 변수
	private int startPage; //jsp 화면에서 보여주는 페이징 리스트 시작 번호
	private int endPage; //jsp 화면에서 보여주는 페이징 리스트 끝 번호
	//startPage, endPage 변수 필요한 이유
	
	//검색에 필요한 변수 2개(search_type, search_keyword) 포함시켜 컨트롤러에서 매개변수 사용 축소
	private String search_type; //검색 조건
	private String search_keyword; //검색어
	
	//전체 클래스에서 [계산식] 4개 필요 => 개발자가 생성
	private void calcPage() {
		//page변수는 현재 jsp에서 클릭한 페이지번호 예로 11 을 받아서 아래 계산식에서 사용
		//(int)형변환 : 2.1, 2.8 다 2로 반환이 됩니다.
		//ceil메서드: 천장값을 반환   1.1 => 2, 2.3 => 3
		//floor메서드: 바닥값을 반환 1.1 => 1, 2.3 => 2
		//ceil(1/10) =>1.0 0.9 0.8 ...0.1 0.0 -0.1 -0.2 => 1
		//2 1.9 1.8 .. 1.2 1.1 => 2
		//ceil(11/10)*10 => 20페이지(tempEnd값)
		int tempEnd = (int)(Math.ceil
				(page/(double)this.perPageNum)*this.perPageNum
				);
		//jsp에서 클릭한 페이지번호 예로 1 을 기준으로 끝 페이지를 계산한다(위)
		//예) < 1 2 3 4 5 6 7 8 9 10 > 페이징 리스트의 시작1 과 끝10 값이 바뀌게 됩니다.
		//예) < 11 12 13 14 15 16 17 18 19 20(tempEnd) > 시작 11 과 끝 20
		this.startPage = (tempEnd - this.perPageNum) + 1;
		//jsp에서 11을 클릭했을 때, (20-10) + 1 = 11 <= startPage 값(위)
		//20개 페이징*10개 레코드 = 200개의 레코드(회원[게시물])
		//회원[게시물]이 195개일 경우
		if(tempEnd*this.queryPerPageNum > this.totalCount) {
		// if(임시 끝 페이지*쿼리에서 한 페이지당 출력할 개수 > 실제 전체 개수) {
			this.endPage = (int)Math.ceil(
					this.totalCount/(double)this.queryPerPageNum
					); //195/10 => [20] 19.9 19.8 ... 19.5
		} else {
			//전체 회원[게시물]수가 195일때 page 1을 클릭한 경우 100 > 195
			//결과가 195/10 => 20 잘못됨, 다음처럼 나와서 위 조건을 타면 않되고 else 문을 진입하게 됨.
			this.endPage = tempEnd; //
		}
		//===============여기까지 endPage 구현하는 계산식===============
		//prev, next 구하는 계산식(아래)
		this.prev = this.startPage != 1;
		//시작 페이지가 1보다 크면 무조건 이전 페이지가 있다는 뜻(위)
		this.next = (this.endPage*this.queryPerPageNum < this.totalCount);
		//20*10 < 195 결과는 false이기 때문에 next 꺽쇠가 안 보이게 jsp에서 처리함
		//예) < 11 12 13 14 15 16 17 18 19 20(tempEnd)  시작 11 과 끝 20
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) { //강제로 1페이지당 보여줄 개수값을 10개로 지정
		//perPageNum = 10;
		this.perPageNum = perPageNum;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public int getQueryStartNo() {
		//DB쿼리에서 사용 결과값은 시작 인덱스번호(0)를 구하는 계산식(아래)
		//계산식 = (jsp에서 클릭한페이지번호-1)*페이지당 보여지는 개수
		//1페이지계산 10[1페이지당출력할개수]x(1[몇번째페이지번호]-1) = 0 1페이지일때
		//2페이지계산 10x(2-1) = 10[계산결과나온 시작페이지번호] 2페이지일때
		queryStartNo = queryPerPageNum*(this.page-1); //개발자가 추가한 계산식
		return queryStartNo;
	}
	public void setQueryStartNo(int startNo) {
		this.queryStartNo = startNo;
	}
	public boolean getPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean getNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		//totalCount 변수값이 만들어지는 순간 calPage 메서드가 실행되면 4개의 변수값 SET 반환
		calcPage(); //totalCount 변수값이 필수로 필요한 메서드
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public int getQueryPerPageNum() {
		return queryPerPageNum;
	}

	public void setQueryPerPageNum(int perQueryPageNum) {
		this.queryPerPageNum = perQueryPageNum;
	}
	
}
