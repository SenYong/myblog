<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-16
 * Time: 下午12:18
 */
namespace app\index\model;
use think\Model;

class SystemModel extends Model{
    /*
     * 定义文章表名
     */
    protected $table = "fh_system";

    /*
     * 获取个人信息
     */
    public function getInfo(){
       return $this->limit(1)->select();
    }
    
    public function addHit($id){
       return $this->where('id',$id)->setInc('hit');
    }

}