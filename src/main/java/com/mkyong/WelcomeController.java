package com.mkyong;

import com.mkyong.model.Module;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class WelcomeController {

    @Autowired
    private ModuleService moduleService;

    @RequestMapping("/")
    public String welcome(Map<String, Object> model) {
        Module module = new Module();
        module.setName("First Module");
        module.setType(1);
        moduleService.saveModule(module);
        model.put("modules", moduleService.getAllModules());
        return "welcome";
    }

    @RequestMapping("/edit/{id}")
    public ModelAndView showEditModulePage(@PathVariable(name = "id") Long id) {
        ModelAndView mav = new ModelAndView("editModule");
        Module module = moduleService.get(id);
        mav.addObject("module", module);
        return mav;
    }

    @RequestMapping(value = "/add/parentId={id}")
    public String addNewChildModule(Model model, @PathVariable Long id) {
        Module module = new Module();
        module.setParentId(id);
        model.addAttribute("module", module);
		System.out.println(module);
        return "addModule";
    }

    @RequestMapping(value = "/add/parentId={id}", method = RequestMethod.POST)
    public String saveNewChildModule(@ModelAttribute("module") Module module) {
        System.out.println(module);
        moduleService.saveModule(module);
        return "redirect:/";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String saveModuleInfo(@ModelAttribute("module") Module module) {
        System.out.println(module);
        moduleService.saveModule(module);
        return "redirect:/";
    }

    @RequestMapping("/new")
    public String showNewModelPage(Model model) {
        Module module = new Module();
        module.setType(1);
        model.addAttribute("module", module);
        return "addModule";
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String saveModule(@ModelAttribute("module") Module module) {
        System.out.println(module);
        moduleService.saveModule(module);
        return "redirect:/";
    }

}