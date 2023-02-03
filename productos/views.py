from multiprocessing import context
from django.shortcuts import render, redirect
from productos.forms import TallaForm,MarcaForm, ColorForm, ProductoForm
from productos.models import Talla, Marca, Color, Producto
from django.contrib import messages
from datetime import datetime
from django.contrib.auth.decorators import login_required

from usuarios.models import Usuario, Rol

@login_required(login_url="usuario-login")
def talla(request):
    """En esta funcion se carga formulario y se guarda en la base de datos, y tambien imprime esta 
    informacion en el mismo HTML en una tabla
    """
    tallas=Talla.objects.all()
    titulo_pagina="Productos"
    if request.method == 'POST':
        form= TallaForm(request.POST)
        if form.is_valid():
            form.save()
            nombre= form.cleaned_data.get('nombre')
            messages.success(request,f'Talla {nombre} agregada correctamente')
            return redirect('producto-talla')
        else:
            nombre= form.cleaned_data.get('nombre')
            messages.warning(request,f'Talla ya existente')

            return redirect('producto-talla')
    else:
        form= TallaForm()
    context={
        "titulo_pagina": titulo_pagina,
        "form":form,
        "tallas":tallas
    }
    return render(request, "producto/creartalla.html", context)



@login_required(login_url="usuario-login")
def marca(request):

    """ En esta funcion se carga formulario y se guarda en la base de datos, y tambien imprime esta 
    informacion en el mismo HTML en una tabla
    """
    titulo_pagina="Productos"
    marcas= Marca.objects.all()
    if request.method == 'POST':
        form= MarcaForm(request.POST)
        if form.is_valid():
            form.save()
            marca_nombre= form.cleaned_data.get('nombre')
            messages.success(request,f'Marca {marca_nombre} agregada correctamente')
        else:
            nombre= form.cleaned_data.get('nombre')
            messages.warning(request,f'Asegurese que este campo no contenga numeros, espacios o que ya exista esta marca')
        return redirect('producto-marca')
    else:
        form = MarcaForm()
    context={
        "titulo_pagina": titulo_pagina,
        "marcas": marcas,
        "form":form
    }
    return render(request, "producto/crearmarca.html", context)
@login_required(login_url="usuario-login")
def marca_eliminar(request,pk):

    """
    Tiene como funcionamiento eliminar por id la marca de la base de datos
    """

    titulo_pagina='Marca'
    marcas= Marca.objects.all()
    marca= Marca.objects.get(id=pk)
    producto= Producto.objects.filter(marca_id = pk)
    accion_txt= f"la marca {marca.id}"
    if request.method == 'POST':
        form = MarcaForm(request.POST)
        if len(producto) == 0:
            Marca.objects.filter(id=pk).delete()
            marca_nombre= marca.nombre
            messages.success(request,f'Marca {marca_nombre} agregada correctamente')
            return redirect('producto-marca')
        else:
            messages.warning(request,f'Marca no se puede eliminar porque se esta usando')
            return redirect('producto-marca')
    else:
        form:MarcaForm()
    context={
            "titulo_pagina": titulo_pagina,
            "accion_txt":accion_txt,
            "marcas": marcas,
            
    }
    return render(request, "producto/marca-eliminar.html", context)
@login_required(login_url="usuario-login")
def color(request):
    """
    En esta funcion se carga formulario y se guarda en la base de datos, y tambien imprime esta 
    informacion en el mismo HTML en una tabla
    """
    colores= Color.objects.all()
    if request.method == 'POST':
        form= ColorForm(request.POST)
        if form.is_valid():
            form.save()
            color_nombre= form.cleaned_data.get('nombre')
            messages.success(request,f'Color {color_nombre} agregado correctamente')
        else:
            nombre= form.cleaned_data.get('nombre')
            messages.warning(request,f'Asegurese que este campo no contenga numeros, espacios o que ya exista este color')
        return redirect('producto-color')
    else:
        form = ColorForm()
    context={
        "colores": colores,
        "form":form
    }
    return render(request, "producto/color.html", context)
@login_required(login_url="usuario-login")
def color_eliminar(request,pk):
    """
    Tiene como funcionamiento eliminar por id el color de la base de datos
    """
    titulo_pagina='Color'
    colores= Color.objects.all()
    color= Color.objects.get(id=pk)
    producto= Producto.objects.filter(color_id = pk)
    accion_txt= f"el color {color.id}"
    if request.method == 'POST':
        form = ColorForm(request.POST)
        if len(producto)==0:
            Color.objects.filter(id=pk).delete()
            color_nombre= color.nombre
            
            messages.success(request,f'Color {color_nombre} eliminado correctamente')
            return redirect('producto-color')
        else:
            messages.warning(request,f'Color no se puede eliminar porque se esta usando')
            return redirect('producto-color')
            
       
                
    else:
        form:ColorForm()
    context={
            "titulo_pagina": titulo_pagina,
            "accion_txt":accion_txt,
            "colores": colores,
            
    }
    return render(request, "producto/color-eliminar.html", context)
@login_required(login_url="usuario-login")
def Editarcolor(request,pk):
    """
    Carga el formulario de color con los campos ya llenos 
    con el fin de poder editar y actualizar la informacion
    """
    titulo_pagina="Color"
    colores= Color.objects.get(id=pk)

    producto= Producto.objects.filter(talla_id = pk)
    if request.method == 'POST':
        form= MarcaForm(request.POST, instance=colores)
        if len(producto) == 0:
            if form.is_valid():
                form.save()
            messages.success(request,f'Color editada correctamente')
            return redirect('producto-color')
        else:
            messages.warning(request,f'Color no se puede editar porque se esta usando')
            return redirect('producto-color')
    else:
        form= ColorForm(instance=colores)
        context={
        "colores": colores,
        "titulo_pagina": titulo_pagina,
        'form':form
    }
    return render(request, "producto/editarcolor.html", context)

@login_required(login_url="usuario-login")
def producto(request):
    """
    Se hereda de las tablas rol (Excluyendo a los clientes ya que un cliente no puede crear un producto), 
    color (Se excluye los colores inactivos), usuario.
    Despues se carga el formulario y en el campo valor porcentaje se hace la operacion de convertir porcentaje a decimal 
    para asi poder multiplicarlo con el precio y obtener un valor de un determinado porcentaje

    aux.precio * (aux.porcentaje/100)
    
    4000 * (20 / 100) =4000*(0.2)= 800 =valor de porcentaje
    
    """
    rol_c=Rol.objects.exclude(Rnombre="Cliente")
    color=Color.objects.filter(estado="Activo")
    marca=Marca.objects.filter(estado="Activo")
    talla=Talla.objects.filter(estado="Activo")

    usuario_c=Usuario.objects.all()
    titulo_pagina="Producto"
    if request.method == 'POST':
        form = ProductoForm(request.POST)    
        producto_nombres= request.POST['nombre']
        if form.is_valid():
            nombre = form.cleaned_data['nombre']
            talla = request.POST['talla']
            marca = request.POST['marca']
            color = request.POST['color']
            rol = request.POST['rol']

            if Producto.objects.filter(rol=rol, nombre=nombre, marca=marca, talla=talla, color=color).exists():
                messages.warning(request,f'Ya hay un producto registrado con esas caracteristicas')
                return redirect('producto-producto')
            else:
                aux= form.save()
                Producto.objects.filter(id=aux.id).update(
                    rol_id= request.POST['rol'],
                    talla_id=request.POST['talla'],
                    marca_id=request.POST['marca'],
                    color_id=request.POST['color'],
                    usuario= Usuario.objects.get(Uid=request.POST['usuario']),
                    valorPorcentaje= aux.precio * (aux.porcentaje/100),
                    precio_venta=aux.precio + (aux.precio * (aux.porcentaje/100)),
                )
                messages.success(request,f'Producto {producto_nombres} agregado correctamente')
                return redirect('producto-producto')
        else:
            messages.warning(request,f'El producto no se puede editar')
            return redirect('producto-editarproducto')
    else:
        form = ProductoForm()
    context={
        'form':form,  
        "titulo_pagina":titulo_pagina,
        "rol":rol_c,
        "color":color,
        "marca":marca,
        "talla":talla,
        "usuario":usuario_c}
    return render(request,'producto/crearproducto.html', context)

@login_required(login_url="usuario-login")
def productoT (request):
    """
    Se imprime la informacion de todos los productos guardados
    en la base de datos 
    """
    titulo_pagina="Producto"
    productoTs= Producto.objects.all() 
    context= {
        "productoTs": productoTs,
        "titulo_pagina":titulo_pagina
    }
    return render(request,"producto/producto.html", context)
@login_required(login_url="usuario-login")
def Verproducto (request,pk):
    """
    Muestra mas especificamente la informacion de cada producto por 
    medio de la id 
    """
    titulo_pagina="Producto"
    producto= Producto.objects.get(id=pk) 
    print(producto)
    context={
        "producto": producto,
        "titulo_pagina":titulo_pagina
    }
    return render(request,"producto/ver-producto.html", context)

@login_required(login_url="usuario-login")
def Editarproducto(request,pk):
    """
    Carga el formulario ya con los campos llenos sin heredar nada, y con esto
    se podra actualizar la informacion, Si se llega a modificar el porcentaje a ganar o el 
    valor del producto se volvera a hacer su respectiva operacion
    """
    colores=Color.objects.filter(estado="Activo")
    marcas=Marca.objects.filter(estado="Activo")
    tallas=Talla.objects.filter(estado="Activo")
    titulo_pagina="Producto"
    productt = Producto.objects.get(id=pk)
    productos_e=Producto.objects.filter(id=pk)
    if request.method == 'POST':
        form = ProductoForm(request.POST, instance=productt)
        producto_nombres= request.POST['nombre']
        if form.is_valid():
            nombre = form.cleaned_data['nombre']
            talla = request.POST['talla']
            marca = request.POST['marca']
            color = request.POST['color']
            if Producto.objects.filter( nombre=nombre, marca=marca, talla=talla, color=color).exists():
                if Producto.objects.filter(id=pk,nombre=nombre, marca=marca, talla=talla, color=color).exists():
                    aux= form.save()
                    Producto.objects.filter(id=aux.id).update(
                    talla_id=request.POST['talla'],
                    marca_id=request.POST['marca'],
                    color_id=request.POST['color'],
                    valorPorcentaje= aux.precio * (aux.porcentaje/100),
                    precio_venta=aux.precio + (aux.precio * (aux.porcentaje/100)),
                )
                    messages.success(request,f'Producto {producto_nombres} editado correctamente')
                    return redirect('producto-producto')
                else:
                    messages.warning(request,f'Ya hay un producto registrado con esas caracteristicas')
                    return redirect('producto-producto')
            else:
                aux= form.save()
                Producto.objects.filter(id=aux.id).update(
                valorPorcentaje= aux.precio * (aux.porcentaje/100),
                precio_venta=aux.precio + (aux.precio * (aux.porcentaje/100)),
                talla_id=request.POST['talla'],
                marca_id=request.POST['marca'],
                color_id=request.POST['color'],
            )
                messages.success(request,f'Producto {producto_nombres} agregado correctamente')
                return redirect('producto-producto')

        return redirect('producto-producto')
    else:
        form = ProductoForm(instance=productt)
        context={
        "producto": producto,
        "colores":colores,
        "marcas":marcas,
        "tallas":tallas,
        "titulo_pagina":titulo_pagina,
        'base_datos':productt,
        'edit':productos_e,
        'form':form,
        "titulo_pagina":titulo_pagina
    }
    return render(request,'producto/editarproducto.html', context)



@login_required(login_url="usuario-login")
def Editartalla(request,pk):
    titulo_pagina="Producto"
    producto= Producto.objects.filter(talla_id = pk)
    tallas= Talla.objects.get(id=pk)
    if request.method == 'POST':
        form = MarcaForm(request.POST, instance=tallas)
        if len(producto) == 0:
            if form.is_valid():
                form.save()
            messages.success(request,f'Talla editada correctamente')
            return redirect('producto-talla')
        else:
            messages.warning(request,f'Talla no se puede editar porque se esta usando')
            return redirect('producto-talla')
    else:
        form= TallaForm(instance=tallas)
        context={
        "tallas": tallas,
        "titulo_pagina": titulo_pagina,
        'form':form
    }
    return render(request, "producto/editartalla.html", context)
@login_required(login_url="usuario-login")


def Editarmarca(request,pk):
    titulo_pagina="Producto"
    producto= Producto.objects.filter(marca_id = pk)
    marcas= Marca.objects.get(id=pk)
    if request.method == 'POST':
        form = MarcaForm(request.POST, instance=marcas)
        if len(producto) == 0:
            if form.is_valid():
                form.save()
            messages.success(request,f'Marca editada correctamente')
            return redirect('producto-marca')
        else:
            messages.warning(request,f'Marca no se puede editar porque se esta usando')
            return redirect('producto-marca')
    else:
        form= MarcaForm(instance=marcas)
        context={
        "marcas": marcas,
        "titulo_pagina": titulo_pagina,
        'form':form
    }
    return render(request, "producto/editarmarca.html", context)
@login_required(login_url="usuario-login")
def talla_eliminar(request,pk):
    titulo_pagina='producto'
    tallas= Talla.objects.all()
    talla= Talla.objects.get(id=pk)
    producto= Producto.objects.filter(talla_id = pk)
    
    print(producto,"---------------------")
    accion_txt= f"talla {talla.id}"
    if request.method == 'POST':
        form = TallaForm(request.POST)
        if len(producto) == 0:
            
            Talla.objects.filter(id=pk).delete(
                    )
            talla_nombre= talla.nombre
            
            messages.success(request,f'Talla {talla_nombre} eliminada correctamente')
            return redirect('producto-talla')
        else:
            
            messages.warning(request,f'Talla no se puede eliminar porque se esta usando')
            return redirect('producto-talla')
                
    else:
        form:TallaForm()
    context={
            "titulo_pagina": titulo_pagina,
            "accion_txt":accion_txt,
            "tallas": tallas,
            
    }
    return render(request, "producto/talla-eliminar.html", context)
@login_required(login_url="usuario-login")
def producto_eliminar(request,pk):
    titulo_pagina='producto'
    productoTs= Producto.objects.all()
    productoT= Producto.objects.get(id=pk)
    accion_txt= f"producto {productoT.id}"
    if request.method == 'POST':
        form = ProductoForm(request.POST)
        Producto.objects.filter(id=pk).update(
                    estado='Inactivo'
                )
        productoT_nombre= productoT.nombre
        messages.success(request,f'Producto {productoT_nombre} eliminado correctamente')
        return redirect('producto-producto')
                
    else:
        form:ProductoForm()
    context={
            "titulo_pagina": titulo_pagina,
            "accion_txt":accion_txt,
            "productoTs": productoTs,
            
    }
    return render(request, "producto/producto-eliminar.html", context)
@login_required(login_url="usuario-login")
def productoInactivo (request):
    """
    Se imprime la informacion de todos los productos guardados
    en la base de datos 
    """
    titulo_pagina="Producto"
    productoTs= Producto.objects.all() 
    context= {
        "productoTs": productoTs,
        "titulo_pagina":titulo_pagina
    }
    return render(request,"producto/productoInactivo.html", context)












