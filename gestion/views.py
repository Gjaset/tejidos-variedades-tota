from itertools import product
from math import prod
from pathlib import Path
from django.shortcuts import redirect,render
from django.apps import apps
import sys
from django.core import management
from facturas.models import Detalle
from pago.models import Detalle, Detalle_pago
from facturas.views import tfactura
from gestion.forms import UploadFileForm
from django.conf import settings
from django.core.mail import send_mail
from django.db.models.functions import TruncMonth
from gestion.models import Backup
from gestion.forms import BackupForm
from django.http import FileResponse
import os
import zipfile
from datetime import date, datetime
from django.db.models import Count
from django.db.models import Max, Sum
from django.db import models
from django.contrib.auth.decorators import login_required
from django.contrib import messages

def index(request):
    
    titulo_pagina="Index"
    context={
        'titulo_pagina':titulo_pagina
    }
    return render(request,'index.html',context)

    
@login_required(login_url="usuario-login")
def export_data(request):
    date_now = date.today()
    tabla = request.POST['opcion']
    os.system(f"mysqldump --add-drop-table --column-statistics=0 --password=admin -u root db_tejidos --tables {tabla}> static/tablas/Copia_de_seguridad_{tabla}_{date_now}.sql")
    print('imprimio la tabla ', tabla )
    print('-------------------------------------------------------Hecho')
def import_data(archivo, request):
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>LISTO PA´ IMPRIMIR')
    try:    
        print('------------------------IMPORTAR')
        url = f'C:/Users/jerja/Desktop/24-09-22/{archivo[1:]}'
        os.system(f"mysql -u root --password=admin db_tejidos < {url}")
        print('--------------------------------',url)
        messages.success(request,'Restaurado corretamente')
        print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><Salio')
    except Exception as err:
        messages.warning(request,f'error {err} ')
        print('error ', err)
def backup(request, tipo):
    title_pag = "Backup"
    location = True
    admin = True
    example_dir = 'static/backup'
    with os.scandir (example_dir) as ficheros:
        ficheros = [fichero.name for fichero in ficheros if fichero.is_file()]
    
    ruta = 'static/tablas'
    with os.scandir(ruta) as bases:
       bases = [base.name for base in bases if base.is_file()]
    
    backups = Backup.objects.all()
    if request.method == 'POST' and tipo== "U":
        print('----------------------------------INTENTO')
        form = BackupForm(request.POST, request.FILES)
        if form.is_valid():
            nombre= request.POST['nombre']
            archivo = request.FILES['archivo']
            insert = Backup(nombre=nombre, archivo=archivo)
            import_data(insert.archivo.url, request)
            insert.save()
            print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<GUARDÓ')
            return redirect('backup','A')
        else:
            print( ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Error al procesar el formulario")
              
    elif request.method == 'POST' and tipo== "D":
        export_data(request)
        return redirect('backup','A')
    
    else:
        form = BackupForm()
        
    context ={
        "ficheros":ficheros,
        'bases':bases,
        "form":form,
        "backups":backups,
        'title_pag':title_pag,
        'admin':admin,
        'location':location
    }
    return render(request, 'backup.html',context) 


@login_required(login_url="usuario-login")
def inicio(request):

        # pagoAsociada= Detalle_pago.objects.filter(factura__estado="Cerrada",factura__tipofactura="Venta").values('cantidad_detalle','producto','producto__categoria','pago__fecha')
    # pagos={"Tejidos":list()}

    # for mes in range(12):
    #     pagos=["Tejidos"].append(pagoAsociada.filter(producto__categoria="Tejidos",pago__fecha__month=mes+1,pago__fecha__year=datetime.now().year).aggregate(Sum('cantidad_detalle'))['cantidad_detalle__sum'])
        
    venta= Detalle.objects.filter(factura__estado="Cerrada",factura__tipofactura="Venta").values('cantidad_detalle','producto','producto__categoria', 'total','factura__fecha')
    ventas={"Calzado":list(),"Tejidos":list(),"Ropa":list(),"Suma_ventas":list(),"Suma_total":list()}
    # cantidadA= Detalle.objects.filter(factura__estado="Cerrada",factura__tipofactura="Venta").values('cantidad_detalle','producto','producto__categoria','factura__fecha')
    # cant={"Tejidos":list()}
# 'codigo_asociada',
    for mes in range(12):
        ventas["Calzado"].append(venta.filter(producto__categoria="Calzado",factura__fecha__month=mes+1,factura__fecha__year=datetime.now().year).aggregate(Sum('cantidad_detalle'))['cantidad_detalle__sum'])
        ventas["Tejidos"].append(venta.filter(producto__categoria="Tejidos",factura__fecha__month=mes+1,factura__fecha__year=datetime.now().year).aggregate(Sum('cantidad_detalle'))['cantidad_detalle__sum'])
        ventas["Ropa"].append(venta.filter(producto__categoria="Ropa",factura__fecha__month=mes+1,factura__fecha__year=2022).aggregate(Sum('cantidad_detalle'))['cantidad_detalle__sum'])
       
        ventas["Suma_ventas"].append(venta.filter(factura__fecha__month=mes+1,factura__fecha__year=datetime.now().year).aggregate(Sum('cantidad_detalle'))['cantidad_detalle__sum'])
        ventas["Suma_total"].append(venta.filter(factura__fecha__month=mes+1,factura__fecha__year=datetime.now().year).aggregate(Sum('total'))['total__sum'])
        # cant["Tejidos"].append(cantidadA.filter(producto__categoria="Tejidos",factura__usuario_id=1,factura__fecha__month=mes+1,factura__fecha__year=datetime.now().year).aggregate(Sum('cantidad_detalle'))['cantidad_detalle__sum'])
        
        # print(cant)
        for i,item in enumerate(ventas["Calzado"]):
            if item==None:
                ventas["Calzado"][i]=0
            if ventas["Tejidos"][i]== None:
                ventas["Tejidos"][i]=0
            if ventas["Ropa"][i]== None:
                ventas["Ropa"][i]=0
            if ventas["Suma_ventas"][i]== None:
                 ventas["Suma_ventas"][i]=0
            if ventas["Suma_total"][i]== None:
                ventas["Suma_total"][i]=0  

                
    # for mes in meses:
    #     calzado[mes]=[venta.filter(producto__categoria="Calzado",factura__fecha__month=contador,factura__fecha__year=2022).aggregate(Sum('cantidad_detalle'))['cantidad_detalle__sum']]
    #     tejidos[mes]=[venta.filter(producto__categoria="tejidos",factura__fecha__month=contador,factura__fecha__year=2022).aggregate(Sum('cantidad_detalle'))['cantidad_detalle__sum']]
    #     ropa[mes]=[venta.filter(producto__categoria="ropa",factura__fecha__month=contador,factura__fecha__year=2022).aggregate(Sum('cantidad_detalle'))['cantidad_detalle__sum']]
    #     contador+=1

    print(ventas)
    titulo_pagina="Inicio"
    context={
        'titulo_pagina':titulo_pagina,
        'ventas':ventas,
        # 'pagos':pagos,
    }
    return render(request,'inicio.html',context)


def ayudaindex(request):
    
    titulo_pagina="Ayuda"
    context={
        'titulo_pagina':titulo_pagina
    }
    return render(request, 'ayuda/ayudaindex.html', context)

def ayudausuario(request):
    
    titulo_pagina="Ayuda"
    context={
        'titulo_pagina':titulo_pagina
    }
    return render(request, 'ayuda/ayudausuario.html', context)

def ayudainicio(request):
    
    titulo_pagina="Ayuda"
    context={
        'titulo_pagina':titulo_pagina
    }
    return render(request, 'ayuda/ayudainicio.html', context)

def ayudaproducto(request):
    
    titulo_pagina="Ayuda"
    context={
        'titulo_pagina':titulo_pagina
    }
    return render(request, 'ayuda/ayudaproducto.html', context)

def ayudapago(request):
    
    titulo_pagina="Ayuda"
    context={
        'titulo_pagina':titulo_pagina
    }
    return render(request, 'ayuda/ayudapago.html', context)

def ayudafactura(request):
    
    titulo_pagina="Ayuda"
    context={
        'titulo_pagina':titulo_pagina
    }
    return render(request, 'ayuda/ayudafactura.html', context)