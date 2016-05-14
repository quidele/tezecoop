<?php
/**
 * Routes configuration
 *
 * In this file, you set up routes to your controllers and their actions.
 * Routes are very important mechanism that allows you to freely connect
 * different urls to chosen controllers and their actions (functions).
 *
 * PHP versions 4 and 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2010, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2010, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       cake
 * @subpackage    cake.app.config
 * @since         CakePHP(tm) v 0.2.9
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
/**
 * Here, we are connecting '/' (base path) to controller called 'Pages',
 * its action called 'display', and we pass a param to select the view file
 * to use (in this case, /app/views/pages/home.ctp)...
 */
	Router::connect('/', array('controller' => 'home', 'action' => 'index'));
	
	Router::connect('/:language', array('controller' => 'home', 'action' => 'index', 'language' => 'spa'), array('language' => 'spa|eng|por'));
	Router::connect('/:language/tarifas', array('controller' => 'fares', 'action' => 'index', 'language' => 'spa'), array('language' => 'spa|eng|por'));
	Router::connect('/:language/flota', array('controller' => 'units', 'action' => 'index', 'language' => 'spa'), array('language' => 'spa|eng|por'));
	Router::connect('/:language/servicios', array('controller' => 'services', 'action' => 'index', 'language' => 'spa'), array('language' => 'spa|eng|por'));
	Router::connect('/:language/recomendaciones', array('controller' => 'recommendations', 'action' => 'index', 'language' => 'spa'), array('language' => 'spa|eng|por'));
	Router::connect('/:language/reservas', array('controller' => 'reserves', 'action' => 'index', 'language' => 'spa'), array('language' => 'spa|eng|por'));
	Router::connect('/:language/reservas/imprimir/*', array('controller' => 'reserves', 'action' => 'reserve_print', 'language' => 'spa'), array('language' => 'spa|eng|por'));
	Router::connect('/:language/contacto', array('controller' => 'contacts', 'action' => 'index', 'language' => 'spa'), array('language' => 'spa|eng|por'));
	
/**
 * ...and connect the rest of 'Pages' controller's urls.
 */
	Router::connect('/pages/*', array('controller' => 'pages', 'action' => 'display'));
	
	Router::connect('/admin/index', array('controller' => 'admin', 'action' => 'index'));
	Router::connect('/admin/login', array('controller' => 'admin', 'action' => 'login'));
	Router::connect('/admin/logout', array('controller' => 'admin', 'action' => 'logout'));
	//Router::connect("/:lang/:controller", array('controller' => 'units'));