package kr.co.sist.kjy_prj.member.main;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.kjy_prj.member.domain.MainMovieDomain;
import kr.co.sist.kjy_prj.member.domain.MovieDomain;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;

/**
 * @author : user
 * @fileName : MainService
 * @since : 24. 12. 19.
 */
@Service
public class MainService {

    private final MainDAO mainDAO;

    @Autowired
    public MainService(MainDAO mainDAO) {
        this.mainDAO = mainDAO;
    }


    /**
     * 상영중인 영화를 가져오는 method
     * @return List<MovieDomain>
     * @throws PersistenceException
     */
    public List<MovieDomain> getAllMovies(){
        List<MovieDomain> list = null;
        try {
            list=mainDAO.findAllMovies();

        }catch (PersistenceException e){
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 상영예정작 영화를 가져오는 method
     * @return List<MovieDomain>
     * @throws PersistenceException
     */
    public List<MovieDomain> getAllPreMovies(){
        List<MovieDomain> list = null;
        try {
            list=mainDAO.findAllPreMovies();

        }catch (PersistenceException e){
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 메인화면에 보여질 영상 개수를 가져오는 메소드
     * @return
     */
    public List<Integer> getCountMovies(){
        List<Integer> count=new ArrayList<Integer>();
        try{
            count = mainDAO.countMainMovie();
            
        }catch (PersistenceException e){
            e.printStackTrace();
        }
        return count;
    }

    /**
     * 랜덤 번호로 메인 영상을 선택한다.
     * @return 담아온 메인 영상 MainMovieDomain
     */
    public MainMovieDomain getMovieByNum(){
        List<Integer> list = getCountMovies();
       MainMovieDomain movie=null;
        Random rand = new Random();
        try{
            //TODO 속도 문제
          movie =  mainDAO.findMainMovieByNum(list.get(rand.nextInt(list.size())));
        }catch (PersistenceException e){
            e.printStackTrace();
        }

        return movie;
    }


} // MainService 끝 
