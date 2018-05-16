<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-11
 * Time: 上午11:12
 */
 namespace app\admin\model;
 use think\Model;
 class UserModel extends Model{
     //链接表名
     protected $table = 'fh_user';


     /*
      * 根据用户名获取管理员信息
      * @params $name
      */
     public function findUserName($name){
         return $this->where('u_name',$name)->find();
     }

     /*
      * 添加用户
      */
     public function addUser($data){
         return $this->save($data);
     }

     /*
      * 获取所有用户
      */
     public function selectUser($uclass){
         return $this->field('u_id,u_name,u_logo,u_class,u_email,u_createtime,u_logintime,u_ip,u_num')->where('u_class','>=',$uclass)->order('u_id desc')->select();
     }

     /*
      * 获取单人的用户信息 
      */
     public function getUserInfo($id){
        return $this->field('u_id,u_class,u_email,u_logo')->where('u_id',$id)->find();
     }

     /*
      * 修改用户个人信息
      */
     public function editUser($data){
        return $this->update($data);
     }

     /* 
      * 删除用户
      */
     public function delUser($id){
        return $this->where('u_id',$id)->delete();
     }
 }
