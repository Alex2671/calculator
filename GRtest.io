<!DOCTYPE html>
<html>
<head>
	<title></title>
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <style>
  	body
  	{
  		background: url(http://www.intrawallpaper.com/static/images/abstract-mosaic-background.png);
  	}
  	#vid
  	{
  		width: inherit;
  		height: inherit;
  	}
  	#fff
  	{
  		width: 700px;
  		height: 700px;
  		float: left;
  	}
  	#sdf
  	{
  		float: left;
  		margin-top: 100px;
  		margin-left: 30px;
		border: 4px solid whitesmoke;
		width: 400px;
		min-width: 30%;
		width: auto;
		padding: 10px;	
		
  	}
	#list
	{
		float: left;
		width: 100%;
		height: auto;
	}
  </style>
</head>
<body>
<div id="fff" width="500px" height="500px"><video id=vid muted></video></div>
	<div id="sdf"><canvas id="canvas" width="320" height="240" ></canvas>
<input id="button" type="button" value="screen" /></div>
<div id="list"></div>
<script type=text/javascript>
			$( "#fff" ).resizable();
			var video=document.getElementById('vid');
			var canvas = document.getElementById('canvas'); 
 			var button = document.getElementById('button');
 			var context = canvas.getContext('2d');
	 var captureMe = function () {
      context.translate(canvas.width, 0);
      context.scale(-1, 1);
      // отрисовываем на канвасе текущий кадр видео
      context.drawImage(video, 0, 0);
      // получаем data: url изображения c canvas
      var base64dataUrl = canvas.toDataURL('image/png');
      context.setTransform(1, 0, 0, 1, 0, 0); // убираем все кастомные трансформации canvas
      // на этом этапе можно спокойно отправить  base64dataUrl на сервер и сохранить его там как файл (ну или типа того) 
      // но мы добавим эти тестовые снимки в наш пример:
      var img = new Image();
      img.src = base64dataUrl;
      list.appendChild(img);

    }

    button.addEventListener('click', captureMe);


			navigator.getUserMedia=navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.msGetUserMedia || window.URL.mozCreateObjectURL || window.URL.msCreateObjectURL; 
			navigator.getUserMedia({video:true,audio:true},
				function (stream)
					{videoStreamUrl = window.URL.createObjectURL(stream);
					video.src=videoStreamUrl;
          video.onloadedmetadata = function(e) {
          			 video.play(); 
                };},
				function(aler)
					{alert(aler)});
</script>
</body>
</html>
