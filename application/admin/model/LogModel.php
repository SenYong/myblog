<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-16
 * Time: 下午12:23
 */
namespace app\admin\model;
use think\Model;

class LogModel extends Model{
    /*
     * 定义日志表名
     */
    protected $table = "fh_log";

    /*
     * 获取发布日志数量
     */
    public function LogNum(){
        return $this->count();
    }

    /*
     * 新增日志
     */
    public function addLog($data){
       return $this->save($data);
    }

    /*
     * 获取所有日志
     */
    public function selectLog($num, $page){
        return $this->order('l_id desc')->limit($num, $page)->select();
    }

    /* 
     * 获取单条日志详情
     */
    public function getOneLog($id){
        return $this->where('l_id',$id)->find();
    }

    /*
     * 修改日志
     */
    public function updateLog($data){
        return $this->update($data);
    }

    /*
     * 删除日志
     */
    public function delLog($id){
        return $this->where('l_id',$id)->delete();
    }

    /*
     * 获取日志评论列表
     */
    public function getLogComment(){
        return $this->join('fh_log_c', $this->table . '.l_id=' . 'fh_log_c.lc_pid')->order('l_id desc')->select();
    }

     /*
     * 获取单个日志评论
     */
    public function getOneLogComment($id){
        return $this->join('fh_log_c', $this->table . '.l_id=' . 'fh_log_c.lc_pid')->where('lc_id',$id)->find();
    }

    /*
     * 浏览量增加
     */
    public function addHit($id){
        return $this->where('l_id',$id)->setInc("l_hit");
    }
}