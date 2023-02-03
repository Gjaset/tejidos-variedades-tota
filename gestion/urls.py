from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views 
from gestion.views import index, inicio, backup, ayudausuario, ayudainicio, ayudaindex


from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',index, name="index"),
    path('inicio/',inicio, name="inicio"),
    path('factura/', include('facturas.urls')),
    path('pago/', include('pago.urls')),
    path('usuario/', include ('usuarios.urls')),
    path('producto/', include('productos.urls')),
    path('login/', auth_views.LoginView.as_view(template_name='user/login.html'), name='usuario-login'),
    path('logout/', auth_views.LogoutView.as_view(template_name='user/logout.html'), name='usuario-logout'),
    path('registrar/',include('cuenta.urls')),
    path('backup/<str:tipo>/', backup , name="backup"),
    path('reset_password/', auth_views.PasswordResetView.as_view(template_name='registration/password_reset_form.html',email_template_name='registration/password_reset_email.html'),
         name='password_reset'),
    path('reset_password_send/', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/<uidb64>/<token>', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('reset_password_complete/', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete'),
    path('ayudainicip/', ayudainicio, name="ayudainicio"),
    path('ayudausuario/', ayudausuario, name="ayudausuario"),
    path('ayudaindex/', ayudaindex, name="ayudaindex"),
    
]+ static(
    settings.MEDIA_URL, 
    document_root = settings.MEDIA_ROOT)

    
    # path('reset/password_reset', password_reset, {'template_name':'registration/password_reset_form.html',
    #         'email_template':'registration/password_reset_email.html'}, name='password_reset'),
    # path('reset/password_reset_done', password_reset_done, {'template_name':'registration/password_reset_done.html'},
    #         name='password_reset_done'),
    # path('reset/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>)/$',password_reset_confirm,
    #      name='password_reset_confirm'),
    # path('reset/done', password_reset_complete, {'template_name':'registration/password_reset_complete.html'},
    #         name='password_reset_complete'),
    

