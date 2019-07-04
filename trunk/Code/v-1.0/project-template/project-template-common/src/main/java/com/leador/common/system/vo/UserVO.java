package com.leador.common.system.vo;

import com.leador.common.system.domain.UserDO;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserVO {
    /**
     * 更新的用户对象
     */
    private UserDO userDO = new UserDO();
    /**
     * 旧密码
     */
    private String pwdOld;
    /**
     * 新密码
     */
    private String pwdNew;
}
