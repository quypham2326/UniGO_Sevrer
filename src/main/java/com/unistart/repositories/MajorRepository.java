package com.unistart.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.unistart.entities.Major;
import javax.persistence.EntityManager;
import org.springframework.data.repository.CrudRepository;

@Repository
public interface MajorRepository extends CrudRepository<Major, Integer> {

    @Query("select new com.unistart.entities.Major(m.id, m.majorName) "
            + "from Major m where m.isActive = true")
    List<Major> showByMajorName();

    public default List<Major> findMostPopularMajor(EntityManager em) {
//        CriteriaQuery cr = em.getCriteriaBuilder().createQuery(Major.class);
//        Root<Major> root = cr.from(Major.class);
//        cr.select(root);
//        return em.createQuery(cr).setFirstResult(0).setMaxResults(5).getResultList();
        return em.createQuery("select new com.unistart.entities.Major(m.id, m.majorName,m.isActive) "
                + "from Major m where m.isActive = true").setFirstResult(0).setMaxResults(5).getResultList();
    }

    Major findById(int id);

}
