var workoutsBlock = {
	
	addAction:function() {
		// var counter = parseInt($F('actions_counter'));

		new Ajax.Updater(	'actions',
							'/acts/new',
							{	method:'post',
								insertion:Insertion.Bottom,
								onSuccess:function() {
									// $('actions_counter').value = counter + 1;
								}
							}
						);
	},
	
	deleteAction:function(id) {
		if($(id).remove()) {
			// $('actions_counter').value = parseInt($F('actions_counter')) - 1;
		}
	},
	
	saveAction:function(id, add_another) {
		if(id == '') {
			var id = $$('.action').last().id;
		}
		
		var form = $('form_'+id);
		
		if(form.elements[2].value == '') {
			// if an exercise hasn't been selected, highlight it as an error
			form.elements[2].addClassName('error');
		} else {
			// otherwise save the exercise
			new Ajax.Updater(	id,
								'/acts/create',
								{	method:'post',
									parameters:Form.serialize(form),
									asynchronous:false,
									onSuccess:function() {
										new Effect.Highlight(id);
										// should we also add a new one?
										if(add_another)
											workoutsBlock.addAction();
									},
									onFailure:function(e) {
										alert(e.responseText);
									}
								}
							);
		}
	},
	
	done:function() {
		// save this action, then submit the form
		workoutsBlock.saveAction('', false);
		$('workouts_form').submit();
	},
	
	editAction:function(obj,temp) {
		
	},
	
	selectExercise:function(obj,id) {
		obj.className = '';
		if(obj.options[obj.selectedIndex].className == 'weight') {
			$$('#action_'+id+' .weight_label').each(function(label) { label.show() });
			$$('#action_'+id+' .cardio_label').each(function(label) { label.hide() });
			$$('#action_'+id+' .weight_dimension').each(function(span) { span.show() });
			$$('#action_'+id+' .cardio_dimension').each(function(span) { span.hide() });
		} else if(obj.options[obj.selectedIndex].className == 'cardio') {
			$$('#action_'+id+' .weight_label').each(function(label) { label.hide() });
			$$('#action_'+id+' .cardio_label').each(function(label) { label.show() });
			$$('#action_'+id+' .weight_dimension').each(function(span) { span.hide() });
			$$('#action_'+id+' .cardio_dimension').each(function(span) { span.show() });
		} else if(obj.options[obj.selectedIndex].className == 'new') {
			location.href = '/exercises/new?return_to=/workouts/new';
		}
	}
	
}