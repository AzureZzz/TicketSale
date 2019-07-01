package com.guet.service.impl;

import com.guet.dao.UserBaseMapper;
import com.guet.entity.UserBase;
import com.guet.service.IUserService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserBaseMapper userBaseMapper;

    @Override
    public int getAllCount() throws Exception {
        return userBaseMapper.selectAllCount();
    }

    @Override
    public List<UserBase> getUserBases(int page, int limit,String keyWord) throws Exception{
        if(keyWord.equals("") || keyWord == null){
            return userBaseMapper.selectAllUserBase((page-1)*limit,limit);
        }else {
            return userBaseMapper.selectUserBaseKey((page-1)*limit,limit,keyWord);
        }
    }

    @Override
    public void updatePassword(Long uId, String newPassword) throws Exception {
        UserBase userBase = new UserBase();
        userBase.setuId(uId);
        userBase.setPassword(ServiceUtils.md5(newPassword.trim()));
        userBaseMapper.updateByPrimaryKeySelective(userBase);
    }

    @Override
    public void deleteUser(Long uId) throws Exception {
        userBaseMapper.deleteByPrimaryKey(uId);
    }
}
