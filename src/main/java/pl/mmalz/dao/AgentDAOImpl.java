package pl.mmalz.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.mmalz.model.Agent;

import javax.persistence.NoResultException;

@Repository
public class AgentDAOImpl implements AgentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Agent getAgent(String identifier) {
        String[] split = identifier.split(":");
        if (split.length != 2) {
            return null;
        }
        String identifierType = split[0];
        String identifierValue = split[1];

        Session session = sessionFactory.getCurrentSession();

        Agent agent = null;
        try {
            if (identifierType.equals("agsymbol")) {
                agent = (Agent) session.createQuery("from Agent where agSymbol = :agsymbol").setParameter("agsymbol", identifierValue).getSingleResult();
            } else if (identifierType.equals("taxnumber")) {
                agent = (Agent) session.createQuery("from Agent where taxNumber = :taxnumber").setParameter("taxnumber", identifierValue).getSingleResult();
            }
        } catch (NoResultException e) {
            return null;
        }
        return agent;
    }
}
