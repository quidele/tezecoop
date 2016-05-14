<div id="content-wrapper">
	<section id="content" class="wrapper">
		<h1><?php __('Hola'); ?></h1>
		<?php echo $form->create(array('class' => 'webform')); ?>
			<fieldset>
				<legend><?php __('Envianos tu consulta'); ?></legend>
				<div class="fields-wrapper">
					<?php echo $form->input('name', array('label' => '<span>*</span> ' . __('Nombre y Apellido', true))); ?>
					<?php echo $form->input('email', array('label' => '<span>*</span> ' . __('E-mail', true))); ?>
					<?php echo $form->input('comment', array('label' => __('Comentarios', true))); ?>
				</div>
			</fieldset>
			<div class="form-actions">
				<span>* <?php __('Campos Obligatorios'); ?></span>
				<?php echo $form->submit(__('Enviar', true)); ?>
			</div>
		<?php echo $form->end(); ?>
		<address class="reserves">
			<?php __('Reservas'); ?>: <?php echo $contactSettings['info']['reserves_phone']; ?><br />
			<?php echo $contactSettings['info']['reserves_mail']; ?>
			<?php echo $html->link(__('Reserva Online', true) . ' &raquo;', '/' . $language . '/reservas', array('id' => 'reserve-link', 'title' => __('Reserva Online', true), 'escape' => false)); ?>
		</address>
		<address class="claims">
			<?php __('Reclamos'); ?>: <?php echo $contactSettings['info']['claims_phone']; ?><br />
			<?php echo $contactSettings['info']['claims_mail']; ?>
		</address>
		<address class="info">
			<?php echo $contactSettings['info']['info_mail']; ?>
		</address>
		<p id="airport-info"><?php __('Aeropuerto Internacional de Ezeiza - Buenos Aires - Argentina'); ?></p>
	</section>
</div>