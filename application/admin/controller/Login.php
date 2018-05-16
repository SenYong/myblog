<?php
   namespace app\admin\controller;
   use app\admin\model\UserModel;
   use think\Controller;
   /*
    * 登录
    */
   class Login extends Controller
   {
       public function doLogin(){
          if(request()->isPost()){
               $username = input('param.username');
               $password = input('param.password');
               $userModel = new UserModel();
               $hasUser = $userModel->findUserName($username);
               if(empty($hasUser)){
                   $data['u_name'] = $username;
                   $data['u_password'] = md5($password);
                   $data['u_logo'] = '/public/uploadImg/default.png';
                   $data['u_class'] = 3;
                   $data['u_createtime'] = time();
                   $data['u_ip'] = request()->ip();
                   $data['u_root'] = '自动创建';
                   if($userModel->addUser($data)){
                      return json(['errcode'=>2, "msg"=>"用户自动创建成功", "username"=>$data['u_name'], "logo"=>$data['u_logo'], "class"=>$data['u_class']]);
                   }else{
                      return json(['errcode'=>3, "msg"=>"用户自动创建失败"]);
                   }
               }
               if(md5($password) != $hasUser['u_password']){
                   return json(['errcode'=>4, 'msg'=>'密码错误']);
               }
               return json(['errcode'=>0, 'msg'=>'登录成功', 'username'=>$hasUser['u_name'], 'logo'=>$hasUser['u_logo'], 'class'=>$hasUser['u_class']]);
          }else{
               return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
          }
       }

       public function verify(){
          $config = ['codeSet'=>'2345678', 'fontSize'=>16, 'imageH'=>32, 'imageW'=>100, 'length'=>4];
          return captcha($id='',$config);
       }
   }

