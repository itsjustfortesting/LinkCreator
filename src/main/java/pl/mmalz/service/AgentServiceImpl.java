package pl.mmalz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.mmalz.dao.AgentDAO;
import pl.mmalz.model.Agent;

@Service
public class AgentServiceImpl implements AgentService {

    @Autowired
    private AgentDAO agentDAO;

    @Override
    @Transactional
    public Agent getAgent(String identifier) {
        return agentDAO.getAgent(identifier);
    }
}
