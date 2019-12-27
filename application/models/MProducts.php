<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

/**
 * Created by PhpStorm.
 * User: shahroz.khan
 * Date: 23/10/2018
 * Time: 4:23 PM
 */
class MProducts extends CI_Model
{
    function __construct()
    {
        /* Call the Model constructor */
        parent::__construct();
        $this->load->database();
    }


    function getProducts($searchdata)
    {
        $start = 0;
        $length = 25;
        if (isset($searchdata['start']) && $searchdata['start'] != '' && $searchdata['start'] != null) {
            $start = $searchdata['start'];
        }
        if (isset($searchdata['length']) && $searchdata['length'] != '' && $searchdata['length'] != null) {
            $length = $searchdata['length'];
        }
        $this->db->select('*');
        $this->db->from('products');
        $this->db->where('products.isActive', 1);

        if (isset($searchdata['isMaster']) && $searchdata['isMaster'] != '' && $searchdata['isMaster'] != null) {
            $this->db->where('products.isMaster', $searchdata['isMaster']);
        }

        if (isset($searchdata['search']) && $searchdata['search'] != '' && $searchdata['search'] != null) {
            $search = $searchdata['search'];
            $this->db->where(' ( products.sku_code like "%' . $search . '%"
             or products.productName like "%' . $search . '%" 
             or products.description like "%' . $search . '%" 
             or products.short_description like "%' . $search . '%" ) 
             ');
            /* $this->db->orWhere('products.productName', 'like', '%' . $search . '%');
             $this->db->orWhere('products.`desc`', 'like', '%' . $search . '%');
             $this->db->orWhere('products.shortdesc', 'like', '%' . $search . '%');*/
        }
        if (isset($searchdata['orderby']) && $searchdata['orderby'] != '' && $searchdata['orderby'] != null) {
            $this->db->order_By($searchdata['orderby'], $searchdata['ordersort']);
        }

        $this->db->limit($length, $start);
        $query = $this->db->get();
        return $query->result();
    }

    function getCntTotalProducts($searchdata)
    {
        if (isset($searchdata['search']) && $searchdata['search'] != '' && $searchdata['search'] != null) {
            $search = $searchdata['search'];
            $this->db->where(' ( products.sku_code like "%' . $search . '%"
             or products.productName like "%' . $search . '%" 
             or products.description like "%' . $search . '%" 
             or products.short_description like "%' . $search . '%"  ) 
             ');
        }
        $this->db->select('count(idProduct) as cnttotal');
        $this->db->from('products');
        $this->db->where('products.isActive', 1);
        if (isset($searchdata['isMaster']) && $searchdata['isMaster'] != '' && $searchdata['isMaster'] != null) {
            $this->db->where('products.isMaster', $searchdata['isMaster']);
        }
        $query = $this->db->get();
        return $query->result();
    }


    function checkProduct($sku_code)
    {
        $this->db->select('sku_code');
        $this->db->from('products');
        $this->db->where('products.sku_code', $sku_code);
        $this->db->where('products.isActive', 1);
        $query = $this->db->get();
        return $query->result();
    }

    function editProduct($idProduct)
    {
        /* SELECT
	products.idProduct,
	products.sku_code,
	products.productName,
	product_category.idProduct,
	product_category.level_one,
	product_category.level_two,
	product_category.level_three,
	product_category.level_four,
	product_category.level_five,
	product_category.level_six,
	product_hierarchy_one.`name`,
	product_hierarchy_two.`name`,
	product_hierarchy_three.`name`,
	product_hierarchy_four.`name`,
	product_hierarchy_five.`name`,
	product_hierarchy_six.`name`
FROM
	products
	LEFT JOIN product_category ON products.idProduct = product_category.idProduct
	LEFT JOIN product_hierarchy_one ON product_category.level_one = product_hierarchy_one.idCategoryOne
	LEFT JOIN product_hierarchy_two ON product_category.level_two = product_hierarchy_two.id
	LEFT JOIN product_hierarchy_three ON product_category.level_three = product_hierarchy_three.id
	LEFT JOIN product_hierarchy_four ON product_category.level_four = product_hierarchy_four.id
	LEFT JOIN product_hierarchy_five ON product_category.level_five = product_hierarchy_five.id
	LEFT JOIN product_hierarchy_six ON product_category.level_six = product_hierarchy_six.id
WHERE
	products.idProduct = 333

        SELECT * FROM `product_custom_field` where idProduct=333*/
        $this->db->select('	products.idProduct,
	products.sku_code,
	products.productName,
	products.short_description,
	products.description,
	products.link,
	products.price,
	products.cost,
	products.manufacturer,
	products.upc,
	products.upc_dev,
	products.`condition`,
	products.image_link,
	products.category,
	products.weight,
	products.meta_title,
	products.meta_description,
	products.product_stats,
	products.isMaster,
	product_category.level_one,
    product_category.level_two,
    product_category.level_three,
    product_category.level_four,
    product_category.level_five,
    product_category.level_six,
	a.cat_name as categoryone,
	b.cat_name  as categorytwo,
	c.cat_name  as categorythree,
	d.cat_name  as categoryfour,
	e.cat_name  as categoryfive,
	f.cat_name as categorysix');
        $this->db->from('products');
        $this->db->join('product_category', 'products.idProduct = product_category.idProduct', 'left');
        $this->db->join('category a', 'product_category.level_one = a.idCategory', 'left');
        $this->db->join('category b', 'product_category.level_two = b.idCategory', 'left');
        $this->db->join('category c', 'product_category.level_three = c.idCategory', 'left');
        $this->db->join('category d', 'product_category.level_four = d.idCategory', 'left');
        $this->db->join('category e', 'product_category.level_five = e.idCategory', 'left');
        $this->db->join('category f', 'product_category.level_six = f.idCategory', 'left');
        $this->db->where('products.idProduct', $idProduct);
        $query = $this->db->get();
        return $query->result();
    }
}
