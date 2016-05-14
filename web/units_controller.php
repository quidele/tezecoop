<?php
class UnitsController extends AppController {

	var $name = 'Units';

	var $paginate = array('order' => array('Unit.order' => 'asc'));
	
	function index() {
		// load info from settings
		$this->loadModel('Setting');
		$fleetSettings = $this->Setting->read('fleet', 1);
		$this->set('fleetSettings', unserialize($fleetSettings['Setting']['fleet']));
		$this->Unit->recursive = 0;
		$units = $this->Unit->find('all', array('order' => 'Unit.order ASC'));
		$this->set('units', $units);
		$this->set('bodyClasses', 'internal fleet');
		$this->set('title_for_layout', __('Nuestra Flota', true));
		$this->set('jsFiles', array('jquery.jcarousel.min.js'));
	}
	
	function admin_index() {
		if (!empty($this->data)) {
			foreach ($this->data['Unit'] as $keyItem => $item) {
				$data = array('Unit' => array('order' => $item));
				$this->Unit->read(null, $keyItem);
				$this->Unit->save($data);
			}
			$this->Session->setFlash(__('Fleet units order has been saved', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->Unit->recursive = 0;
		$this->set('units', $this->paginate());
	}

	function admin_view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid unit', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('unit', $this->Unit->read(null, $id));
	}

	function admin_add() {
		if (!empty($this->data)) {
			$date = date('Y-m-d_H-i-s_');
     		// Image upload
            $image = $this->uploadFile($this->data['Unit']['imageFile'],
                                       WWW_ROOT . 'img' . DS . 'units' . DS,
                                       null,
                                       $date);
            // Set data from files
            if ($image) {
                $this->data['Unit']['image'] = $image;
            }
			$this->Unit->create();
			if ($this->Unit->save($this->data)) {
				$this->Session->setFlash(__('The unit has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The unit could not be saved. Please, try again.', true));
			}
		}
	}

	function admin_edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid unit', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			
			$date = date('Y-m-d_H-i-s_');
            $image = $this->uploadFile($this->data['Unit']['imageFile'],
                                       WWW_ROOT . 'img' . DS . 'units' . DS,
                                       null,
                                       $date);
            // Set data from files
            if ($image) {
                $currentFiles = $this->Unit->read('image', $id);
                $this->data['Unit']['image'] = $image;
            }
			
			if ($this->Unit->save($this->data)) {
				
				// If file data is submitted we delete old files
                if ($image) {
                    @unlink(WWW_ROOT . 'img' . DS . 'units' . DS . $currentFiles['Unit']['image']);
                }
				
				$this->Session->setFlash(__('The unit has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The unit could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Unit->read(null, $id);
		}
	}

	function admin_delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for unit', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Unit->delete($id)) {
			$this->Session->setFlash(__('Unit deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Unit was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>