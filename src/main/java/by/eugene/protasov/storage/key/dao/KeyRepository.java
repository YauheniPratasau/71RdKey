package by.eugene.protasov.storage.key.dao;

import by.eugene.protasov.storage.key.model.Key;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * @author Евгений Протасов | https://github.com/JProtosss | jprotossswork@gmail.com
 */

@Repository
public interface KeyRepository extends JpaRepository<Key, Integer> {

    @Query(value = "SELECT 1 FROM achievementRD.key where achievementRD.key.key=:keyForCheck",
            nativeQuery = true)
    String checkOrKeyExists(@Param("keyForCheck") String key);

}
