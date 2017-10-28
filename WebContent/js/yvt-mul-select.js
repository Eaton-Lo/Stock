/*
* YvetteMultiSelect v0.1.0
* Copyright (c) 2014 Thundersha Kuo @ 25sprout
* REF: https://github.com/lou/multi-select/blob/master/js/jquery.multi-select.js
*/

function selectAllOption(flag,obj){
		var leftSelect = $(obj).parents().parents().prev('div').eq(0).children().first();
		var rightSelect = $(obj).parents().parents().next('div').eq(0).children().first();
		var leftContainerOptions = $(obj).parents().parents().prev('div').eq(0).children().first().find('option');
		var rightContainerOptions = $(obj).parents().parents().next('div').eq(0).children().first().find('option');
		if(flag){
			$(rightSelect).append(leftContainerOptions)
			$(leftSelect).empty();
		}else{
			$(leftSelect).append(rightContainerOptions)
			$(rightSelect).empty();
		}
}

!function ($) {
	"use strict";

 	/* YvetteMultiSelect CLASS DEFINITION
  	* ====================== */

  	var YvetteMultiSelect = function(element, options){
  		this.opts = options;
  		this.$ele = $(element);
  		this.$container = $('<div/>', { 'class': "yms-container" });
  		this.$srcSel = $('<select multiple/>');
  		this.$srcFlt = $('<input/>');
  	}

  	var getSelectedArray = YvetteMultiSelect.$ele;
	YvetteMultiSelect.prototype = {
		constructor: YvetteMultiSelect,
		init: function(){
			var that = this,
				$yms = this.$ele,
				$ymsParent = $yms.parent();

			var sel_arr = this.opts.data_array;

				//bootstrap UI ini
  				this.$container.addClass('form-group');
  				this.$srcFlt.attr('placeholder','快速篩選').addClass('form-control');
  				this.$srcSel.attr('placeholder','快速篩選').addClass('form-control');
  				$yms.attr('placeholder','快速篩選').addClass('form-control');

  				var $l_container = $('<div/>', { 'class': "col-md-4" });
  				var $m_container = $('<div/>', { 'class': "col-md-4" });
  				var $r_container = $('<div/>', { 'class': "col-md-4" });
  				
  				$ymsParent.append( this.$container );

  				this.$container.append($l_container).append($m_container).append($r_container);
  				
  				if($ymsParent.attr('id')=="emmaServiceDiv")
  					this.$srcSel.attr('style',"height:20em;").attr('id',"emmaAccountList").appendTo($l_container);
  				else if($ymsParent.attr('id')=="emmaGroupDiv")
  					this.$srcSel.attr('style',"height:20em;").attr('id',"emmaGroupList").appendTo($l_container);
  				else
  					this.$srcSel.attr('style',"height:20em;").attr('id',"emmaBulletinList").appendTo($l_container);
				
  				var html =  '<div class="text-center"><p class="bg-success yvt-search" ><br/><i class="fa fa-search"></i> 利用文字篩選左側選項<br/><br/>';
  				
  				$m_container
					.append('<div class="text-center"><br/><br/><p class="bg-info yvt-info" style="margin-bottom:38px"><br/>點選左邊將選項加入右邊<br/><br/></p><span style="display: inline-block; " class="btn btn-default" onclick="selectAllOption(true,this)"><i class="fa fa-plus" aria-hidden="true"></i> 全選</span><i class="fa fa-arrows-h" style="margin:0 9%;" ></i><span  class="btn btn-default" style=";display: inline-block" onclick="selectAllOption(false,this)"><i class="fa fa-minus" aria-hidden="true"></i> 取消</span></p></div><br/></div>')
					.append(this.$srcFlt)
					.append(html);
		

				$yms.attr('style',"height:20em;").appendTo($r_container);
  				//bootstrap UI end

				var $ySrcSel = this.$srcSel;
				var $ySrcIpt = this.$srcFlt;
				var $yTgtSel = $yms;


				var selectedOptsArr = $yTgtSel.val();

				for(var i in sel_arr) {
						var se = sel_arr[i];
						if(selectedOptsArr!=null){
							if(selectedOptsArr.indexOf(se.v)<0){
								var $nOpt = $('<option value="'+se.v+'" id="undefined">'+se.t+'</option>');
								$ySrcSel.append($nOpt);
							}
						}else{
							var $nOpt = $('<option value="'+se.v+'" id="undefined">'+se.t+'</option>');
							$ySrcSel.append($nOpt);
						}
				};

				$ySrcIpt.on('keydown',function(e){
					if ( e.which == 13 ) {
						e.preventDefault();
						$ySrcIpt.trigger('change');
					}
				});

				$ySrcIpt.on('change',function(){

					var selectedOptsArr = $yTgtSel.val();

					var sch_str = $(this).val();
					var rlt_arr = [];
					$.each(sel_arr,function(){
						if(this.t.search(sch_str) >= 0){
							rlt_arr.push(this);
						}else if(this.t.toLowerCase().search(sch_str.toLowerCase()) >= 0){
							rlt_arr.push(this);
						}
					});

					if(rlt_arr.length > 0){
						$ySrcSel.children().remove();
						$.each(rlt_arr,function(){
							if(selectedOptsArr!=null){
								if(selectedOptsArr.indexOf(this.v)<0){
									var $nOpt = $('<option value="'+this.v+'" id="undefined">'+this.t+'</option>');
									$ySrcSel.append($nOpt);
								}
							}else{
								var $nOpt = $('<option value="'+this.v+'" id="undefined">'+this.t+'</option>');
								$ySrcSel.append($nOpt);
							}
						});
					}else{
						// 若查不到就清空
						$ySrcSel.children().remove();
					}
					// console.log($ySrcSel.children().length);
				});

				//左側選單
				//TODO try filter or find
				$ySrcSel.on('click',function(){
					$(this).find('option:selected').each(function(){
						var $nOpt = $('<option value="'+$(this).attr('value')+'" id="'+$(this).attr('id')+'" level="'+$(this).attr('level')+'"selected="selected">'+$(this).html()+'</option>');
						
						$yTgtSel.append($nOpt);
						var key = $(this).index();
						var arr_remove = new Array();
						for(var i = key+1; i < $ySrcSel.children().length && $ySrcSel.children().eq(i).attr('level') > $ySrcSel.children().eq(key).attr('level'); i++){
							var $childOpt = $('<option value="'+$ySrcSel.children().eq(i).attr('value')+'" id="'+$ySrcSel.children().eq(i).attr('id')+'" level="'+$ySrcSel.children().eq(i).attr('level')+'" selected="selected">'+$ySrcSel.children().eq(i).html()+'</option>');
							$yTgtSel.append($childOpt);
							arr_remove.push(i);

						}
						// 將要刪的元素key倒過來
						arr_remove.reverse();
						for(var i in arr_remove){
							$ySrcSel.children().eq(arr_remove[i]).remove();
						}
						$(this).remove();

						$yTgtSel.find('option').prop('selected','selected');

						var sortOptions = $yTgtSel.find('option').sort(function(a,b){
							return a.getAttribute('order') - b.getAttribute('order');
						});
						$yTgtSel.html(sortOptions);

					});
				});
				//右側選單
				$yTgtSel.on('click',function(){
					$(this).find('option:selected').each(function(){
						var $nOpt = $('<option value="'+$(this).attr('value')+'" id="'+$(this).attr('id')+'" level="'+$(this).attr('level')+'">'+$(this).html()+'</option>');
						
						$ySrcSel.append($nOpt);
						var key = $(this).index();
						var arr_remove = new Array();
						var options = $yTgtSel.children();
						for(var i = key+1; i < options.length && options.eq(i).attr('level') > options.eq(key).attr('level'); i++){
							var $childOpt = $('<option value="'+options.eq(i).attr('value')+'" id="'+options.eq(i).attr('id')+'" level="'+options.eq(i).attr('level')+'">'+options.eq(i).html()+'</option>');
							$ySrcSel.append($childOpt);
							arr_remove.push(i);
						}
						// 將要刪的元素key倒過來
						arr_remove.reverse();
						for(var i in arr_remove){
							$yTgtSel.children().eq(arr_remove[i]).remove();
						}
						$(this).remove();

						$yTgtSel.find('option').prop('selected','selected');

						var sortOptions = $ySrcSel.find('option').sort(function(a,b){
							return a.getAttribute('order') - b.getAttribute('order');
						});
						$ySrcSel.html(sortOptions);

					});
				});
		}
		
	};

	
	/* YvetteMultiSelect PLUGIN DEFINITION
	* ======================= */
	$.fn.yvetteMultiSelect = function(){
		var option = arguments[0],
			args = arguments;
    	
    	return this.each(function(){
			var $this = $(this),
				data = $this.data('yvetteMultiSelect'),
				options = $.extend({}, $.fn.yvetteMultiSelect.defaults, $this.data(), typeof option === 'object' && option);

			if (!data){ $this.data('yvetteMultiSelect', (data = new YvetteMultiSelect(this, options))); }

			if (typeof option === 'string'){
				data[option](args[1]);
			} else {
				data.init();
			}
		});
	};

	$.fn.yvetteMultiSelect.defaults = {
		// keySelect: [32],
		// selectableOptgroup: false,
		// disabledClass : 'disabled',
		// dblClick : false,
		// keepOrder: false,
		// cssClass: ''
	};

  $.fn.yvetteMultiSelect.Constructor = YvetteMultiSelect;
}(window.jQuery);