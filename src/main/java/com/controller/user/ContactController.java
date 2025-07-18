package com.controller.user;

import com.entity.user.Contact;
import com.service.emailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class ContactController {
    @Autowired
    private emailService emailService;

    @GetMapping("/contact")
    public String contact() {
        return "user/contact/contact";
    }
    @PostMapping("/contact/send")
    public String sendContact(@ModelAttribute Contact contact, RedirectAttributes redirectAttributes){
        emailService.sendMail("phamtranthuan2003@gmail.com", contact);
        redirectAttributes.addFlashAttribute("message", "Gửi thông tin liên hệ thành công!");
        return "redirect:/user/contact";
    }
}

