<?php
/**
 * Opencart FirstDatae4api Payment Module - Admin
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@magentocommerce.com so we can send you a copy immediately.
 *
 * @category   Opencart
 * @package    Payment
 * @copyright  Copyright (c) 2010 Schogini Systems (http://www.schogini.in)
 * @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * @author     Gayatri S Ajith <gayatri@schogini.com>
 */
class ControllerPaymentFirstDatae4api extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('payment/firstdatae4api');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->load->model('setting/setting');
			
			$this->model_setting_setting->editSetting('firstdatae4api', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');
		$this->data['text_test'] = $this->language->get('text_test');
		$this->data['text_live'] = $this->language->get('text_live');
		$this->data['text_authorization'] = $this->language->get('text_authorization');
		$this->data['text_capture'] = $this->language->get('text_capture');		
		
		$this->data['entry_login'] = $this->language->get('entry_login');
		
		$this->data['entry_username'] = $this->language->get('entry_username');
		$this->data['entry_gatewayid'] = $this->language->get('entry_gatewayid');
		$this->data['entry_gatewaypasswd'] = $this->language->get('entry_gatewaypasswd');
		
		
		$this->data['entry_key'] = $this->language->get('entry_key');
		$this->data['entry_hash'] = $this->language->get('entry_hash');
		$this->data['entry_server'] = $this->language->get('entry_server');
		$this->data['entry_mode'] = $this->language->get('entry_mode');
		$this->data['entry_method'] = $this->language->get('entry_method');
		$this->data['entry_order_status'] = $this->language->get('entry_order_status');		
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['login'])) {
			$this->data['error_login'] = $this->error['login'];
		} else {
			$this->data['error_login'] = '';
		}
		
 		if (isset($this->error['username'])) {
			$this->data['error_username'] = $this->error['username'];
		} else {
			$this->data['error_username'] = '';
		}
		if (isset($this->error['gatewayid'])) {
			$this->data['error_gatewayid'] = $this->error['gatewayid'];
		} else {
			$this->data['error_gatewayid'] = '';
		}
		if (isset($this->error['gatewaypasswd'])) {
			$this->data['error_gatewaypasswd'] = $this->error['gatewaypasswd'];
		} else {
			$this->data['error_gatewaypasswd'] = '';
		}

 		if (isset($this->error['key'])) {
			$this->data['error_key'] = $this->error['key'];
		} else {
			$this->data['error_key'] = '';
		}

 		if (isset($this->error['hash'])) {
			$this->data['error_hash'] = $this->error['hash'];
		} else {
			$this->data['error_hash'] = '';
		}
		
  		$this->document->breadcrumbs = array();
   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);
   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_payment'),
      		'separator' => ' :: '
   		);
   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('payment/firstdatae4api', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		$this->data['action'] = $this->url->link('payment/firstdatae4api', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');	
		
		
		if (isset($this->request->post['firstdatae4api_login'])) {
			$this->data['firstdatae4api_login'] = $this->request->post['firstdatae4api_login'];
		} else {
			$this->data['firstdatae4api_login'] = $this->config->get('firstdatae4api_login');
		}
		
		if (isset($this->request->post['firstdatae4api_username'])) {
			$this->data['firstdatae4api_username'] = $this->request->post['firstdatae4api_username'];
		} else {
			$this->data['firstdatae4api_username'] = $this->config->get('firstdatae4api_username');
		}
		
		if (isset($this->request->post['firstdatae4api_gatewayid'])) {
			$this->data['firstdatae4api_gatewayid'] = $this->request->post['firstdatae4api_gatewayid'];
		} else {
			$this->data['firstdatae4api_gatewayid'] = $this->config->get('firstdatae4api_gatewayid');
		}
		
		if (isset($this->request->post['firstdatae4api_gatewaypasswd'])) {
			$this->data['firstdatae4api_gatewaypasswd'] = $this->request->post['firstdatae4api_gatewaypasswd'];
		} else {
			$this->data['firstdatae4api_gatewaypasswd'] = $this->config->get('firstdatae4api_gatewaypasswd');
		}
	
		if (isset($this->request->post['firstdatae4api_key'])) {
			$this->data['firstdatae4api_key'] = $this->request->post['firstdatae4api_key'];
		} else {
			$this->data['firstdatae4api_key'] = $this->config->get('firstdatae4api_key');
		}
		
		if (isset($this->request->post['firstdatae4api_hash'])) {
			$this->data['firstdatae4api_hash'] = $this->request->post['firstdatae4api_hash'];
		} else {
			$this->data['firstdatae4api_hash'] = $this->config->get('firstdatae4api_hash');
		}

		if (isset($this->request->post['firstdatae4api_server'])) {
			$this->data['firstdatae4api_server'] = $this->request->post['firstdatae4api_server'];
		} else {
			$this->data['firstdatae4api_server'] = $this->config->get('firstdatae4api_server');
		}
		
		if (isset($this->request->post['firstdatae4api_mode'])) {
			$this->data['firstdatae4api_mode'] = $this->request->post['firstdatae4api_mode'];
		} else {
			$this->data['firstdatae4api_mode'] = $this->config->get('firstdatae4api_mode');
		}
		
		if (isset($this->request->post['firstdatae4api_method'])) {
			$this->data['firstdatae4api_method'] = $this->request->post['firstdatae4api_method'];
		} else {
			$this->data['firstdatae4api_method'] = $this->config->get('firstdatae4api_method');
		}
		
		if (isset($this->request->post['firstdatae4api_order_status_id'])) {
			$this->data['firstdatae4api_order_status_id'] = $this->request->post['firstdatae4api_order_status_id'];
		} else {
			$this->data['firstdatae4api_order_status_id'] = $this->config->get('firstdatae4api_order_status_id'); 
		} 

		$this->load->model('localisation/order_status');
		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['firstdatae4api_geo_zone_id'])) {
			$this->data['firstdatae4api_geo_zone_id'] = $this->request->post['firstdatae4api_geo_zone_id'];
		} else {
			$this->data['firstdatae4api_geo_zone_id'] = $this->config->get('firstdatae4api_geo_zone_id'); 
		} 
		
		$this->load->model('localisation/geo_zone');
										
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['firstdatae4api_status'])) {
			$this->data['firstdatae4api_status'] = $this->request->post['firstdatae4api_status'];
		} else {
			$this->data['firstdatae4api_status'] = $this->config->get('firstdatae4api_status');
		}
		
		if (isset($this->request->post['firstdatae4api_sort_order'])) {
			$this->data['firstdatae4api_sort_order'] = $this->request->post['firstdatae4api_sort_order'];
		} else {
			$this->data['firstdatae4api_sort_order'] = $this->config->get('firstdatae4api_sort_order');
		}

		$this->template = 'payment/firstdatae4api.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/firstdatae4api')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		//if (!$this->request->post['firstdatae4api_login']) {
		//	$this->error['login'] = $this->language->get('error_login');
		//}
		
		if (!$this->request->post['firstdatae4api_username']) {
			$this->error['username'] = $this->language->get('error_username');
		}
		
		if (!$this->request->post['firstdatae4api_gatewayid']) {
			$this->error['gatewayid'] = $this->language->get('error_gatewayid');
		}
		
		if (!$this->request->post['firstdatae4api_gatewaypasswd']) {
			$this->error['gatewaypasswd'] = $this->language->get('error_gatewaypasswd');
		}
		
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>