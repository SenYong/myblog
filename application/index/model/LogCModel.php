<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-16
 * Time: 下午12:23
 */
namespace app\index\model;
use think\Model;

class LogCModel extends Model{
    /*
     * 定义日志表名
     */
    protected $table = "fh_log_c";
    
    /*
      * 获取日志所有用户评论
      */
    public function getAllLogUser($id){
        return $this->join('fh_log', $this->table . '.lc_pid=' . 'fh_log.l_id')->where('lc_pid',$id)->select();
    }

    /*
     * 新增评论
     */
    public function userLogComment($data){
        return $this->save($data);
    }
}