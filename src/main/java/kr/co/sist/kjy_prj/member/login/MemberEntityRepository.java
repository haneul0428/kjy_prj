package kr.co.sist.kjy_prj.member.login;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberEntityRepository extends JpaRepository<MemberEntity, String> {
}