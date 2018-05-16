<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-03-03
 * Time: 下午15:52
 */
namespace app\index\model;
use think\Model;

class BoardModel extends Model{
    /*
     * 定义文章表名
     */
    protected $table = "fh_board";
    
    public function addComment($data){
       return $this->save($data);
    }
    /*
     * 获取用户评论
     */
    public function getUserList(){
        return $this->order('b_id desc')->select();
    }
}