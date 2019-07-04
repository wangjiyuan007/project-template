package com.leador.system.controller;

import com.leador.common.system.domain.MenuDO;
import com.leador.common.system.domain.Tree;
import com.leador.common.system.utils.MD5Utils;
import com.leador.common.system.utils.R;
import com.leador.common.system.utils.ShiroUtils;
import com.leador.data.system.annotation.Log;
import com.leador.data.system.service.MenuService;
import com.leador.data.system.service.RoleService;
import com.leador.data.system.service.UserRoleService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>Title: LoginController</p>
 * <p>Description: 登录控制</p>
 * <p>Company: www.leador.com.cn</p>
 * <p>Date: 2018年10月25日 上午11:22:46</p>
 *
 * @author XiaShenBao
 * @version 1.0
 */
@Controller
public class LoginController extends BaseController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MenuService menuService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService userRoleService;

    /**
     * <p>Title: logout</p>
     * <p>Description: 退出登录</p>
     * <p>Date: 2018年10月30日 上午9:07:00</p>
     *
     * @return
     */
    @GetMapping("/logout")
    String logout() {
        ShiroUtils.logout();
        return "redirect:/login";
    }

    @GetMapping("/")
    String welcome(Model model) {
        return "redirect:/login";
    }

    @Log("请求访问主页")
    @GetMapping({"/index"})
    String index(Model model) {
        List<Tree<MenuDO>> menus = menuService.listMenuTree(getUserId());
        model.addAttribute("menus", menus);
        model.addAttribute("name", getUser().getName());
        model.addAttribute("picUrl", "/img/photo_s.jpg");
        model.addAttribute("username", getUser().getUsername());

        return "index";
    }

    @GetMapping("/login")
    String login() {
        return "login";
    }

    @Log("登录")
    @PostMapping("/login")
    @ResponseBody
    R ajaxLogin(String username, String password) {
        password = MD5Utils.encrypt(username, password);
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            return R.ok();
        } catch (AuthenticationException e) {
            return R.error("用户或密码错误");
        }
    }

    @GetMapping("/main")
    String main() {
        return "main";
    }

}
