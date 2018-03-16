$(function(){
var data=[
            {
                value:40,
                color:"#21F0EA",//背景色
                highlight:"#79E8E5",//高亮背景颜色
                label:'javascript'//文字标签
            },{
                value:60,
                color:"#E0E4CC",
                highlight:"#EAEDD8",
                label:'jquery'
            },{
                value:100,
                color:"#69D2E7",
                highlight:"#83E5F7",
                label:'html'

            }
        ];

   	
     var ctx=document.getElementById("myChart1").getContext("2d");;
         window.pieChart=new Chart(ctx).Pie(data,{
                    //是否显示每段行程（即扇形区，不为true则无法看到后面设置的边框颜色）
                    segmentShowStroke : true,
                    //设置每段行程的边框颜色
                    segmentStrokeColor : "red",
                    //每段扇区边框的宽度
                    segmentStrokeWidth :2,
                    //Boolean - 是否执行动画
                    animation : true,
                    //Number - 动画时间
                    animationSteps : 100,
                    //String - 动画的效果
                    animationEasing : "easeOutBounce",
                    //Boolean -是否旋转动画
                    animateRotate : true,
                    //Boolean - 是否动画缩放饼图中心（效果不错）
                    animateScale : true,
                    //Function - 动画完成时执行的函数
                    //onAnimationComplete : null
                });
})
