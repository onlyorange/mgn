<?php  
class ControllerModulePavfacebook extends Controller {
	protected function index($setting) {
		static $module = 0;
		$this->language->load('module/pavfacebook');
		$this->data = $setting;
		$this->data['displaylanguage'] = $this->language->get('code');
	
		$this->data['heading_title'] = $this->language->get('heading_title');
	
		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pavfacebook.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/pavfacebook.tpl';
		} else {
			$this->template = 'default/template/module/pavfacebook.tpl';
		}
		
		$this->render();
	}
}
?>