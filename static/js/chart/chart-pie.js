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
var ctx2 = document.getElementById("totali");
var myLineChart = new Chart(ctx2, {
  type: 'line',
  data: {
    labels: months({count: dt.getMonth()+1}),
      

  datasets: [
    {
      label: 'Suma total',
      data: $('#data-area-Suma_total').html().slice(1,-1).split(','),
      backgroundColor: [  'rgba(255, 16, 83)',
                          'rgba(87, 117, 148)',
                          'rgba(54, 184, 196)',
                          'rgba(244, 211, 94)',           
    ]
    }
  ]
},
options: {
  plugins: {
    title: {
      display: true,
      text: 'Suma total de ventas por mes',
      font: {
        size: 30,
      }
      
    },
  },

  animations: {
    tension: {
      duration: 1000,
      easing: 'linear',
      from: 1,
      to: 0,
      loop: true
    
      },
      
  },
    }
    
    
    }
);

