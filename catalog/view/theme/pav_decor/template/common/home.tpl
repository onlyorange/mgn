<?php require( dirname(__FILE__)."/config.tpl" ); ?>
<?php echo $header; ?>
	<div id="content">
		<div id="home-wrapper">
		<?php if( $SPAN[0] ): ?>
		<div class="span<?php echo $SPAN[0];?>">
			<?php echo $column_left; ?>
		</div>
		<?php endif; ?>
		<div class="span<?php echo $SPAN[1];?>">
			<?php echo $content_top; ?>
			<h1 style="display: none;"><?php echo $heading_title; ?></h1>
			<?php echo $content_bottom; ?>
		</div>
			<?php if( $SPAN[2] ): ?>
			<div class="span<?php echo $SPAN[2];?>">	
				<?php echo $column_right; ?>
			</div>
			<?php endif; ?>
		</div>
		<script>
		$(document).ready(function() {
			// PORTFOLIO GRID IN AND OUT EFFECT //
			$('.contWrap').hover(function(){
				$(this).children('.grid-item-on-hover').animate({opacity: 0.9}, 200);
			}, function(){
				$(this).children('.grid-item-on-hover').animate({ opacity: 0 }, 200);
			});
		});
		</script>
	</div>
<?php echo $footer; ?>