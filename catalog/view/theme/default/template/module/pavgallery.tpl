<?php $id = rand(); ?>

<?php ?>
<div class="box">
  
  <div class="box-heading"><?php echo $heading_title;?></div>
    <div class="box-content">
		
		<?php foreach( $banners as $banner ) { ?>
			<a href="<?php echo $banner['image'];?>" class="group<?php echo $id;?>" title="<?php echo $banner['title'];?>">
			<img src="<?php echo $banner['thumb'];?>" title="<?php echo $banner['title'];?>">
			</a>
		<?php } ?>
		
	</div>
</div> 
<script type="text/javascript">
$(".group<?php echo $id;?>").colorbox({rel:'group<?php echo $id;?>', slideshow:true});
</script>