<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-12
 * Time: 下午2:24
 */
  namespace app\index\model;
  use think\Model;

  class SayModel extends Model{
      /*
     * 定义说说表名
     */
      protected $table = 'fh_say';
      
      /*
       * 获取说说数量
       */
      public function sayNum(){
        return $this->count();
      }

      /*
       * 最新说说
       */
      public function newSay(){
        return $this->order('s_time desc')->limit(6)->select();
      }
      
      /*
       * 查询说说
       */
      public function selectSay($num,$page){
         return $this->order('s_id desc')->limit($num,$page)->select();
      }

      /*
       * 查询指定id的说说
       */
      public function sayDetail($id){
         return $this->where('s_id',$id)->find();
      }

      /*
       * 上一条说说
       */
      public function prevSay($id){
         return $this->order('s_id desc')->where('s_id > '.$id)->find();
      }

      /*
       * 下一条说说
       */
      public function nextSay($id){
         return $this->order('s_id desc')->where('s_id < '.$id)->find();
      }

      /*
       * 浏览量增加
       */
      public function addHit($id){
        return $this->where('s_id',$id)->setInc('s_hit');
      }

      /*
       * 评论量增加
       */
      public function addNum($id){
        return $this->where('s_id', $id)->setInc('s_num');
      } 
  }
