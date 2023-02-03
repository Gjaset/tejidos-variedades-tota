from django.urls import path
from facturas.views import  tfactura, detalle, factura_estado,detalle_estado, factura_eliminar, gfactura,facturaInacti
from django.contrib.auth import views as auth_views


urlpatterns = [
    path('factura/', tfactura, name='factura-tfactura'),
    path('detalle/<int:pk>/', detalle, name='factura-detalle'),
    path('facturai/', facturaInacti, name='factura-facturai'),
    path('detalle-factura/estado/<int:pk>/<str:estado>/', factura_estado, name='factura_estado'),
    path('detalle-estado/eliminar/<int:pk>/<str:cantidad>', detalle_estado, name='detalle_eliminar_estado'),
     path('generarfactura/<int:pk>', gfactura, name='factura-generarfactura'),
    path('eliminar/<int:pk>/', factura_eliminar, name='factura_eliminarA'),
]

 