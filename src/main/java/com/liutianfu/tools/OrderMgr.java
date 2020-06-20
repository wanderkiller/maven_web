package com.liutianfu.tools;

import com.liutianfu.tools.dao.OrderMySQLDAO;

public class OrderMgr {
    private static OrderMgr om = null;

    static {
        if (om == null) {
            om = new OrderMgr();
            om.setOrderDAO(new OrderMySQLDAO());
        }
    }

    private OrderMgr() {
    }

    private OrderMySQLDAO orderDAO = null;

    public void setOrderDAO(OrderMySQLDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    public static OrderMgr getInstance() {
        return om;
    }

    public void save(SalesOrder so) {
        orderDAO.save(so);
    }
}
