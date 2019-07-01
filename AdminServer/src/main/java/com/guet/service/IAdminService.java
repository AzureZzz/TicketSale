package com.guet.service;

import com.guet.entity.Admin;

public interface IAdminService {

    Admin login(String username, String password) throws Exception;

    void updatePassword(Long aId,String newPassword) throws Exception;

    boolean authPassword(Long Id,String password) throws Exception;

    Admin getAdminInfo(Long aId)throws Exception;
}
