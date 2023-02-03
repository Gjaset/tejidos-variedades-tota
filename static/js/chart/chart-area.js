// Bar Chart Example

function months(config) {
    var cfg = config || {};
    var count = cfg.count || 12;
    var section = cfg.section;
    var values = [];
    var i, value;
  
    for (i = 0; i < count; ++i) {
      value = MONTHS[Math.ceil(i) % 12];
      values.push(value.substring(0, section));
    }
  
    return values;
  }
var ctx1 = document.getElementById("entrega-fecha");
var myLineChart = new Chart(ctx1, {
  type: 'pie',
  data: {
    labels: months({count: dt.getMonth()+1}),
      

  datasets: [
    {
      label: 'suma_ventas',
      data: $('#data-area-Suma_ventas').html().slice(1,-1).split(','),
      backgroundColor: [  'rgba(255, 16, 83)',
                          'rgba(87, 117, 148)',
                          'rgba(54, 184, 196)',
                          'rgba(244, 211, 94)',
                            
                          
                        
                       
    ]
    }
  ]
  },
  options: {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',

      },
      title: {
        display: true,
        text: 'Ventas mensuales',
        font: {
          size: 30,
        }
      }
    }
  },
});

