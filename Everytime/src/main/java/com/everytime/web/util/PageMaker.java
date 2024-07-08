package com.everytime.web.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 페이지 번호를 구성하기 위한 클래스
@Getter
@Setter
@ToString
public class PageMaker {
	private Pagination pagination; // 페이징 처리 객체
	private int totalCount; // 전체 게시글 수
	private int pageCount; // 화면에 표시되는 페이지 번호 수
	
	public PageMaker() {
		this.pageCount = 5; // 5개의 페이지 번호만 화면에 표시
	}	
	
	// 전체 페이지 번호 계산값
	private int calcTotalPageNum() {
		// Math.ceil (올림)
		// Math.floor (버림)		
		return (int) Math.ceil((double) totalCount / pagination.getPageSize()); 
		
	} // end calcTotalPageNum()
	
	// 임시 끝 번호 계산값
	private int tempEndNum() {
		return (int) Math.ceil((double) pagination.getPageNum() / pageCount) * pageCount;
	} // end tempEndNum()
	
	// 시작 페이지 번호 계산
	public int getStartNum() {
		return tempEndNum() - (pageCount - 1);
	} // end getStartNum()
	
	// 끝 페이지 번호 계산
	public int getEndNum() {
		// 임시 끝 번호 계산값
		int tempEndNum = tempEndNum();
		int totalPageNum = calcTotalPageNum();
		
		if (tempEndNum > totalPageNum) {
			return totalPageNum; // 끝 번호가 전체 페이지 번호
		} else {
			return tempEndNum; // 끝 번호가 임시 끝 번호
		}
	} // end getEndNum()
	
	// 화면에 보이는 시작 페이지 번호보다 작은 숫자의 페이지 번호 존재 여부
	public boolean isPrev() {
		// prev 유무 확인
		if (getStartNum() <= 1) {
			return false;
		} else {
			return true;
		}
	} // end isPrev()
	
	// 화면에 보이는 끝 페이지 번호보다 큰 숫자의 페이지 번호 존재 여부
	public boolean isNext() {
		// next 유무 확인
		if (getEndNum() >= calcTotalPageNum()) {
			return false;
		} else {
			return true;
		}
	} // end isNext()
	
} // end PageMaker