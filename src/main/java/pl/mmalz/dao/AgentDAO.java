package pl.mmalz.dao;

import pl.mmalz.model.Agent;

public interface AgentDAO {
    Agent getAgent(String identifier);
}
