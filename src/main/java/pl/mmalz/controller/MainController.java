package pl.mmalz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.mmalz.model.Agent;
import pl.mmalz.service.AgentService;

@Controller
public class MainController {

    @Autowired
    private AgentService agentService;

    @RequestMapping("/")
    public String getIndex() {
        return "index";
    }

    @RequestMapping("/findagent")
    public String getAgent(@RequestParam("identifierType") String identifierType, @RequestParam("identifierValue") String identifierValue, Model model) {
        identifierValue = identifierValue.replace(":", "");
        String agentIdentifier = identifierType + ":" + identifierValue;
        Agent agent = agentService.getAgent(agentIdentifier);
        if (agent == null) {
            model.addAttribute("formerror", "noAgentFound");
            model.addAttribute("formerror_identifierValue", identifierValue);
            model.addAttribute("formerror_identifierType", identifierType);
        } else {
            model.addAttribute("agent", agent);
        }
        return "index";
    }
}
