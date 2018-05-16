<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-16
 * Time: 下午12:23
 */
namespace app\index\model;
use think\Model;

class LogModel extends Model{
    /*
     * 定义日志表名
     */
    protected $table = "fh_log";
    
    /*
     * 最新日志
     */
    public function newLog(){
        return $this->order('l_time desc')->limit(6)->select();
    }

    /*
     * 获取文章详情
     */
    public function logDetail($id){
        return $this->where('l_id',$id)->find(); 
    }

    /*
     * 上一篇文章
     */
    public function prevLog($id){
       return $this->order('l_id desc')->where('l_id < '.$id)->find();
    }

    /*
     * 下一篇文章
     */
    public function nextLog($id){
       return $this->where('l_id > '.$id)->find();
    }

    /*
     * 评论量增加
     */
    public function addNum($id){
        return $this->where('l_id',$id)->setInc("l_num");
    }
}