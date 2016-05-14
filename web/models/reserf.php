<?php
class Reserf extends AppModel {
	var $name = 'Reserf';
	var $displayField = 'name';
	var $validate = array(
		'from' => array(
			'notempty' => array(
				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'to' => array(
			'notempty' => array(
				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'name' => array(
			'notempty' => array(
				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'email' => array(
			'email' => array(
				'rule' => array('email'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'passengers' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
	);
	
	
	function getTravelFromOptions () {
		$fromOptions = array(0 => __('seleccionar donde se iniciará el viaje', true),
		                     1 => __('Hotel', true),
		                     2 => __('Dirección', true),
		                     3 => __('Aeropuerto Internacional de Ezeiza (EZE)', true));
        return $fromOptions;
	}
	function getTravelToOptions () {
		$toOptions = array(0 => __('seleccionar el destino', true),
		                   1 => __('Hotel', true),
		                   2 => __('Dirección', true),
		                   3 => __('Aeropuerto Internacional de Ezeiza (EZE)', true));
		return $toOptions;
	}
	
}
?>
