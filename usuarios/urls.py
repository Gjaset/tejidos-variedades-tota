from django.urls import path
from usuarios.views import cusuario, tusuario,Editarusuario, vusuario, usuario_eliminar, usuarioInactivo, activar_usuario
urlpatterns = [
    path('crearusuario/', cusuario, name='usuario-crearUsuario'),
    path('tablausuario/', tusuario, name='usuario-tablaUsuario'),
    path('usuarioinactivo/', usuarioInactivo, name='usuario-usuarioI'),
    path('verusuario/<int:pk>', vusuario, name='usuario-verusuario'),
    path('editarusuario/<int:pk>', Editarusuario, name='usuario-editarusuario'),
    path('tablausuario/eliminar/<int:pk>/', usuario_eliminar, name='usuario-usuario-eliminar'),
    path('tablausuario/activar/<int:pk>/', activar_usuario, name='usuario-usuario-activar'),
    
]