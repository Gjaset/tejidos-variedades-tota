from django.db import models
from django.utils.translation import gettext_lazy as _
from usuarios.models import  Usuario, Rol

class Talla(models.Model):
    
    nombre=models.CharField(max_length=10, unique=True,verbose_name="nombre")
    class Estado(models.TextChoices):
        ACTIVO='Activo', _('Activo')
        INACTIVO='Inactivo', _('Inactivo')
        ANULADO='Anulado', _('Anulado')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ACTIVO)
    def __str__(self) -> str:
        return "%s"% (self.nombre)
    def clean(self):
        self.nombre= self.nombre.title()

class Marca(models.Model):
    nombre=models.CharField(max_length=20, unique=True,verbose_name="Nombre")
    class Estado(models.TextChoices):
        ACTIVO='Activo', _('Activo')
        INACTIVO='Inactivo', _('Inactivo')
        ANULADO='Anulado', _('Anulado')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ACTIVO)
    def __str__(self) -> str:
        return '%s' % (self.nombre)
    def clean(self):  
        self.nombre= self.nombre.title()

class Color(models.Model):
    nombre=models.CharField(max_length=20, unique=True, verbose_name="Nombre")
    class Estado(models.TextChoices):
        ACTIVO='Activo', _('Activo')
        INACTIVO='Inactivo', _('Inactivo')
        ANULADO='Anulado', _('Anulado')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ACTIVO)
    def __str__(self) -> str:
        return '%s' % (self.nombre)
    def clean(self):
        self.nombre= self.nombre.title()


class Producto(models.Model):
    rol=models.ForeignKey(Rol, on_delete=models.SET_NULL, null=True,verbose_name=u"Proveedor/Asociada")
    usuario=models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True,verbose_name="Proveedor/Asociada")
    
    class Categoria(models.TextChoices):
        TEJIDOS='Tejidos',_('Tejidos')
        ROPA='Ropa',_('Ropa')   
        CALZADO='Calzado',_('Calzado')  
    categoria=models.CharField(max_length=10, choices=Categoria.choices, verbose_name="Categoría")
    nombre=models.CharField(max_length=50, verbose_name="Nombre del producto ")
    stock=models.IntegerField(verbose_name="Cantidad")
    precio= models.FloatField(verbose_name="Precio")
    precio_venta= models.FloatField(default=0,verbose_name="Precio venta")
    porcentaje= models.IntegerField(verbose_name="Porcentaje")
    valorPorcentaje=models.FloatField(default=0,verbose_name="Valor Porcentaje ")
    class Estado(models.TextChoices):
        ACTIVO='Activo', _('Activo')
        INACTIVO='Inactivo', _('Inactivo')
        ANULADO='Anulado', _('Anulado')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ACTIVO)
    talla= models.ForeignKey(Talla, on_delete=models.SET_NULL, null=True, verbose_name=u"Talla")
    marca= models.ForeignKey(Marca, on_delete=models.SET_NULL, null=True, verbose_name=u"Marca")
    color= models.ForeignKey(Color, on_delete=models.SET_NULL, null=True, verbose_name=u"Color")
    def __str__(self)-> str:
        return 'N:%s / M:%s / T:%s / C:%s / Stock:%s' % (self.nombre,self.marca,self.talla,self.color,self.stock)
    def clean(self):
        self.nombre= self.nombre.title()


    


# https://developer.mozilla.org/es/docs/Learn/Server-side/Django/Authentication
       

