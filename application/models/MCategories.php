<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class MCategories extends CI_Model
{
    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
    }

    function getCategory($cond, $id, $table)
    {
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($cond, $id);
        $this->db->where('isActive', 1);
        $this->db->order_by('sorting', 'asc');
        $query = $this->db->get();
        return $query->result();
    }

    function getCategoryOne()
    {
        $this->db->select('*');
        $this->db->from('product_hierarchy_one');
        $this->db->where('product_hierarchy_one.isActive', 1);
        $this->db->order_by('product_hierarchy_one.sorting', 'asc');
        $query = $this->db->get();
        return $query->result();
    }

    function getCategoryTwo($idOne)
    {
        $this->db->select('*');
        $this->db->from('product_hierarchy_two');
        $this->db->where('level_id_one', $idOne);
        $this->db->where('isActive', 1);
        $this->db->order_by('sorting', 'asc');
        $query = $this->db->get();
        return $query->result();
    }

    function getCategoryThree($idTwo)
    {
        $this->db->select('*');
        $this->db->from('product_hierarchy_three');
        $this->db->where('level_id_two', $idTwo);
        $this->db->where('isActive', 1);
        $this->db->order_by('sorting', 'asc');
        $query = $this->db->get();
        return $query->result();
    }

    function getCategoryFour($idOne)
    {
        $this->db->select('*');
        $this->db->from('product_hierarchy_two');
        $this->db->where('level_id_one', $idOne);
        $this->db->where('isActive', 1);
        $this->db->order_by('sorting', 'asc');
        $query = $this->db->get();
        return $query->result();
    }

    function getCategoryFive($idOne)
    {
        $this->db->select('*');
        $this->db->from('product_hierarchy_two');
        $this->db->where('level_id_one', $idOne);
        $this->db->where('isActive', 1);
        $this->db->order_by('sorting', 'asc');
        $query = $this->db->get();
        return $query->result();
    }

    function getCategorySix($idOne)
    {
        $this->db->select('*');
        $this->db->from('product_hierarchy_two');
        $this->db->where('level_id_one', $idOne);
        $this->db->where('isActive', 1);
        $this->db->order_by('sorting', 'asc');
        $query = $this->db->get();
        return $query->result();
    }

    function checkCategory($name, $level)
    {
        $this->db->select('*');
        $this->db->from('category');
        $this->db->where('cat_name', $name);
        $this->db->where('cat_level', $level);
        $this->db->where('isActive', 1);
        $query = $this->db->get();
        return $query->result();
    }

    function getCategories($id, $level)
    {
        $this->db->select('*');
        $this->db->from('category');
        if (isset($id) && $id != '') {
            $this->db->where('idParent', $id);
        }
        $this->db->where('cat_level', $level);
        $this->db->where('isActive', 1);
        $this->db->order_by('sort_order', 'asc');
        $query = $this->db->get();
        return $query->result();
    }

    function getCategoriesAttribute($catArray,$idProduct)
    {
        if (isset($catArray) && $catArray != '') {
            $whereclause = '';
            $this->db->select('category_attribute.idCategory,
	category_attribute.idAttribute, 
	attribute.attribute_name,
	product_attribute.attribute_value');
            $this->db->from('category_attribute');
            $this->db->join('attribute', 'category_attribute.idAttribute = attribute.idAttribute', 'left');
            $this->db->join('product_attribute', 'attribute.idAttribute = product_attribute.idAttribute', 'left');

            foreach ($catArray as $key => $idCategory) {
                if ($key == 0) {
                    $whereclause .= 'category_attribute.idCategory=' . $idCategory;
                } else {
                    $whereclause .= ' or category_attribute.idCategory=' . $idCategory;
                }

            }
            $this->db->where('category_attribute.isActive', 1);
            $this->db->where(' ( product_attribute.idProduct="'.$idProduct.'"  or product_attribute.idProduct is null)' );
            $this->db->where(' ( '.$whereclause.' ) ');
            $query = $this->db->get();
            return $query->result();
        } else {
            return false;
        }
    }
}