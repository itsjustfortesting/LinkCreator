package pl.mmalz.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.mmalz.model.Agent;

@Repository
public class AgentDAOImpl implements AgentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Agent getAgent(String identifier) {
        Session session = sessionFactory.getCurrentSession();
        Agent agent = (Agent) session.createQuery("from Agent where agSymbol = :agsymbol").setParameter("agsymbol", identifier).getSingleResult();
        return agent;
    }
}
