$(function(){
	
           //同样数据参数设置
            var data = {
                //折线图需要为每个数据点设置一标签。这是显示在X轴上。
                labels: ["January", "February", "March", "April", "May", "June", "July"],
                //这边的thisId分别对应labels的id
                 thisIds : [12,22,50,44,99,3,67],
                //数据集（y轴数据范围随数据集合中的data中的最大或最小数据而动态改变的）
                datasets: [{
                    fillColor: "rgba(220,220,220,0.5)", //背景填充色
                    strokeColor: "rgba(220,220,220,1)", //路径颜色
                    pointColor: "rgba(220,220,220,1)", //数据点颜色
                    pointStrokeColor: "#fff", //数据点边框颜色
                    data: [10, 59, 90, 81, 56, 55, 40] //对象数据
                }, {
                    fillColor: "rgba(151,187,205,0.5)",
                    strokeColor: "rgba(151,187,205,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    data: [28, 48, 40, 19, 96, 27, 200]
                }]
            };
        
                    var ctx = document.getElementById("myChart").getContext("2d");;
                    //方式二：传入对象字面量去修改默认图标参数，自定义图表
                    var MyNewChart = new Chart(ctx).Line(data, {
                        // 网格颜色
                      scaleGridLineColor: "rgba(255,0,0,1)",
                        // Y/X轴的颜色
                        scaleLineColor: "rgba(0,0,0,.1)",
                        // 文字大小
                        scaleFontSize: 16,
                        // 文字颜色
                        scaleFontColor: "#666",
                        // 网格颜色
                        scaleGridLineColor: "rgba(0,0,0,.05)",
                        // 是否使用贝塞尔曲线? 即:线条是否弯曲
                        // 是否执行动画
                        animation: true,
                        // 动画的时间
                        animationSteps: 60,
                        // 动画完成时的执行函数
                        onAnimationComplete: function(){
                            console.log("给x轴的lable对应的id：");
                            console.log(data.thisIds);
                        }
                    });
                    
                  
                    
    })         