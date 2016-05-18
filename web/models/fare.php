<?php
class Fare extends AppModel {
	var $name = 'Fare';
	var $displayField = 'name_spa';
	var $validate = array(
		'name_spa' => array(
			'notempty' => array(
				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
	);
}
?>