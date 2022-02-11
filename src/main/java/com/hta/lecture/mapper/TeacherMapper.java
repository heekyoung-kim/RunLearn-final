package com.hta.lecture.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.vo.Teacher;

@Mapper
public interface TeacherMapper {

	void insertTeacher(Teacher teacher);	// 강사신청시 저장.
	void updateTeacher(Teacher teacher);	// 수입, 강사정보 변경.
	Teacher getTeacherByUserNo(int userNo); // 유저번호로 강사정보 조회.
}
