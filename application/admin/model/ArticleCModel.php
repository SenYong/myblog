<?php
  /**
 * Created by PhpStorm.
 * User: root
 * Date: 18-02-27
 * Time: 下午14:10
 */
 namespace app\admin\model;
 use think\Model;

 class ArticleCModel extends Model
 {
    /*
     * 定义文章评论表名
     */
    protected $table = 'fh_article_c';

    /*
     * 获取评论总量
     */
    public function artcNum(){
        return $this->count();
    }

    /*
     * 文章评论回复
    */
    public function replyArts($data){
        return $this->update($data);
    } 

    /*
     * 新增评论
     */
    public function addUserComment($data){
        return $this->save($data);
    }

    /*
      * 获取文章所有用户评论
      */
    public function getAllUser($id){
        return $this->join('fh_article', $this->table . '.ac_pid=' . 'fh_article.a_id')->where('ac_pid',$id)->select();
    }
 }
?>