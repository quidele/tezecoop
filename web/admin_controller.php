<?php

class AdminController extends AppController {
	var $uses = array();
	
	function index() {
		$this->layout = 'admin';
	}
	
	function login() {
		if (!empty($this->data)) {
			$this->loadModel('User');
			$user = $this->User->find('first', array('conditions' => array('User.username' => $this->data['Login']['username'],
			                                                               'User.password' => md5($this->data['Login']['password']))));
			if (!empty($user)) {
				$sessionId = md5(date('Y-m-d H:i:s'));
				$this->Session->write('User.session', $sessionId);
				$user['User']['session'] = $sessionId;
				$this->User->save($user);
				$this->redirect(array('controller' => 'admin', 'action' => 'index'));
			} else {
				session_destroy();
				$this->redirect(array('controller' => 'admin', 'action' => 'login'));
			}
		}
		$this->layout = 'admin';
	}
	
	function logout() {
		session_destroy();
		$this->redirect(array('controller' => 'admin', 'action' => 'login'));
	}
	
}