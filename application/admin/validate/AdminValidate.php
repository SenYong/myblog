<?php
   namespace app\admin\validate;
   use think\Validate;
   /**
   * 登陆验证
   */
   class AdminValidate extends Validate
   {
   	 protected $rule = [
   	     ['u_name', 'require', '用户名不能为空'],
   	     ['u_password', 'require', '密码不能为空']
   	 ];
   }
?>