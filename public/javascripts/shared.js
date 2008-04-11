var appBlock = {
	
	removeIntro:function(controller) {
		new Ajax.Request(	'/settings/update?att=show_'+controller+'_intro&val=false',
							{	method:'post',
								onSuccess:function() {
									new Effect.BlindUp('intro');
								}
							}
						);
	}
	
}