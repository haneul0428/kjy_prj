package kr.co.sist.kjy_prj.member.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReservationController {
	
	@Autowired(required = false)
	private ReservationServiceImpl rs;

	@GetMapping("/reservation")
	public String reservation() {
//								@RequestParam(value="movie_num", defaultValue = "0") String paramMovie,) {
	//	int movie_num = 
		return "member/reservation/reservationTicket";
	}//reservation
	
}//class
