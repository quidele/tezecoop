<?php
class ContactsController extends AppController {

	var $name = 'Contacts';
	var $components = array('Email');

	function index() {
		
		if (!empty($_POST)) {
			$this->data['Contact'] = $_POST;
			
			$this->Contact->create();
			if ($this->Contact->save($this->data)) {
				
				// Send Email
				$this->Email->to = array(Configure::read('Config.contact_mail'));
				$this->Email->from = $this->data['Contact']['name'] . ' <' . $this->data['Contact']['email'] . '>';
				$this->Email->subject = __('Contacto desde el Sitio Web', true);
				$this->set('formData', $this->data['Contact']);
				$this->Email->sendAs = 'html';
				$this->Email->template = 'contact';
				@$this->Email->send();
				
				// Confirmation Message
				$this->loadModel('Setting');
				$messages = $this->Setting->read('confirmation_messages', 1);
				$messages = unserialize($messages['Setting']['confirmation_messages']);
				
				$messageTitle = $messages['contact']['title_' . $this->language];
				$messageText = $messages['contact']['text_' . $this->language];
				$messageButton = __('Cerrar', true);
				echo json_encode(array('title' => $messageTitle, 'text' => $messageText, 'button' => $messageButton));
				
				//$this->Session->setFlash(__('The contact has been sent', true));
				
				die;
			} else {
				$this->Session->setFlash(__('The contact could not be sent. Please, try again.', true));
			}
			die;
		}
		// Load info from settings
		$this->loadModel('Setting');
		$contactSettings = $this->Setting->read('contact', 1);
		$this->set('contactSettings', unserialize($contactSettings['Setting']['contact']));
		$this->set('jsFiles', array('jquery.simplemodal.1.4.1.min.js'));
		$this->set('title_for_layout', __('Contacto', true));
		$this->set('bodyClasses', 'internal contact');
	}
	
	function admin_index() {
		$this->Contact->recursive = 0;
		$this->set('contacts', $this->paginate());
	}

	function admin_view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid contact', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('contact', $this->Contact->read(null, $id));
	}

	function admin_add() {
		if (!empty($this->data)) {
			$this->Contact->create();
			if ($this->Contact->save($this->data)) {
				$this->Session->setFlash(__('The contact has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The contact could not be saved. Please, try again.', true));
			}
		}
	}

	function admin_edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid contact', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Contact->save($this->data)) {
				$this->Session->setFlash(__('The contact has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The contact could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Contact->read(null, $id);
		}
	}

	function admin_delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for contact', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Contact->delete($id)) {
			$this->Session->setFlash(__('Contact deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Contact was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>