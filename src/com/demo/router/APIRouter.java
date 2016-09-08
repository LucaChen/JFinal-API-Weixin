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
        //器材相关
        add("/api/equipment",EquipmentAPIController.class);
        //仓储相关
        add("/api/storage",StorageAPIController.class);
        //申请单相关
        add("/api/requisiton",RequirationAPIController.class);
        //器材状态相关
        add("/api/equipments",EquipmentsAPIController.class);
        //入库相关
        add("api/stockin",StockinAPIController.class);
        //出库相关
        add("api/stockout",StockoutAPIController.class);
    }
}
