package com.modules;

import com.modules.model.Module;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Controller
public class WelcomeController {

    private final ModuleService moduleService;

    public WelcomeController( final ModuleService moduleService) {
        this.moduleService = moduleService;
    }

    @RequestMapping("/")
    public String welcome(Model model) {

        List<Module> allModules = moduleService.getParentModules();
        if (allModules.size() == 0) {
            Module module = new Module();
            module.setName("First Module");
            module.setType(1);
            moduleService.saveModule(module);
            allModules = moduleService.getParentModules();
        }
        model.addAttribute("modules", allModules);
        return "welcome";
    }

    @RequestMapping("/home")
    public String redirect() {
        return "redirect:/";
    }


    @RequestMapping("/edit/{id}")
    public ModelAndView showEditModulePage(@PathVariable(name = "id") Long id) {
        ModelAndView mav = new ModelAndView("editModule");
        Module module = moduleService.get(id);
        mav.addObject("module", module);
        return mav;
    }

    @RequestMapping(value = "/add/parentId={id}")
    public String addNewChildModule(Model model,
                                    @PathVariable Long id) {

        final Module parentModule = moduleService.get(id);
        try {
            if (parentModule.getType() == 3) {
                return "redirect:/";
            }
        } catch (EntityNotFoundException e) {
            return "redirect:/";
        }

        Module module = new Module();
        module.setParentId(id);
        module.setType(parentModule.getType() + 1);
        model.addAttribute("module", module);
        return "addModule";
    }

    @RequestMapping(value = "/add/parentId={id}", method = RequestMethod.POST)
    public String saveNewChildModule(@ModelAttribute("module") Module module) {
        moduleService.saveModule(module);
        return "redirect:/";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String saveModuleInfo(@ModelAttribute("module") Module module) {
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
        moduleService.saveModule(module);
        return "redirect:/";
    }

}