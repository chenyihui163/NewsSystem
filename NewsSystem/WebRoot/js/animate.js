window.onload = function() {
            var list = document.getElementById('list');var prev = document.getElementById('prev');
            var next = document.getElementById('next');

            function animate(offset) {
                //获取的是style.left，是相对左边获取距离，所以第一张图后style.left都为负值，
                //且style.left获取的是字符串，需要用parseInt()取整转化为数字。
                var newLeft = parseInt(list.style.left) + offset;
                list.style.left = newLeft + 'px';
                if(newLeft<-3000){
     			 list.style.left = -600 + 'px';
 				}
 				if(newLeft>-600){
     	 		list.style.left = -3000 + 'px';
 				}
            }

            prev.onclick = function() {             
                animate(600);
            }
            next.onclick = function() {  
                animate(-600);
            }
            
            var timer;
			function play() {
                //将轮播图换成向右切换图片
                timer = setInterval(function () {
                    next.onclick();
                }, 2000)
            }
			play();
			
			var container = document.getElementById('tran');

            function stop() {
                clearInterval(timer);
            }
            container.onmouseover = stop;
            container.onmouseout = play;
			
			
		var buttons = document.getElementById('buttons').getElementsByTagName('span');
            var index = 1;

            function buttonsShow() {
                //这里需要清除之前的样式
                for (var i = 0; i < buttons.length; i++) {
                    if (buttons[i].className == 'on') {
                        buttons[i].className = '';
                    }
                }
                //数组从0开始，故index需要-1
                buttons[index - 1].className = 'on';
            }

            prev.onclick = function() {
                index -= 1;
                if (index < 1) {
                    index = 5;
                }
                buttonsShow();
                animate(600);
            }
            next.onclick = function() {
                //由于上边定时器的作用，index会一直递增下去，我们只有5个小圆点，所以需要做出判断
                index += 1;
                if (index > 5) {
                    index = 1;
                }
                buttonsShow();
                animate(-600);
            }	
			
			
			for (var i = 0; i < buttons.length; i++) {
                // 这里使用的是立即执行函数，
                (function(i) {
                    buttons[i].onclick = function() {
                        var clickIndex = parseInt(this.getAttribute('index'));
                        var offset = 600 * (index - clickIndex); 
                        animate(offset);
                        index = clickIndex;
                        buttonsShow();
                    }
                })(i)
            }
			
			
        }