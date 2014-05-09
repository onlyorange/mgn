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
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div class="vtabs">
          <?php $module_row = 1; ?>
          <?php foreach ($modules as $module) { ?>
          <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
          <?php $module_row++; ?>
          <?php } ?>
          <span id="module-add"><?php echo $button_add_module; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> </div>
        <?php $module_row = 1; ?>
        <?php foreach ($modules as $module) { ?>
        <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
          
          <table class="form">
            <tr>
              <td><?php echo $entry_layout; ?></td>
              <td><select name="pavfacebook_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_position; ?></td>
              <td><select name="pavfacebook_module[<?php echo $module_row; ?>][position]">
                  <?php foreach( $positions as $pos ) { ?>
                  <?php if ($module['position'] == $pos) { ?>
                  <option value="<?php echo $pos;?>" selected="selected"><?php echo $this->language->get('text_'.$pos); ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $pos;?>"><?php echo $this->language->get('text_'.$pos); ?></option>
                  <?php } ?>
                  <?php } ?> 
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="pavfacebook_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
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
              <td><input type="text" name="pavfacebook_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            </tr>
			
			<tr>
              <td><?php echo $this->language->get("entry_page_url"); ?></td>
              <td><input type="text" name="pavfacebook_module[<?php echo $module_row; ?>][page_url]" value="<?php echo $module['page_url']; ?>" size="100" />
				<br><i><?php echo $this->language->get('entry_explain_page_url');?></i>
			  </td>
            </tr>
			
			<tr>
              <td><?php echo $this->language->get("entry_application_id"); ?></td>
              <td><input type="text" name="pavfacebook_module[<?php echo $module_row; ?>][application_id]" value="<?php echo $module['application_id']; ?>" size="100" /></td>
            </tr>
			
			<tr>
              <td><?php echo $this->language->get("entry_border_color"); ?></td>
              <td>
			  
			 
			  
			  <select name="pavfacebook_module[<?php echo $module_row; ?>][border_color]" value="<?php echo $module['border_color']; ?>">
					<?php foreach( $yesno as $k=>$v ){ ?>
						<option value="<?php echo $k;?>" <?php if($k==$module['border_color']) { ?>selected="selected"<?php } ?>><?php echo $v;?></option>
					<?php } ?>
				</select>
				
			  </td>
            </tr>
			<tr>
              <td><?php echo $this->language->get("entry_colorscheme"); ?></td>
              <td> 
			  
			  <select name="pavfacebook_module[<?php echo $module_row; ?>][colorscheme]">
                  <?php if ($module['colorscheme']=='dark') { ?>
                  <option value="dark" selected="selected">Dark</option>
                  <option value="light">Light</option>
                  <?php } else { ?>
                 <option value="dark" >Dark</option>
                  <option value="light" selected="selected">Light</option>
                  <?php } ?>
                </select>
			  
			  </td>
            </tr>
			<tr>
              <td><?php echo $this->language->get("entry_width"); ?></td>
              <td><input type="text" name="pavfacebook_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" size="100" /></td>
            </tr>
			<tr>
              <td><?php echo $this->language->get("entry_height"); ?></td>
              <td><input type="text" name="pavfacebook_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" size="100" /></td>
            </tr>
			<tr>
              <td><?php echo $this->language->get("entry_show_tream"); ?></td>
              <td>
				<select name="pavfacebook_module[<?php echo $module_row; ?>][tream]" value="<?php echo $module['tream']; ?>">
					<?php foreach( $yesno as $k=>$v ){ ?>
						<option value="<?php echo $k;?>" <?php if($k==$module['tream']) { ?>selected="selected"<?php } ?>><?php echo $v;?></option>
					<?php } ?>
				</select>
			  </td>
            </tr>
			<tr>
              <td><?php echo $this->language->get("entry_show_faces"); ?></td>
              <td>
				<select name="pavfacebook_module[<?php echo $module_row; ?>][show_faces]" value="<?php echo $module['show_faces']; ?>">
					<?php foreach( $yesno as $k=>$v ){ ?>
						<option value="<?php echo $k;?>" <?php if($k==$module['show_faces']) { ?>selected="selected"<?php } ?>><?php echo $v;?></option>
					<?php } ?>
				</select>
			  </td>
            </tr>
			<tr>
              <td><?php echo $this->language->get("entry_header"); ?></td>
              <td>
				<select name="pavfacebook_module[<?php echo $module_row; ?>][header]" value="<?php echo $module['header']; ?>">
					<?php foreach( $yesno as $k=>$v ){ ?>
						<option value="<?php echo $k;?>" <?php if($k==$module['header']) { ?>selected="selected"<?php } ?>><?php echo $v;?></option>
					<?php } ?>
				</select>
			  </td>
            </tr>
          </table>
        </div>
        <?php $module_row++; ?>
        <?php } ?>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';
	
 

	html += '  <table class="form">';
	html += '    <tr>';
	html += '      <td><?php echo $entry_layout; ?></td>';
	html += '      <td><select name="pavfacebook_module[' + module_row + '][layout_id]">';
				<?php foreach ($layouts as $layout) { ?>
	html += '   	      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
				<?php } ?>
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_position; ?></td>';
	html += '      <td><select name="pavfacebook_module[' + module_row + '][position]">';

                  <?php foreach( $positions as $pos ) { ?>
	html += '       <option value="<?php echo $pos;?>" selected="selected"><?php echo $this->language->get('text_'.$pos); ?></option>';
                  <?php } ?> 

	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_status; ?></td>';
	html += '      <td><select name="pavfacebook_module[' + module_row + '][status]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_sort_order; ?></td>';
	html += '      <td><input type="text" name="pavfacebook_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    </tr>';
	
	html += '    <tr><td><?php echo $this->language->get("entry_page_url"); ?></td>';
    html += '          <td><input type="text" name="pavfacebook_module[' + module_row + '][page_url]" value="" size="100" />';
	html += '			<br><i><?php echo $this->language->get('entry_explain_page_url');?></i></td>';
    html += '   </tr>';
	
	 html += '<tr> ';
     html += '      <td><?php echo $this->language->get("entry_application_id"); ?></td>';
	 html += ' <td><input type="text" name="pavfacebook_module[' + module_row + '][application_id]" value="" size="100" /></td>';
     html += '</tr>';
			
	html += '<tr> ';
    html += '   <td><?php echo $this->language->get("entry_border_color"); ?></td>';
    html += '   <td><input type="text" name="pavfacebook_module[' + module_row + '][border_color]" value="" size="100" /></td> ';
    html += '</tr> ';
	html += '<tr>';
    html += '	<td><?php echo $this->language->get("entry_colorscheme"); ?></td>';
    html += '	 <td><input type="text" name="pavfacebook_module[' + module_row + '][colorscheme]" value="" size="100" /></td>'
    html += '</tr> ';
	html += '<tr>';
    html += '  <td><?php echo $this->language->get("entry_width"); ?></td>';
    html += '  <td><input type="text" name="pavfacebook_module[' + module_row + '][width]" value="" size="100" /></td>';
    html += '</tr>';
	html += '<tr>';
    html += '  <td><?php echo $this->language->get("entry_height"); ?></td>';
    html += '   <td><input type="text" name="pavfacebook_module[' + module_row + '][height]" value="" size="100" /></td>';
    html += '</tr>';
	html += '<tr>';
    html += '   <td><?php echo $this->language->get("entry_show_tream"); ?></td>';
    html += '   <td>';
	 html += '		<select name="pavfacebook_module[' + module_row + '][tream]" value="">';
			<?php foreach( $yesno as $k=>$v ){ ?>
	html += '				<option value="<?php echo $k;?>"><?php echo $v;?></option>';
			<?php } ?>
	html += '			</select>';
	html += '		  </td>';
    html += '         </tr>';
	html += '		<tr>';
    html += '         <td><?php echo $this->language->get("entry_show_faces"); ?></td>';
    html += '          <td>';
	html += '			<select name="pavfacebook_module[' + module_row + '][show_faces]" value="">';
					<?php foreach( $yesno as $k=>$v ){ ?>
	html += '			<option value="<?php echo $k;?>"><?php echo $v;?></option>';
					<?php } ?>
	html += '			</select>';
	html += '		  </td>';
    html += '        </tr>';
	html += '		<tr>';
    html += '       <td><?php echo $this->language->get("entry_header"); ?></td>';
    html += '      <td>';
	html += '	<select name="pavfacebook_module[' + module_row + '][header]" value="">';
					<?php foreach( $yesno as $k=>$v ){ ?>
	html += '			<option value="<?php echo $k;?>"><?php echo $v;?></option>';
					<?php } ?>
	html += '	</select>';
	html += '	  </td>';
    html += '    </tr>';
	html += '  </table>'; 
	html += '</div>';
	
	$('#form').append(html);

	$('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
	$('.vtabs a').tabs();
	$('#module-' + module_row).trigger('click');
	
	module_row++;
}
//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
$('#language-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?> 
//--></script> 
<?php echo $footer; ?>