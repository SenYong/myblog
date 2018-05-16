<?php
   /**
 * Created by PhpStorm.
 * User: root
 * Date: 18-2-3
 * Time: 上午10:50
 */
 namespace app\admin\controller;
 use app\admin\model\UserModel;
 use think\Controller;
 
 class User extends Controller
 { 
    /*头像上传*/
    public function uploadImg(){
        if(request()->isPost()){
          $file = input('param.image');
          $url = explode(",", $file);
          strpos($url[0], 'png') ? $filename = md5(time()) . '.png' : $filename = md5(time()) . '.jpg';
          $imgurl = '/public/static/userImg/' . $filename;
          $filepath = ROOT_PATH . $imgurl;
          $url[1] = base64_decode(str_replace(" ", "+",$url[1]));
          if(file_put_contents($filepath, $url[1])){
            return json(['errcode'=>0, "msg"=>"图片上传成功", "filename"=>$imgurl]);
          }else{
            return json(['errcode'=>2, "msg"=>"图片上传不成功"]); 
          }
          
        }else{
            return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
    }

    /*添加用户*/
    public function addUser(){
        if(request()->isPost()){
            $data = input('param.');
            $data['u_password'] = md5(input('param.u_password'));
            $data['u_ip'] = request()->ip();
            $user = new UserModel();
            if($user->addUser($data)){
               return json(['errcode'=>0, "msg"=>"添加用户成功"]); 
            }else{
               return json(['errcode'=>2, "msg"=>"添加用户失败"]);
            }
            
        }else{
            return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
    }

    /*
     * 获取用户列表
     */
    public function selectUser(){
       if(request()->isPost()){
         $uclass = input('param.uclass');
         $user = new UserModel();
         $data = $user->selectUser($uclass);
         if($data != null){
            return json(['errcode'=>0, "msg"=>"获取用户列表成功", 'data'=>$data]);
         }else{
            return json(['errcode'=>2, "msg"=>"获取用户列表失败"]);
         }
       }else{
         return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
    }

    /*
     *  获取个人用户信息
     */
    public function getOneUser(){
        if(request()->isPost()){
           $id = input('param.id');
           $user = new UserModel();
           $info = $user->getUserInfo($id);
           if($info){
             return json(['errcode'=>0, "msg"=>"获取用户信息成功", 'data'=>$info]);
           }else{
             return json(['errcode'=>2, "msg"=>"获取用户信息失败"]);
           }
        }else{
           return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
    }
    
    /*
     * 修改用户个人信息
     */
    public function updateUser(){
        if(request()->isPost()){
           $data = input('param.');
           $user = new UserModel();
           if($user->editUser($data)){
              return json(['errcode'=>0, 'msg'=>'修改用户信息成功']);
           }else{
              return json(['errcode'=>2, 'msg'=>'修改用户信息失败']);
           }
        }else{
            return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
    }

    /*
     * 删除用户
     */
     public function deleteUser(){
        if(request()->isPost()){
           $id = input('param.id');
           $user = new UserModel();
           if($user->delUser($id)){
              return json(['errcode'=>0, "msg"=>"删除成功"]);
           }else{
              return json(['errcode'=>2, "msg"=>"删除失败"]);
           }
        }else{
            return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
        }
     }
 }
?>