<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <style>
        @import 'https://fonts.googleapis.com/css?family=Montserrat';
        @import 'https://fonts.googleapis.com/css?family=Lato:400';
        html,
        body {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }
 
        .chart--container {
            height: 100%;
            width: 100%;
            min-height: 150px;
        }
 
        .zc-ref {
            display: none;
        }
 
        zing-grid[loading] {
            height: 480px;
        }
        
        
        .btndiv{
        	text-align: center;
        }
        
        
    </style>
</head>
 
<body>
	<font id = "admin_viewtitle">통계</font><br>
    <div id="myChart" class="chart--container"><a class="zc-ref" href="https://www.zingchart.com/">Powered by ZingChart</a></div>
    <script>
    	$(document).ready(function(){
    		var title = "카테고리별 주문 통계";//멘 처음은 카테고리별 주문 통계를 보여줌
    		var name = "";
			var statics_data = new Array;
			var bgcolor = ['#00BAF2','#E80C60','#9B26AF','#fcff17','#19d895','#f14bae','#fdfdd0'];
    		function category(){//카테고리별 주문 통계
    			$.ajax({
    				type:"POST",
    				url:"staticsPerCategory",
    				async:false,
    				success:function(rdata){
    					console.log(rdata);
    					statics_data = [];//배열 초기화 
    					for(var i = 0; i<rdata.name.length;i++){
    						statics_data.push({text:rdata.name[i], 
    								   values:[rdata.statics[i]],
    								   backgroundColor:bgcolor[i],
    								   lineColor:bgcolor[i],
    								   lineWidth: '1px',
    								   marker: {
    			                            backgroundColor: bgcolor[i]
    			                        }
    								});//push end
    					}//for end
    					console.log("statics_data = "+statics_data);
    					console.log("statics_data 의  카테고리 이름="+statics_data[0].text);
    					console.log("statics_data 의  value="+statics_data[0].values);
    				},
    				error:function(){
    					console.log("에러");
    				}
    			})//ajax end	
    		}
    		category();
    		
    		function allOrder(){//전체 주문 통계
    			$.ajax({
    				type:"POST",
    				url:"OrderStatics",
    				async:false,
    				success:function(rdata){
    					statics_data = [];
    					console.log(rdata);
    					for(var i = 0; i<rdata.status.length;i++){
    						statics_data.push({text:rdata.status[i], 
    								   values:[rdata.statics[i]],
    								   backgroundColor:bgcolor[i],
    								   lineColor:bgcolor[i],
    								   lineWidth: '1px',
    								   marker: {
    			                            backgroundColor: bgcolor[i]
    			                        }
    								});//push end
    					}//for end
    				},
    				error:function(){
    					console.log("에러");
    				}
    			})
    		}
    		
    		
    		function chartdata(){//차트에 들어갈 데이터
    			
		        ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
		     	let chartConfig = {
		            gui: {
		                contextMenu: {
		                    backgroundColor: '#306EAA', // sets background for entire contextMenu
		                    button: {
		                        backgroundColor: '#2D66A4',
		                        lineColor: '#2D66A4',
		                        visible: true
		                    },
		                    docked: true,
		                    gear: {
		                        alpha: 1,
		                        backgroundColor: '#2D66A4'
		                    },
		                    item: {
		                        backgroundColor: '#306EAA',
		                        borderColor: '#306EAA',
		                        borderWidth: '0px',
		                        color: '#fff',
		                        fontFamily: 'Lato'
		                    },
		                    position: 'right'
		                }
		            },
		            graphset: [{
		                type: 'ring',
		                backgroundColor: '#FBFCFE',
		                title: {
		                    text: title,//통계 제목
		                    padding: '15px',
		                    fontColor: '#1E5D9E',
		                    fontFamily: 'Lato',
		                    fontSize: '14px'
		                },
		                //subtitle: {
		                //    text: '06/10/18 - 07/11/18',
		                //    padding: '5px',
		                //    fontColor: '#777',
		                //    fontFamily: 'Lato',
		                //    fontSize: '12px'
		                //},
		                legend: {
		                    adjustLayout: true,
		                    align: 'center',
		                    backgroundColor: '#FBFCFE',
		                    borderWidth: '0px',
		                    item: {
		                        cursor: 'pointer',
		                        fontColor: '#777',
		                        fontSize: '12px',
		                        offsetX: '-6px'
		                    },
		                    marker: {
		                        type: 'circle',
		                        borderWidth: '0px',
		                        cursor: 'pointer',
		                        size: 5
		                    },
		                    mediaRules: [{
		                        maxWidth: '500px',
		                        visible: false
		                    }],
		                    toggleAction: 'remove',
		                    verticalAlign: 'bottom'
		                },
		                plot: {
		                    valueBox: [{
		                            type: 'all',
		                            text: '%t',
		                            placement: 'out'
		                        },
		                        {
		                            type: 'all',
		                            text: '%npv%',
		                            placement: 'in'
		                        }
		                    ],
		                    animation: {
		                        effect: 'ANIMATION_EXPAND_VERTICAL',
		                        sequence: 'ANIMATION_BY_PLOT_AND_NODE'
		                    },
		                    backgroundColor: '#FBFCFE',
		                    borderWidth: '0px',
		                    hoverState: {
		                        cursor: 'hand',
		                    },
		                    slice: '60%'
		                },
		                plotarea: {
		                    margin: '70px 0px 10px 0px',
		                    backgroundColor: 'transparent',
		                    borderRadius: '10px',
		                    borderWidth: '0px'
		                },
		                scaleR: {
		                    refAngle: 270
		                },
		                tooltip: {
		                    text: '<span style="color:%color">카테고리: %t</span><br><span style="color:%color">주문 수: %v</span>',
		                    anchor: 'c',
		                    backgroundColor: 'none',
		                    borderWidth: '0px',
		                    fontSize: '16px',
		                    mediaRules: [{
		                        maxWidth: '500px',
		                        y: '54%'
		                    }],
		                    sticky: true,
		                    thousandsSeparator: ',',
		                    x: '50%',
		                    y: '50%'
		                },
		                noData: {
		                    text: 'No Selection',
		                    alpha: .6,
		                    backgroundColor: '#20b2db',
		                    bold: true,
		                    fontSize: '18px',
		                    textAlpha: .9
		                },
		                series: statics_data
		            }]
		        };
		     	
		     	return chartConfig;
    		}
			let zingdata = chartdata(); 
	        zingchart.render({
	            id: 'myChart',
	            data: zingdata
	        });
	        
	        $(".btndiv button").click(function(){
	        	console.log($(this).text());
	        	title = $(this).text();
	        	zingdata = chartdata();
	        	if(title == '주문 현황'){
	        		console.log("주문 현황 클릭");
	        		allOrder();
	        	}else{
	        		console.log("카테고리별 판매 현황 클릭");
	        		category();
	        	}
	        	zingdata = chartdata();
		        zingchart.render({
		            id: 'myChart',
		            data: zingdata
		        });	
	        })
	        
	        
	        
    	})//ready end
    </script>
    <div class="btndiv">
	    <button class="categorybtn">카테고리별 판매 현황</button>
	    <button class="allorderbtn">주문 현황</button>
    </div>
    
</body>
 
</html>
