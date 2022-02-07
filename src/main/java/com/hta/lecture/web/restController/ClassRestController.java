package com.hta.lecture.web.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.dto.ClassDetailDto;
// import com.hta.lecture.vo.Book;
import com.hta.lecture.service.ClassService;
import com.hta.lecture.vo.Category;

/*
 * @RestController
 * 		- 요청핸들러 메소드가 반환하는 값을 응답메세지의 body에 포함시킨다.
 * 		- jackson-databind 라이브러리가 프로젝트에 포함되어 있으면 요청핸들러 메소드가 반환하는 값을 json 형식의 텍스트로 변환한 다음
 *        응답메세지의 body부에 포함시켜서 클라이언트로 보낸다.
 *      - @RestController를 사용하는 대신 아래와 같이 적어도 동일하게 동작한다.
 *      
       			@Controller										// @RestController 대신 @Controller을 적었다.
       			@RequestMapping("/rest/book")
       			public class BookRestController {
       				@Autowired
       				private BookService bookService;
       				
       				@GetMapping("/detail.do")
       				public @ResponseBody Book detail(int no) {	// 반환타입 앞에 @ResponseBody를 붙인다.
       					Book book = bookService.getBookDetail(no);
       					return book;
       				}

       				@GetMapping("/detail.do")
       				@ResponseBody								// 요청핸들러 메소드에 @ResponseBody를 붙인다.
       				public Book detail(int no) {
       					Book book = bookService.getBookDetail(no);
       					return book;
       				}
       			}

 *      	
 */
@RestController
@RequestMapping("/rest")
public class ClassRestController {
	
	@Autowired
	private ClassService classService;
	
	@GetMapping("/topCategoryList.do")
	public List<Category> topList() {
		List<Category> category = classService.getTopClassCategories();
		return category;
	}
	
	@GetMapping("/subCategoryList.do")
	public List<Category> subList(int no) {
		List<Category> category = classService.getAllSubCategories(no);
		return category;
	}
	
	// 카테고리별 강의 상세정보를 조회하고 싶음
	@GetMapping("ClassDetailList")
	public List<ClassDetailDto> categoryList(String category){
		List<ClassDetailDto> categoryList = classService.getClassByCategory(category);
		return categoryList;
	}
	
}















