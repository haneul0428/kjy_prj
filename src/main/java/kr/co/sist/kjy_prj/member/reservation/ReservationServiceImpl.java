package kr.co.sist.kjy_prj.member.reservation;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired(required = false)
	private ReservationDAOImpl rDAO;
	
	@Override
	public List<ReservationMovieDomain> searchAllMovie() {
		List<ReservationMovieDomain> list = new ArrayList<ReservationMovieDomain>();
		
		try {
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}

	
	
}
