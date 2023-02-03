

const MONTHS = [
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Septiembre',
  'Octubre',
  'Noviembre',
  'Diciembre'
];
var dt = new Date();
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

const ctx = document.getElementById('ventas-chart')

const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: months({count: dt.getMonth()+1}),
        datasets: [
            {
              label: 'Calzado',
              data: $('#data-area-Calzado').html().slice(1,-1).split(','),
              backgroundColor: 
                'rgba(75, 192, 192, 0.7)',
                
            },
            {
              label: 'Tejidos',
              data: $('#data-area-Tejidos').html().slice(1,-1).split(','),
              backgroundColor: 
                'rgba(153, 102, 255, 0.7)'
            
            },
            {
              label: 'Ropa',
              data: $('#data-area-Ropa').html().slice(1,-1).split(','),
              backgroundColor:'rgba(255, 159, 64, 0.7)'
            
            },
          ]
       
        
    },
    options: {
        plugins: {
            title: {
              display: true,
              text: 'Ventas por categoría al mes',
              font: {
                size: 30,
              }
            },
          },
          responsive: true,
          scales: {
            x: {
              stacked: true,
            },
            y: {
              stacked: true
            }
          }
    }
});

