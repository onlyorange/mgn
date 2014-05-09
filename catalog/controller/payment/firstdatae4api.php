<?php
/**
 * Opencart FirstDatae4api Payment Module - Catalog
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
	protected function index() {
		$this->language->load('payment/firstdatae4api');
		
		$this->data['text_credit_card'] = $this->language->get('text_credit_card');
		$this->data['text_wait'] = $this->language->get('text_wait');
		
		$this->data['entry_cc_owner'] = $this->language->get('entry_cc_owner');
		$this->data['entry_cc_number'] = $this->language->get('entry_cc_number');
		$this->data['entry_cc_expire_date'] = $this->language->get('entry_cc_expire_date');
		$this->data['entry_cc_cvv2'] = $this->language->get('entry_cc_cvv2');
		
		$this->data['button_confirm'] = $this->language->get('button_confirm');
		$this->data['button_back'] = $this->language->get('button_back');
		
		$this->data['months'] = array();
		
		for ($i = 1; $i <= 12; $i++) {
			$this->data['months'][] = array(
				'text'  => strftime('%B', mktime(0, 0, 0, $i, 1, 2000)), 
				'value' => sprintf('%02d', $i)
			);
		}
		
		$today = getdate();

		$this->data['year_expire'] = array();

		for ($i = $today['year']; $i < $today['year'] + 11; $i++) {
			$this->data['year_expire'][] = array(
				'text'  => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)),
				'value' => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)) 
			);
		}
		
		if ($this->request->get['route'] != 'checkout/guest_step_3') {
			$this->data['back'] = HTTPS_SERVER . 'index.php?route=checkout/payment';
		} else {
			$this->data['back'] = HTTPS_SERVER . 'index.php?route=checkout/guest_step_2';
		}
		
		$this->id = 'payment';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/firstdatae4api.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/firstdatae4api.tpl';
		} else {
			$this->template = 'default/template/payment/firstdatae4api.tpl';
		}	
		
		$this->render();		
	}
	
	public function send() {
		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		
		// Get the ISO 2 letter country code
		$this->load->model('localisation/country');
		$countries = $this->model_localisation_country->getCountries();
		$payment_country = $order_info['payment_country'];
		$shipping_country = $order_info['shipping_country'];
		foreach ($countries as $country) {
			if ($country['name'] == $order_info['payment_country']) {
				$payment_country = $country['iso_code_2'];
			}
			if ($country['name'] == $order_info['shipping_country']) {
				$shipping_country = $country['iso_code_2'];
			}
		}
		
        $data = array();
		$data['x_first_name'] 	= html_entity_decode($order_info['payment_firstname'], ENT_QUOTES, 'UTF-8');
		$data['x_last_name'] 	= html_entity_decode($order_info['payment_lastname'], ENT_QUOTES, 'UTF-8');
		$data['x_company'] 		= html_entity_decode($order_info['payment_company'], ENT_QUOTES, 'UTF-8');
		$data['x_address'] 		= html_entity_decode($order_info['payment_address_1'], ENT_QUOTES, 'UTF-8');
		$data['x_city'] 		= html_entity_decode($order_info['payment_city'], ENT_QUOTES, 'UTF-8');
		$data['x_state'] 		= html_entity_decode($order_info['payment_zone'], ENT_QUOTES, 'UTF-8');
		$data['x_zip'] 			= html_entity_decode($order_info['payment_postcode'], ENT_QUOTES, 'UTF-8');
		$data['x_country'] 		= html_entity_decode($payment_country, ENT_QUOTES, 'UTF-8');
		$data['x_phone'] 		= $order_info['telephone'];
		$data['x_customer_ip'] 	= $this->request->server['REMOTE_ADDR'];
		$data['x_email'] 		= html_entity_decode($order_info['email'], ENT_QUOTES, 'UTF-8');
		$data['x_description'] 	= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
		$data['x_amount'] 		= $this->currency->format($order_info['total'], $this->currency->getCode(), 1.00000, FALSE);
		$data['x_currency_code'] = $this->currency->getCode();
		$data['x_method'] 		= 'CC';
		$data['x_card_num'] 	= str_replace(' ', '', $this->request->post['cc_number']);	
		$data['x_exp_date']		= substr($this->request->post['cc_expire_date_month'],0,2) . substr($this->request->post['cc_expire_date_year'],-2);
		$data['x_card_code'] 	= $this->request->post['cc_cvv2'];
		
		$data['x_ship_to_first_name'] 	= html_entity_decode($order_info['shipping_firstname'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_last_name'] 	= html_entity_decode($order_info['shipping_lastname'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_address'] 		= html_entity_decode($order_info['shipping_address_1'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_city']			= html_entity_decode($order_info['shipping_city'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_state'] 		= html_entity_decode($order_info['shipping_zone'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_zip'] 			= html_entity_decode($order_info['shipping_postcode'], ENT_QUOTES, 'UTF-8');
		$data['x_ship_to_country'] 		= html_entity_decode($shipping_country, ENT_QUOTES, 'UTF-8');
		
		$data['x_comments'] = html_entity_decode($order_info['comment'], ENT_QUOTES, 'UTF-8');
		
		$old_version = false;
		$json_file = DIR_SYSTEM . 'library/json.php';
		if (file_exists($json_file)) {
			// version before 1.5.1.3
			$this->load->library('json');
			$old_version = true;
		} else {
			$old_version = false;
		}
		
		$username			= $this->config->get('firstdatae4api_username');
		$gatewayId			= $this->config->get('firstdatae4api_gatewayid');
		$gatewayPassword	= $this->config->get('firstdatae4api_gatewaypasswd');
		$isTest				= $this->config->get('firstdatae4api_mode');
				
		$order_status		= $this->config->get('firstdatae4api_method');
		$authNum			= '';
		$amount 			= str_replace(",", "", number_format($data['x_amount'], 2)); //Proper number format. No commas to avoid XML error					
		$expDate			= $data['x_exp_date'];
		
		$json 		= array();
		$response 	= array();
		switch ( $this->config->get('firstdatae4api_method') ) {
			case 'AUTH_CAPTURE':
				$transactionType = "00";
				break;
			case 'CAPTURE_ONLY':
			case 'PRIOR_AUTH_CAPTURE':
				$transactionType = "02";
				$authNum		 = $m['x_trans_id'];
				break;
			case 'REFUND': // refund
				$transactionType = "04";
				$authNum		 = $m['x_trans_id'];
				break;
			case 'VOID':
				$transactionType = "13";
				$authNum		 = $m['x_trans_id'];
				break;
			case 'AUTH_ONLY':
			default:
				$transactionType = "01";
		}
		
		// get the end point based on test or live mode.
		if ($isTest == 'test') {
			//$wsdl = 'https://api.demo.globalgatewaye4.firstdata.com/transaction/wsdl';
			$wsdl = 'https://api.demo.globalgatewaye4.firstdata.com/transaction/v11/wsdl';
		} else {
			//$wsdl = 'https://api.globalgatewaye4.firstdata.com/transaction/wsdl';
			$wsdl = 'https://api.globalgatewaye4.firstdata.com/transaction/v11/wsdl';
		}
		
		$trxnProperties = array(
		  "User_Name"			=> $username,
		  "ExactID"				=> $gatewayId,
		  "Password"			=> $gatewayPassword,		  
		  "Secure_AuthResult"	=> "",
		  "Ecommerce_Flag"		=> "0",
		  "XID"					=> "",		  
		  "CAVV"				=> "",
		  "CAVV_Algorithm"		=> "",
		  "Transaction_Type"	=> $transactionType, 
		  "Reference_No"		=> '',
		  "Customer_Ref"		=> '',
		  "Reference_3"			=> '',
		  "Client_IP"			=> $_SERVER['REMOTE_ADDR'],
		  "Client_Email"		=> $data['x_email'],
		  "Language"			=> 'en',				//English="en" French="fr"
		  "Card_Number"			=> $data['x_card_num'],
		  "Expiry_Date"			=> $expDate,
		  "CardHoldersName"		=> $this->request->post['cc_owner'],
		  "Track1"				=> "",
		  "Track2"				=> "",
		  "Authorization_Num"	=> $authNum,
		  "Transaction_Tag"		=> '',
		  "DollarAmount"		=> $amount,
		  "VerificationStr1"	=> substr($data['x_address'], 0, 28) . '|' . $data['x_zip'],
		  "VerificationStr2"	=> $data['x_card_code'],
		  "CVD_Presence_Ind"	=> "1",
		  "Secure_AuthRequired"	=> "",
		  "Currency"			=> "",
		  "PartialRedemption"	=> "",
		  
		  // Level 2 fields 
		  "ZipCode"		=> $data['x_zip'],
		  "Tax1Amount"	=> '',
		  "Tax1Number"	=> '',
		  "Tax2Amount"	=> '',
		  "Tax2Number"	=> '',
		  
		  "SurchargeAmount"	=> '',	//Used for debit transactions only
		  "PAN"				=> ''	//Used for debit transactions only		  
		  );
		
		$errors	= '';		
		try {
			$trxn 	= array("Transaction" => $trxnProperties);
			$client = new SoapClient($wsdl);		
			$trxnResult = $client->__soapCall('SendAndCommit', $trxn);
			
		} catch (SoapFault $e) {
			$msg = '';
			if ($e->faultcode == 'HTTP') {
				$msg = 'Invalid Credentials';
				
			} else {
				$msg = '(' . $e->faultcode . ')' . $e->getMessage();
				
			}
			$errors = 'SOAP Fault: ' . $msg;
			
		} catch (Exception $e) {
			$msg = $e->getMessage();
			if (empty($msg)) {
				$msg = 'Unknown error';
			}
			$errors = 'SOAP Exception: ' . $msg;		
		}
		
		if (isset($client->fault)) {
			// there was a fault, inform
			$errorMsg = $client->faultstring . '(' . $client->faultcode . ')';
			$errors = 'Error: ' . $errorMsg;
			
		}
		
		if (empty($errors)) {
			if ($trxnResult->Transaction_Approved == 1) {
				$response = $trxnResult->Bank_Message . '-' . $trxnResult->Bank_Resp_Code;
				if ($trxnResult->Bank_Resp_Code == '' || $trxnResult->Bank_Resp_Code == '000' || $trxnResult->Bank_Resp_Code == '00') {
					$response = $trxnResult->Exact_Message . '-' . $trxnResult->Exact_Resp_code;
				}
				$extraVars  = array(
								'TransactionID' => $trxnResult->Authorization_Num, 
								'ApprovalCode' 	=> $trxnResult->SequenceNo, 
								'response' 		=> $response, 
								'AVS Response' 	=> $this->getAvsResponseText($trxnResult->AVS)  . '[' . $trxnResult->AVS . ']', 
								'CVV Response' 	=> $this->getCvvResponseText($trxnResult->CVV2) . '[' . $trxnResult->CVV2 . ']'
							);
				$message = $response;
				foreach ($extraVars as $key => $value) {
					$message .= "\n" . $key . ' = ' . $value;
				}
				
				$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('firstdatae4api_order_status_id'), $message, FALSE);
				$json['success'] = HTTPS_SERVER . 'index.php?route=checkout/success';
			} else {
				$errors = $trxnResult->Bank_Message . '-' . $trxnResult->Bank_Resp_Code;
				if ($trxnResult->Bank_Resp_Code == '' || $trxnResult->Bank_Resp_Code == '000' || $trxnResult->Bank_Resp_Code == '00') {
					$errors = $trxnResult->EXact_Message . '(' . $trxnResult->EXact_Resp_Code . ')';
				}
				if (isset($errors) && !empty($errors)) {
					$json['error'] = $errors;
				} else {
					$json['error'] = 'Error occurred while processing your payment.';
				}
			}
		} else {
			$json['error'] = $errors;
		}
		
		if ($old_version) {
			$this->response->setOutput(Json::encode($json));
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	function getCvvResponseText($cvv)
	{
		$cvv = trim($cvv);
		$msg = 'Unrecognized response';
		switch ($cvv) {
			case 'M': 
				$msg = 'CVV2 / CVC2/CVD Match.'; 
				break;
			case 'N': 
				$msg = 'CVV2 / CVC2/CVD No Match.'; 
				break;
			case 'P': 
				$msg = 'Not Processed.'; 
				break;
			case 'S': 
				$msg = 'Merchant has indicated that CVV2 / CVC2/CVD is not present on the card.'; 
				break;
			case 'U': 
				$msg = 'Issuer is not certified and / or has not provided Visa encryption keys.'; 
				break;			
		}
		
		return $msg;
	}
	
	function getAvsResponseText($avs) 
	{
		$avs = trim($avs);
		$msg = 'Unrecognized response';
		switch ($avs) {
			case 'X': 
				$msg = 'exact match, 9 digit zip';
				break;
			case 'Y': 
				$msg = 'exact match, 5 digit zip';
				break;
			case 'A': 
				$msg = 'address match only';
				break;
			case 'W': 
				$msg = '9 digit zip match only';
				break;
			case 'Z': 
				$msg = '5 digit zip match only';
				break;
			case 'N': 
				$msg = 'no address or zip match';
				break;
			case 'U': 
				$msg = 'address unavailable';
				break;
			case 'G': 
				$msg = 'non-North American issuer, does not participate';
				break;
			case 'R': 
				$msg = 'issuer system unavailable';
				break;
			case 'E': 
				$msg = 'not a Mail/Phone order';
				break;
			case 'S': 
				$msg = 'service not supported';
				break;
			case 'Q': 
				$msg = 'Bill to address did not pass edit checks';
				break;
			case 'D': 
				$msg = 'International street address and postal code match';
				break;
			case 'B': 
				$msg = 'International street address match, postal code not verified due to incompatable formats';
				break;
			case 'C': 
				$msg = 'International street address and postal code not verified due to incompatable formats';
				break;
			case 'P': 
				$msg = 'International postal code match, street address not verified due to incompatable format';
				break;
			case '1': 
				$msg = 'Cardholder name matches';
				break;
			case '2': 
				$msg = 'Cardholder name, billing address, and postal code match';
				break;
			case '3': 
				$msg = 'Cardholder name and billing postal code match';
				break;
			case '4': 
				$msg = 'Cardholder name and billing address match';
				break;
			case '5': 
				$msg = 'Cardholder name incorrect, billing address and postal code match';
				break;
			case '6': 
				$msg = 'Cardholder name incorrect, billing postal code matches';
				break;
			case '7': 
				$msg = 'Cardholder name incorrect, billing address matches';
				break;
			case '8': 
				$msg = 'Cardholder name, billing address, and postal code are all incorrect';
				break;			
		}
		
		return $msg;
	}
}
?>