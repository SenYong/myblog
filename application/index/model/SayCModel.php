<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-03-03
 * Time: 下午2:00
 */
  namespace app\index\model;
  use think\Model;

  class SayCModel extends Model{
      /*
     * 定义说说表名
     */
      protected $table = 'fh_say_c';
      
     /*
      * 获取指定id的所以用户评论
      */
     public function getAllUser($id){
        return $this->where('sc_pid',$id)->select();
     }

     /*
      * 用户评论
      */
     public function userSayComment($data){
        return $this->save($data);
     }
  }
