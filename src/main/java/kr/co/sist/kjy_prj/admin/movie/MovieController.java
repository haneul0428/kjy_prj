package kr.co.sist.kjy_prj.admin.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.sist.kjy_prj.admin.util.MovieUtil;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class MovieController {
	@Autowired
	private MovieServiceImpl ms;
	@Autowired
	private MovieUtil mu;
	
	/*
	private MovieController() {
		
	}
	*/
	/*
	private MovieController(MovieServiceImpl ms) {
		this.ms = ms;
	}
	
	private MovieController(MovieUtil mu) {
		this.mu = mu;
	}
	*/
	@RequestMapping(value="/admin/movie/movie_list", method = {GET,POST})
	public String movieList(SearchVO sVO, 
							@RequestParam(value="currentPage", defaultValue="1") String paramPage, 
							Model model) {
		
		//게시판 리스트 구현
		//1. 총 레코드 수 구하기
		int totalCount = ms.totalCount(sVO);
				
		//2. 한 화면에 보여줄 렠모드의 수
		int pageScale = ms.pageScale();
				
		//3. 총 페이지 수
		int totalPage = ms.totalPage(totalCount, pageScale);
				
		//4. 검색의 시작 번호를 구하기(pagination의 번호)[1][2][3]
		//String paramPage = request.getParameter("currentPage");
		int currentPage = ms.currentPage(paramPage);
		int startNum = ms.startNum(currentPage, pageScale); // pagination의 시작 번호
				
		//5. 끝 번호 구하기
		int endNum = ms.endNum(startNum, pageScale); // pagination의 끝 번호
				
		sVO.setCurrentPage(currentPage);
		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);	
		sVO.setTotalPage(totalPage);
		sVO.setTotalCount(totalCount);
				
		//out.print(sVO);
				
		List<MovieDomain> listMovie = null;
		listMovie = ms.searchMovie(sVO); // 시작 번호, 끝 번호를 사용한 게시글 조회		
					
		//view에 써야하므로 model에 집어넣어야 한다
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageScale", pageScale);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		/* pageContext.setAttribute("startNum", startNum);
		pageContext.setAttribute("endNum", endNum);	 */
		model.addAttribute("listMovie", listMovie);	
				
		//이동 URL 설정
		sVO.setUrl("/admin/movie/movie_list");
		//pagination 생성
		String pagiNation = mu.pagination(sVO);
		model.addAttribute("pagiNation", pagiNation);
		
		return "admin/movie/movieList";
	}//movieList
	
	@GetMapping("/admin/movie/movie_detail")
	public String movieDetail(
							@RequestParam(value="movie_num") String tempNum, 
							@RequestParam(defaultValue = "1") String currentPage, 
							Model model) {
		String movePage = "admin/movie/movieDetail";
		
		//영화의 고유 번호를 받는다
		int movie_num = 0;
		try {
			movie_num = Integer.parseInt(tempNum);
		} catch(NumberFormatException nfe) {
			movePage = "redirect:/admin/movie/movie_list"; // 영화 관리 메인으로 반환
		}//end catch
		
		//입력된 영화 번호로 상세 조회 수행
		MovieDomain md = ms.searchDetailMovie(movie_num);
		List<GenreDomain> listGenre = ms.searchDetailGenre(movie_num);
		List<CountryDomain> listCountry = ms.searchDetailCountry(movie_num);
		List<SupervisionDomain> listSuper = ms.searchDetailSupervision(movie_num);
		List<CastDomain> listCast = ms.searchDetailCast(movie_num);
		List<StillCutDomain> listCut = ms.searchDetailStillCut(movie_num);
		
		
		model.addAttribute("md", md);
		model.addAttribute("listGenre", listGenre);
		model.addAttribute("listCountry", listCountry);
		model.addAttribute("listSuper", listSuper);
		model.addAttribute("listCast", listCast);
		model.addAttribute("listCut", listCut);
		
		return movePage;
	}
	
	@GetMapping("/admin/movie/insert_movie")
	public String addMovie() {
		
		return "admin/movie/insertMovie";
	}//addMovie
	
	@PostMapping("/admin/movie/insert_movie_process")
	public String addMovieProcess(
								MovieVO mVO, 
								GenreArrVO gaVO,
								CastArrVO caVO,
								CountryArrVO ctaVO,
								SupervisionArrVO saVO, 
								StillCutArrVO scaVO, Model model) {
		boolean flag = false;
		boolean flag1 = false;
		boolean flag2 = false;
		boolean flag3 = false;
		boolean flag4 = false;
		boolean flag5 = false;
		boolean flag6 = false;
		String msg = "영화 추가에 실패했습니다.";
		
		System.out.println(mVO);
		System.out.println(gaVO);
		System.out.println(caVO);
		System.out.println(ctaVO);
		System.out.println(saVO);
		System.out.println(scaVO);

		
	//	String[] filmo_arr = request.getParameterValues("filmo_arr");
		String[] filmo_arr = caVO.getFilmo_arr();
		int cnt = 0;
		
		/*
		for( String filmo : filmo_arr  ) {
			System.out.println("----------------------------------------Control: " + filmo);
		}
		*/
		
		flag1 = ms.addMovie(mVO);
		flag2 = ms.addGenre(gaVO);
		flag3 =  ms.addCast(caVO);
		flag4 =  ms.addCountry(ctaVO);
		flag5 =  ms.addSupervision(saVO);
		flag6 =  ms.addStillCut(scaVO);
		
		System.out.println("-----------------------movie: " + flag1);
		System.out.println("-----------------------genre: " + flag2);
		System.out.println("-----------------------cast: " + flag3);
		System.out.println("-----------------------country: " + flag4);
		System.out.println("-----------------------supervision: " + flag5);
		System.out.println("-----------------------stillcut: " + flag6);
		
		if( flag1 && flag2 && flag3 && flag4 && flag5 && flag6 ) {
			msg = "영화 추가에 성공했습니다.";
			flag = true;
		}
		
		System.out.println(msg);
		model.addAttribute("flag", flag);
		
		return "admin/movie/movieResult";
	}//addMovie
	
	@PostMapping("/admin/movie/delete_movie_process")
	public String deleteMovieProcess(MovieVO mVO, Model model) {
		boolean flag = false;
		
		if(ms.removeMovie(mVO)) {
			flag = true;
		}
		
		model.addAttribute("flag", flag);
		
		return "admin/movie/movieDeleteResult";
	}//deleteMovieProcess
	
	@GetMapping("/admin/movie/movie_schedule")
	public String addMovieSchedule(
								@RequestParam(value="movie_num") String tempNum, 
								@RequestParam(defaultValue = "1") String currentPage, 
								Model model) {
		String movePage = "admin/movie/insertMovieSchedule";
		
		//영화의 고유 번호를 받는다
		int movie_num = 0;
		try {
			movie_num = Integer.parseInt(tempNum);
		} catch(NumberFormatException nfe) {
			movePage = "redirect:/admin/movie/movie_list"; // 영화 관리 메인으로 반환
		}//end catch
		//System.out.println(movie_num);
		
		//입력된 영화 번호로 상세 조회 수행
		List<ScreeningInfoDomain> listScreenInfo = ms.searchScreeningInfo(movie_num);
		MovieDomain md = ms.searchDetailMovie(movie_num);
		
		model.addAttribute("md", md);
		model.addAttribute("listScreenInfo", listScreenInfo);
		
		return movePage;
	}
	
	@PostMapping("/admin/movie/insert_movie_schedule_process")
	@ResponseBody
	public String addMovieScheduleProcess(ScreeningInfoVO siVO) {
		String jsonObj = "";
		System.out.println("---------------------------control: " + siVO);
		
		jsonObj = ms.addMovieSchedule(siVO);
		System.out.println(jsonObj);
		
		return jsonObj;
	}//addMovieScheduleProcess
	
	@PostMapping("/admin/movie/delete_movie_schedule_process")
	@ResponseBody
	public String removeMovieScheduleProcess(ScreeningInfoVO siVO) {
		String jsonObj = "";
		System.out.println("---------------------------control: " + siVO);
		
		jsonObj = ms.removeMovieSchedule(siVO);
		System.out.println(jsonObj);
		
		return jsonObj;
	}//removeMovieScheduleProcess
	
	@PostMapping("/admin/movie/change_screening")
	@ResponseBody
	public String changeScreening(MovieVO mVO, HttpServletRequest request) {
		String jsonObj = "";
		System.out.println("---------------------------control: " + mVO);
		
		jsonObj = ms.modifyScreening(mVO);			
		
		return jsonObj;
	}
	
	
}//class
