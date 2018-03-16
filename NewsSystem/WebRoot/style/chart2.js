$(function(){
	
	var data = {
    labels : ["January","February","March","April","May","June","July"],
    datasets : [
        {
            fillColor : "rgba(220,220,220,0.5)",
            strokeColor : "rgba(220,220,220,1)",
            data : [65,59,90,81,56,55,40]
        },
        {
            fillColor : "rgba(151,187,205,0.5)",
            strokeColor : "rgba(151,187,205,1)",
            data : [28,48,40,19,96,27,100]
        }
    ]
};
	var ctx=document.getElementById("myChart2").getContext("2d");
    window.Bar=new Chart(ctx).Bar(data,{
                     scaleLabel: "$"+"<%=value%>",
                        //是否绘制柱状条的边框
                        barShowStroke: true,
                        //柱状条边框的宽度
                        barStrokeWidth: 2,
                        //柱状条组之间的间距(过大或过小会出现重叠偏移错位的效果，请控制合理数值)
                        barValueSpacing: 5,
                        //每组柱状条组中柱状条之间的间距
                        barDatasetSpacing: 5,
                });
	
})
