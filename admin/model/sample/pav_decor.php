<?php 
if( !class_exists("ModuleSample") ) {
	class ModuleSample { 
		public static function getModules(){ 
			$modules = array(
				'banner',
				'category',
				'featured',
				'bestseller',
				'pavblogcategory',
				'pavblogcomment',
				'pavbloglatest',
				'pavcustom',
				'pavproductcarousel',
				'pavsliderlayer',
				'pavmegamenu',
				'pavgallery',
				'pavfacebook'
			);
			
			return $modules;
		}
		
		public static function getModulesQuery(){
			$query = array();
			require( dirname(__FILE__).'/pav_decor_query.php' );
			return $query;
		}
		
		public static function installCustomSetting( $m ){
			
				$d['pavblog'] = array(
							'children_columns' => '3',
							'general_cwidth' => '250',
							'general_cheight' => '130',
							'general_lwidth'=> '600',
							'general_lheight'=> '250',
							'general_sheight'=> '140',
							'general_swidth'=> '300',
							'general_xwidth' => '120',
							'general_xheight' => '70',
							'cat_show_hits' => '1',
							'cat_limit_leading_blog'=> '1',
							'cat_limit_secondary_blog'=> '3',
							'cat_leading_image_type'=> 's',
							'cat_secondary_image_type'=> 's',
							'cat_show_title'=> '1',
							'cat_show_image'=> '1',
							'cat_show_author'=> '1',
							'cat_show_category'=> '1',
							'cat_show_created'=> '1',
							'cat_show_readmore' => 1,
							'cat_show_description' => '1',
							'cat_show_comment_counter'=> '1',

							'blog_image_type'=> 's',
							'blog_show_title'=> '1',
							'blog_show_image'=> '1',
							'blog_show_author'=> '1',
							'blog_show_category'=> '1',
							'blog_show_created'=> '1',
							'blog_show_comment_counter'=> '1',
							'blog_show_comment_form'=>'1',
							'blog_show_hits' => 1,
							'cat_columns_leading_blog'=> 1,
							'cat_columns_leading_blogs'=> 1,
							'cat_columns_secondary_blogs' => 1,
							'comment_engine' => 'local',
							'diquis_account' => 'pavothemes',
							'facebook_appid' => '100858303516',
							'facebook_width'=> '600',
							'comment_limit'=> '10',
							'auto_publish_comment'=>0,
							'enable_recaptcha' => 1,
							'recaptcha_public_key'=>'6LcoLd4SAAAAADoaLy7OEmzwjrf4w7bf-SnE_Hvj',
							'recaptcha_private_key'=>'6LcoLd4SAAAAAE18DL_BUDi0vmL_aM0vkLPaE9Ob',
							'rss_limit_item' => 12,
							'keyword_listing_blogs_page'=>'blogs'

				);

				$m->load->model('setting/setting');
				$m->model_setting_setting->editSetting('pavblog', $d );	
		}
		public static function getStoreConfigs(){
			return array(
					'config_image_category_width' => 900,
					'config_image_category_height' => 350,
					
					'config_image_thumb_width' => 500,
					'config_image_thumb_height' => 550,
					
					'config_image_popup_width' => 500,
					'config_image_popup_height' => 550,
					
					'config_image_product_width' => 300,
					'config_image_product_height' => 330,
					
					'config_image_additional_width' =>91,
					'config_image_additional_height' => 101,
					
					'config_image_related_width' => 300,
					'config_image_related_height' => 330,
					
					'config_image_compare_width' => 70,
					'config_image_compare_height' => 77,
					
					'config_image_wishlist_width' => 70,
					'config_image_wishlist_height' => 77,
					
					'config_image_cart_width' => 70,
					'config_image_cart_height' => 77,
			);
		}
	
	}
}
?>