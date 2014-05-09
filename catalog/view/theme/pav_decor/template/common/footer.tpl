<?php 
	/******************************************************
	 * @package Pav Megamenu module for Opencart 1.5.x
	 * @version 1.0
	 * @author http://www.pavothemes.com
	 * @copyright	Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
	 * @license		GNU General Public License version 2
	*******************************************************/

	require_once( DIR_TEMPLATE.$this->config->get('config_template')."/template/libs/module.php" );
	$themeConfig = $this->config->get('themecontrol');
	$themeName =  $this->config->get('config_template');
	$helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
	 

?>
</div></div></section>
<?php
	/**
	 * Footer Top Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'mass_bottom' ); 
	$ospans = array(1=>4,2=>5,3=>3);
	if( count($modules) ) { 
		$cols = isset($themeConfig['block_mass_bottom'])&& $themeConfig['block_mass_bottom']?(int)$themeConfig['block_mass_bottom']:count($modules);
	$class = $helper->calculateSpans( $ospans, $cols );
?>
<section id="pav-mass-bottom">
	<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {   ?>
			<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row-fluid"><?php } ?>	
			<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
			<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>
	</div>	
</section>
<?php } ?>



<section id="footer">
	<?php
	/**
	 * Footer Top Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_top' ); 
	$ospans = array();
	
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_top'])&& $themeConfig['block_footer_top']?(int)$themeConfig['block_footer_top']:count($modules);
	//if( $cols < count($modules) ){ $cols = count($modules); }
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<div class="footer-top">
		<div class="container">
			<?php $j=1;foreach ($modules as $i =>  $module) {   ?>
				<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row-fluid"><?php } ?>	
				<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
				<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
			<?php  $j++;  } ?>
		</div>
	</div>
	<?php } ?>

	<?php
	/**
	 * Footer Center Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_center' ); 
	$ospans = array(1=>3, 2=>2,3=>3,4=>4);
	
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_center'])&& $themeConfig['block_footer_center']?(int)$themeConfig['block_footer_center']:count($modules);
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<div class="footer-center">
		<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
				<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row-fluid"><?php } ?>	
				<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
				<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>	
		</div>
	</div>
<?php } elseif((isset($themeConfig['enable_footer_center'])&&$themeConfig['enable_footer_center'])) { ?>
<div class="footer-center">
		<div class="container"><div class="row-fluid">
		 <?php if ($informations) { ?>
			<div class="column span3">
				<div class="box">
					<h3><?php echo $text_information; ?></h3>
					<ul class="list">
					  <?php foreach ($informations as $information) { ?>
					  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
					  <?php } ?>
					</ul>
				</div>
			</div>
		  <?php } ?>
		  
		<div class="column span3">
			<div class="box">
				<h3><?php echo $text_service; ?></h3>
				<ul class="list">
				  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				  <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				   <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				</ul>
			</div>
		</div>
		  
		
		  
		<div class="column span3">
			<div class="box">
				<h3><?php echo $text_account; ?></h3>
				<ul class="list">
				  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				</ul>
			</div>
		</div>
		

		 </div> 
	</div></div>
<?php  } ?>	

	<?php
	/**
	 * Footer Bottom
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_bottom' ); 
	$ospans = array();
	
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_bottom'])&& $themeConfig['block_footer_bottom']?(int)$themeConfig['block_footer_bottom']:count($modules);	
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<div class="footer-bottom">
		<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
				<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row-fluid"><?php } ?>	
				<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
				<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>	
		</div>
	</div>
	<?php } ?>

</section>
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
		ga('create', 'UA-50506805-1', 'mizzgangnam.com');
		ga('send', 'pageview');
	
	</script>
	<div id="powered"><div class="container"><div class="copyright pull-left">
	<?php if( isset($themeConfig['enable_custom_copyright']) && $themeConfig['enable_custom_copyright'] ) { ?>
		<?php echo $themeConfig['copyright'];?>
	<?php } else { ?>
		<?php echo $powered; ?>. 
	<?php } ?>
	</div>
	<!-- <div class="paypal pull-right"><img src="image/data/paypal.png" alt=""><a href="#"></a></div></div></div> -->
<?php if( isset($themeConfig['enable_paneltool']) && $themeConfig['enable_paneltool'] ){  ?>
	<?php include( dirname(__FILE__).'/addon/panel.tpl' );?>
<?php } ?>
</div> 
<a id="goTop"></a>
</body></html>