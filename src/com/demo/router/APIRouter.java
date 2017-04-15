package com.demo.router;

import com.jfinal.config.Routes;
import com.demo.api.*;

/**
 * @author malongbo
 */
public class APIRouter extends Routes {
    @Override
    public void config() {
     /*   //公共api
        add("/api", CommonAPIController.class);*/
        //用户相关
        add("/api/account", AccountAPIController.class);
        add("/api/file",FileAPIController.class);
        add("/api/getprofile",CommonAPIController.class);

    }
}
