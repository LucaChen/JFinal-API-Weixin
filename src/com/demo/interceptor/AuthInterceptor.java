/*
package com.demo.interceptor;

import org.omg.PortableInterceptor.Interceptor;
import com.jfinal.core.Controller;
import com.demo.model.User
*/
/**
 * Created by Administrator on 2016/7/15.
 *//*

public class AuthInterceptor implements Interceptor {
    public void intercept(ActionIn ai) {
        Controller controller = ai.getController();
        User loginUser = controller.getSessionAttr("loginUser");
        if (loginUser != null && loginUser.canVisit(ai.getActionKey()))
            ai.invoke();
        else
            controller.redirect("/login.html");

    }
}
*/
