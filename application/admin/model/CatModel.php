<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-16
 * Time: 下午5:44
 */
namespace app\admin\model;
use think\Model;

class CatModel extends Model{
    /*
    * 栏目表
     */
    protected $table = 'fh_cat';
    
    /*
     * 获取栏目
     */
    public function getCat(){
        return $this->field('c_id,c_name')->where('c_show',1)->select();
    }

    /*
     * 新增栏目
     */
    public function addCat($data){
        return $this->save($data);
    }

    /*
     * 查询
     */
    public function selectCat(){
        return $this->order('c_id desc')->select();
    }

    /*
     * 查询指定id的栏目
     */
    public function getOneCat($id){
        return $this->where('c_id',$id)->find();
    }

    /*
     * 删除指定id的栏目
     */
    public function delCat($id){
      return $this->where('c_id',$id)->delete();
    }
}
