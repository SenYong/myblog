<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-12
 * Time: 下午2:24
 */
  namespace app\admin\model;
  use think\Model;

  class SayModel extends Model{
      /*
     * 定义说说表名
     */
      protected $table = 'fh_say';

      /*
       *获取发布说说数量
       */
      public function sayNum(){
          return $this->count();
      }

      /*
       * 新增说说
       */
      public function addSay($data){
         return $this->save($data);
      }

      /*
       * 获取所有说说
       */
      public function selectSay($num,$page){
         return $this->order('s_id desc')->limit($num,$page)->select();
      }

      /*
     * 获取单条说说
     */
    public function getOneSay($id){
        return $this->where('s_id', $id)->find();
    }

    /*
     * 修改说说
     */
    public function updateSay($data){
        return $this->update($data);
    }

    /*
     * 删除说说 
     */
    public function delSay($id){
       return $this->where('s_id', $id)->delete();
    }

    /*
     * 获取说说评论列表
     */
    public function getArtComment(){
       return $this->join('fh_say_c', $this->table . '.s_id=' . 'fh_say_c.sc_pid')->order('s_id desc')->select();
    }

    /*
     * 获取单个文章评论
     */
    public function getOneArtComment($id){
        return $this->join('fh_say_c', $this->table . '.s_id=' . 'fh_say_c.sc_pid')->where('sc_id',$id)->find();
    }
  }
