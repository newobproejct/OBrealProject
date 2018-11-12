<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Main 페이지입니다.</title>
<meta charset="utf-8">
<!-- jQuery import 방식2(CDN) -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	var UI = UI || {}, scope = {
		w : window,
		jQ : jQuery
	};
	(function(param) {
		var global = param.w, $ = param.jQ;

		UI.Carousel = function(container, options) {

			if (!$(container).length)
				return;
			this.$container = $(container);

			if (!(this instanceof UI.Carousel)) {
				return new UI.Carousel(container, options);
			}

			this.config = $.extend(this.defaults, options || {});
			this.detect = {};
			this._init();
		};
		UI.Carousel.prototype = {
			defaults : {
				start : 0,
				autoPlay : true,
				duration : 1000,
				interval : 3000
			},
			_init : function() {
				this._detectDom();
				this._setupIndicator();
				this._setEvent();
				this._showDefault();
				this._autoRolling();
			},
			_detectDom : function() {

				this.detect.$controller = this.$container.find('.controller');
				this.detect.$visualItems = this.$container.find('.visual li');
				this.detect.$btnStop = this.$container.find('.ctrl-stop');
				this.detect.$btnPlay = this.$container.find('.ctrl-play');
				this.detect.maxItems = this.detect.$visualItems.length;
				this.detect.$indicator = null;
				this.detect.current = 0;
				this.detect.intervalID = null;

			},
			_setupIndicator : function() {
				var i = 0, len = this.detect.maxItems;
				for (; i < len; i++) {
					this.detect.$controller
							.append('<a href="#" class="indicator" data-index="' + i + '" role="button">'
									+ (i + 1) + '</a>');
				}

				this.detect.$indicator = this.detect.$controller
						.find('.indicator');
			},
			_setEvent : function() {
				var self = this;

				$(this.$container).on('click.ui.gallery', '.indicator',
						$.proxy(this._controller, this));

				this.detect.$btnStop.on('click.ui.stop', function() {
					var $target = $(this);
					self.config.autoPlay = false;
					clearInterval(self.detect.intervalID);
					$target.removeClass('active');
					self.detect.$btnPlay.addClass('active');
				});

				this.detect.$btnPlay.on('click.ui.play', function() {
					var $target = $(this);
					self.config.autoPlay = true;
					self._autoRolling();
					$target.removeClass('active');
					self.detect.$btnStop.addClass('active');
				});

				this.detect.$indicator.hover(function() {
					if (self.config.autoPlay)
						clearInterval(self.detect.intervalID);
				}, function() {
					if (self.config.autoPlay)
						self._autoRolling();
				});
			},
			_controller : function(e) {
				e.preventDefault();
				var $target = $(e.currentTarget), index = $target.data('index');

				$target.addClass('active');
				$target.siblings().removeClass('active');

				if (this.detect.current == index)
					return;

				this._hideItem(this.detect.current);
				this._showItem(index);

				this.detect.current = index;
			},
			_showItem : function(index) {
				this.detect.$visualItems.eq(index).fadeIn(this.config.duration);
			},
			_hideItem : function(prevItemIndex) {
				this.detect.$visualItems.eq(prevItemIndex).fadeOut(
						this.config.duration);
			},
			_showDefault : function() {
				this.detect.$indicator.eq(this.config.start).trigger('click');
			},
			_autoRolling : function() {
				var num, self = this;
				if (this.config.autoPlay) {
					this.detect.intervalID = setInterval(function() {
						num = self.detect.current;
						(num < self.detect.maxItems - 1) ? num++ : (num = 0);
						self.detect.$indicator.eq(num).trigger('click')
					}, this.config.interval)
				}
			},
		};

		$(function() {

			var $visual = $('[data-visual="carousel"]');
			$visual.each(function() {
				new UI.Carousel(this);
			});

		});

	})(scope);
</script>
<style type="text/css">
.visual img {
	margin: 0;
	padding: 0;
	width: 306px;
	height: 209px;
}

.mini-visual {
margin:20px;
	position: relative;
	border: 1px solid #000;
	width: 360px;
	position: relative;
}

.mini-visual .visualList-box {
	overflow: hidden;
	position: relative;
	width: 306px;
	height: 209px;
	border-right: 1px solid #000;
}

.mini-visual .visualList-box ul li {
	position: absolute;
	left: 0; top:0 ;
	display: none;
}

.mini-visual .visualList-box ul li:first-child {
	display: block;
}

.mini-visual .visualList-box.v1 {

	width: 350px;
	height: 250px;
	border-left: 1px solid #e9e9e9;
}

.mini-visual .visualList-box.v2 {
	width: 350px;
	height: 250px;
}

.mini-visual .controller {
	position: absolute;
	right: 22px;
	top: 20px;
}

.mini-visual .controller .indicator {
	display: block;
	width: 8px;
	height: 8px;
	margin-bottom: 13px;
	content: "";
	background-color: #d6d7d9;
	-webkit-border-radius: 100%;
	border-radius: 100%;
	text-indent: -999em;
	font-size: 0;
}

.mini-visual .controller .indicator.active {
	background-color: #ed5565;
}

.mini-visual [class*="ctrl-"] {
	display: none;
	width: 32px;
	height: 32px;
	border: none;
	position: absolute;
	right: 10px;
	bottom: 10px;
	background:
		url("http://cfile8.uf.tistory.com/image/2479A84D58BFBB72283238")
		no-repeat;
	text-indent: -999em;
	font-size: 0;
}

.mini-visual [class*="ctrl-"].active {
	display: block;
}

.mini-visual .ctrl-play {
	background-position-y: -35px;
}
</style>

</head>
<body>




	<div class="mini-visual" data-visual="carousel" style="float: left; margin-left: 150px">
		<div class="visualList-box">
			<ul class="visual">
				<li class="active"><a href="#none"><img
						src="imgs/pic_1.jpg" alt="비주얼1"></a></li>
				<li><a href="#none"><img src="imgs/pic_2.jpg" alt="비주얼 2"></a>
				</li>
				<li><a href="#none"><img src="imgs/pic_3.jpg" alt="비주얼 3"></a>
				</li>
			</ul>
		</div>

		<div class="controller"></div>
		<button type="button" class="ctrl-stop active">애니메이션 정지</button>
		<button type="button" class="ctrl-play">애니메이션 시작</button>
	</div>


	<div class="mini-visual" data-visual="carousel" style="float: left;">
		<div class="visualList-box">
			<ul class="visual">
				<li class="active"><a href="#none"><img
						src="imgs/pic_4.jpg" alt="4"></a></li>
				<li><a href="#none"><img src="imgs/pic_5.jpg" alt="5"></a>
				</li>
				<li><a href="#none"><img src="imgs/pic_1.jpg" alt="6"></a>
				</li>
			</ul>
		</div>

		<div class="controller"></div>
		<button type="button" class="ctrl-stop active">애니메이션 정지</button>
		<button type="button" class="ctrl-play">애니메이션 시작</button>

	</div>
	
	
	<div class="mini-visual" data-visual="carousel" style="float: left;">
		<div class="visualList-box">
			<ul class="visual">
				<li class="active"><a href="#none"><img
						src="imgs/bimg01.jpg" alt="4"></a></li>
				<li><a href="#none"><img src="imgs/bimg02.jpg" alt="5"></a>
				</li>
				<li><a href="#none"><img src="imgs/bimg03.jpg" alt="6"></a>
				</li>
			</ul>
		</div>

		<div class="controller"></div>
		<button type="button" class="ctrl-stop active">애니메이션 정지</button>
		<button type="button" class="ctrl-play">애니메이션 시작</button>

	</div>


</body>
</html>
