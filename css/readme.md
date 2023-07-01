	select { appearance: none; -webkit-appearance: none;}
	select::-ms-expand { display:none; }
	
	ㄴ os에 맞게 바꿔짐
	
	#login1{
			width: 240px;
			height: 120px;
			margin-right: 10px;
			margin-top: -120px;
			float:left;
			position: absolute;
			background:lightcoral;
			padding: 20px 5px;
		}
		#login1 ul::after{
			content:""; display: block; clear: both;
		}
		#login1 ul li{
			float: left;
			list-style: none;
		}
			
		#login1 ul li input[type="text"] {
			display: block;
		}
		https://www.filamentgroup.com/lab/select-css.html