package com.oracle.samil.Amodel;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

// 시설예약 TBL

@Data
public class Reservation {
	
	//시설예약 TBL
	private int 			resCode;		//예약코드 (시설예약결재 TBL 조인)
	private int 			facilId;		//시설코드종류(시설종류 TBL 조인)
	private String 			resDate;		//예약날짜
	private LocalDateTime 	resStart;		//시작시간
	private LocalDateTime 	resEnd;			//종료시간
	private String 			resContent;		//예약내용
	private int 			resWriter;		//사원번호 (사원 TBL 조인)
	private String 			resTel;			//연락처
	private String 			resRequest;		//요청사안
	private int 			resState;		//예약상태
	
	//시설종류 TBL
	private String 			facilType;	//시설종류 (차량 등)
	private String 			facilName;	//시설명
	
	//사원번호 TBL
	private int 	empno;			//사원번호
	private String 	name;			//이름
	private int 	grade;			//직급
	
	// 포맷된 날짜 필드 추가
    private String formatResStart;
    private String formatResEnd;

    // 날짜 포맷터
    private static final DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
    private static final DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH:mm");

    // 포맷팅 메소드
    public String getFormatResStart() {
        return resStart != null ? resStart.format(formatter1) : null;
    }

    public String getFormatResEnd() {
        return resEnd != null ? resEnd.format(formatter2) : null;
    }
    
    // 연락처 포맷팅 메소드
	public String getFormattedResTel() {
		if (resTel == null || (resTel.length() != 10 && resTel.length() != 11)) {
				return resTel; // 유효하지 않은 경우 원래의 연락처 반환
		}

		// '-'를 추가하여 포맷팅
		return resTel.replaceFirst("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3");
    }
}
