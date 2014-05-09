<?php 
	$span = 12/$cols; 
	$active = 'latest';
	$id = rand(1,rand(0,9))+rand(2,time());	
?>
<div class="<?php echo $prefix;?> box productcarousel" id="module<?php echo $id; ?>">
	<h3 class="box-heading"><span><?php echo $heading_title; ?></span>
		<?php if( trim($message) ) { ?>
			<div class="box-description hidden-phone"><?php echo $message;?></div>
			<?php } ?>
			</h3>
	<div class="box-content" >
 		<div class="box-products slide" id="productcarousel<?php echo $id;?>">
			
			<?php if( count($products) > $itemsperpage ) { ?>
			<div class="carousel-controls">
			<a class="carousel-control left" href="#productcarousel<?php echo $id;?>"   data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#productcarousel<?php echo $id;?>"  data-slide="next">&rsaquo;</a>
			</div>
			<?php } ?>
			<div class="carousel-inner ">		
			 <?php 
				$pages = array_chunk( $products, $itemsperpage);
			//	echo '<pre>'.print_r( $pages, 1 ); die;
			 ?>	
			  <?php foreach ($pages as  $k => $tproducts ) {   ?>
					<div class="item <?php if($k==0) {?>active<?php } ?>">
						<?php foreach( $tproducts as $i => $product ) {  $i=$i+1;?>
							<?php if( $i%$cols == 1 || $cols == 1) { ?>
							  <div class="row-fluid box-product">
							<?php } ?>
								  <div class="span<?php echo $span;?> product-block"><div class="product-inner">
									<?php if ($product['thumb']) { ?>
									<div class="image">
									<?php if( $product['special'] ) {   ?>
								    		<div class="product-label-special label"><?php echo $this->language->get( 'text_sale' ); ?></div>
								    	<?php } ?>
									<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
									<?php } ?>
													<div class="product-meta">
													  
													<div class="name">
														<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>

													<div class="group-action">
														<span class="icon fa fa-plus"></span>
													<div class="group-action-inner">

													  <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_wishlist"); ?>" ><?php echo $this->language->get("button_wishlist"); ?></a></div>
													  <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_compare"); ?>" ><?php echo $this->language->get("button_compare"); ?></a></div>

														<div class="cart">
															<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
														</div>
													</div>
													</div>
													</div>
													<div class="description">
														<?php echo utf8_substr( strip_tags($product['description']),0,60);?>...
													</div> 
													
													<?php if ($product['price']) { ?>
													<div class="price">
													  <?php if (!$product['special']) { ?>
													  <?php echo $product['price']; ?>
													  <?php } else { ?>
													  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
													  <?php } ?>
													</div>
													<?php } ?>
													<?php if ($product['rating']) { ?>
														<div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
													<?php } ?>
													</div>
												</div>

											</div>
									  
									  <?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
										 </div>
										<?php } ?>
									<?php } //endforeach; ?>
								</div>
						  <?php } ?>
					</div>
				</div> 

		</div>
</div>


<script type="text/javascript"><!--
	<?php if($tooltip):?>
	$(function (){
		$('#module<?php echo $id;?> #image<?php echo $id;?>').each(function(){
			$(this).popover({
				placement: '<?php echo $tooltip_placement;?>',
				container: '#module<?php echo $id;?>',
				trigger: 'hover',
				template: '<div class="popover"><div class="popover-content"></div></div>',
				content: function () { 
					return getProduct($(this).attr('data'));
				},
				html: 'true',
				delay: { 
					show: <?php echo $tooltip_show;?>, 
					hide: <?php echo $tooltip_hide;?> 
				},
			});

		});
		function getProduct(product_id){
			return $('#product-' + product_id).html();
		}
	});
	<?php endif;?>
	$('#productcarousel<?php echo $id;?>').carousel({interval:<?php echo ( $auto_play_mode?$interval:'false') ;?>,auto:<?php echo $auto_play;?>,pause:'hover'});
--></script>
