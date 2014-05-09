<?php  
class ControllerModulePavgallery extends Controller {
	protected function index($setting) {
		static $module = 0;
		$this->load->model('tool/image');
	
		$this->language->load('module/pavgallery');
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/pavgallery.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/pavgallery.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/pavgallery.css');
		}
		
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox.js');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
	
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['banners'] = array();
		
				if (isset($setting['banner_id'])) {
					$this->load->model('design/banner');
					$results = $this->model_design_banner->getBanner($setting['banner_id']);
					  
					foreach ($results as $result) {
						if (file_exists(DIR_IMAGE . $result['image'])) {
							$t = array(
								'title' => $result['title'],
								'link'  => $result['link'],
								
								'thumb' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
							);
							
							
							if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
								$t['image'] = $this->config->get('config_ssl') . 'image/' .  $result['image'];
							} else {
								$t['image'] =  $this->config->get('config_url') . 'image/' .  $result['image'];
							}	
							
							$this->data['banners'][] = $t;
						}
					}
				}


		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pavgallery.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/pavgallery.tpl';
		} else {
			$this->template = 'default/template/module/pavgallery.tpl';
		}
		
		$this->render();
	}
}
?>