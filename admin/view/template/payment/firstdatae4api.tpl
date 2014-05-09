<?php
/**
 * Opencart FirstDatae4api Payment Module - Admin View
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
?>
<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">  
        <!-- tr>
          <td><span class="required">*</span> <?php echo $entry_login; ?></td>
          <td><input type="text" name="firstdatae4api_login" value="<?php echo $firstdatae4api_login; ?>" />
            <?php if ($error_login) { ?>
            <span class="error"><?php echo $error_login; ?></span>
            <?php } ?></td>
        </tr -->	


		<tr>
          <td><span class="required">*</span> <?php echo $entry_username; ?></td>
          <td><input type="text" name="firstdatae4api_username" value="<?php echo $firstdatae4api_username; ?>" />
            <?php if ($error_username) { ?>
            <span class="error"><?php echo $error_username; ?></span>
            <?php } ?></td>
        </tr>	

		<tr>
          <td><span class="required">*</span> <?php echo $entry_gatewayid; ?></td>
          <td><input type="text" name="firstdatae4api_gatewayid" value="<?php echo $firstdatae4api_gatewayid; ?>" />
            <?php if ($error_gatewayid) { ?>
            <span class="error"><?php echo $error_gatewayid; ?></span>
            <?php } ?></td>
        </tr>	
		<tr>
          <td><span class="required">*</span> <?php echo $entry_gatewaypasswd; ?></td>
          <td><input type="text" name="firstdatae4api_gatewaypasswd" value="<?php echo $firstdatae4api_gatewaypasswd; ?>" />
            <?php if ($error_gatewaypasswd) { ?>
            <span class="error"><?php echo $error_gatewaypasswd; ?></span>
            <?php } ?></td>
        </tr>	

		
		
		
        <tr>
          <td><?php echo $entry_mode; ?></td>
          <td><select name="firstdatae4api_mode">
              <?php if ($firstdatae4api_mode == 'live') { ?>
              <option value="live" selected="selected"><?php echo $text_live; ?></option>
              <?php } else { ?>
              <option value="live"><?php echo $text_live; ?></option>
              <?php } ?>
              <?php if ($firstdatae4api_mode == 'test') { ?>
              <option value="test" selected="selected"><?php echo $text_test; ?></option>
              <?php } else { ?>
              <option value="test"><?php echo $text_test; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_method; ?></td>
          <td><select name="firstdatae4api_method">
              <?php if ($firstdatae4api_method == 'AUTH_ONLY') { ?>
              <option value="AUTH_ONLY" selected="selected"><?php echo $text_authorization; ?></option>
              <?php } else { ?>
              <option value="AUTH_ONLY"><?php echo $text_authorization; ?></option>
              <?php } ?>
              <?php if ($firstdatae4api_method == 'AUTH_CAPTURE') { ?>
              <option value="AUTH_CAPTURE" selected="selected"><?php echo $text_capture; ?></option>
              <?php } else { ?>
              <option value="AUTH_CAPTURE"><?php echo $text_capture; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_order_status; ?></td>
          <td><select name="firstdatae4api_order_status_id">
              <?php foreach ($order_statuses as $order_status) { ?>
              <?php if ($order_status['order_status_id'] == $firstdatae4api_order_status_id) { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_geo_zone; ?></td>
          <td><select name="firstdatae4api_geo_zone_id">
              <option value="0"><?php echo $text_all_zones; ?></option>
              <?php foreach ($geo_zones as $geo_zone) { ?>
              <?php if ($geo_zone['geo_zone_id'] == $firstdatae4api_geo_zone_id) { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_status; ?></td>
          <td><select name="firstdatae4api_status">
              <?php if ($firstdatae4api_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_sort_order; ?></td>
          <td><input type="text" name="firstdatae4api_sort_order" value="<?php echo $firstdatae4api_sort_order; ?>" size="1" /></td>
        </tr>
      </table>
    </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>