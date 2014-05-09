<?php
/**
 * Opencart FirstDatae4api Payment Module - Catalog View
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
<h2><?php echo $text_credit_card; ?></h2>
<div id="firstdatae4api_payment">
  <table width="100%">
    <tr>
      <td><?php echo $entry_cc_owner; ?></td>
      <td><input type="text" name="cc_owner" value="" /></td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_number; ?></td>
      <td><input type="text" name="cc_number" value="" /></td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_expire_date; ?></td>
      <td><select name="cc_expire_date_month">
          <?php foreach ($months as $month) { ?>
          <option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
          <?php } ?>
        </select>
        /
        <select name="cc_expire_date_year">
          <?php foreach ($year_expire as $year) { ?>
          <option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
          <?php } ?>
        </select></td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_cvv2; ?></td>
      <td><input type="text" id="cc_cvv2" name="cc_cvv2" value="" size="3" /></td>
    </tr> 
  </table>
</div>
<div class="buttons">
  <table>
    <tr>
      <td align="right"><a onclick="confirmSubmit();" id="firstdatae4api_button" class="button"><span><?php echo $button_confirm; ?></span></a></td>
    </tr>
  </table>
</div>
<script type="text/javascript"><!--
function confirmSubmit() {
	var cvv = $('#cc_cvv2').val();
	if (cvv == '000' || cvv == '') {
		alert('Invalid CVV');
		return false;
	} else {
		$.ajax({
			type: 'POST',
			url: 'index.php?route=payment/firstdatae4api/send',
			data: $('#firstdatae4api_payment :input'),
			dataType: 'json',		
			beforeSend: function() {
				$('#firstdatae4api_button').attr('disabled', 'disabled');			
				$('#firstdatae4api').before('<div class="wait"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
			},
			success: function(data) {
				if (data.error) {
					alert(data.error);				
					$('#firstdatae4api_button').attr('disabled', '');
				}
				$('.wait').remove();			
				if (data.success) {
					location = data.success;
				}
			}
		});
	}
}
//--></script>