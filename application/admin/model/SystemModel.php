<?php
  /**
 * Created by PhpStorm.
 * User: root
 * Date: 18-02-07
 * Time: 下午10:06
 */
  namespace app\admin\model;
  use think\Model;
  
  class SystemModel extends Model
  {
     /*
      * 定义系统设置表
      */
     protected $table = 'fh_system';

     /*
      * 添加系统设置
      */
     public function addSystem($data){
        return $this->save($data);
     }

     /*
      * 获取系统设置列表
      */
     public function selectSystem(){
        return $this->select();
     }

     /*
      * 获取系统设置详情
      */
     public function getOne($id){
        return $this->where('id',$id)->find();
     }

     /*
      * 修改系统详情
      */
     public function updateSystem($data){
        return $this->update($data);
     }

     public function delSystem($id){
        return $this->where('id',$id)->delete();
     }
  } 
?>