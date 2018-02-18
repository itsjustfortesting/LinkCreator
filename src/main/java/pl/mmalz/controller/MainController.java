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
    public String getAgent(@RequestParam("agentIdentifier") String agentIdentifier, Model model) {
        Agent agent = agentService.getAgent(agentIdentifier);
        model.addAttribute("agent", agent);
        return "test";
    }


}
