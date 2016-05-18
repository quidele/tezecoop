<?php
class FeaturedBlock extends AppModel {
	var $name = 'FeaturedBlock';
	var $displayField = 'title_spa';
	var $validate = array(
		'title_spa' => array(
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