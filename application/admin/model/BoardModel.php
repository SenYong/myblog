<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-16
 * Time: 下午2:18
 */
namespace app\admin\model;
use think\Model;

class BoardModel extends Model{
    /*
     * 定义留言板表
     */
    protected $table = 'fh_board';

    /*
     * 获取留言数量
     */
    public function boardNum(){
        return $this->count();
    }

    /*
     * 获取日志评论列表
     */
    public function getBoardComment(){
        return $this->order('b_id desc')->select();
    }

    /*
    * 获取单个留言内容
    */
   public function getOneBoardComment($id){
       return $this->where('b_id',$id)->find();
   }

   /*
    * 留言板回复
    */
   public function replyBoards($data){
      return $this->update($data);
   }
}