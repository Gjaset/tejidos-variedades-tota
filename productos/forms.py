from dataclasses import fields
from django import forms

from productos.models import  Color, Talla, Marca, Color, Producto


class TallaForm(forms.ModelForm):
    class Meta:
        model = Talla
        fields= ['nombre']

class MarcaForm(forms.ModelForm):
    class Meta:
        model = Marca
        fields= ['nombre']
        
    def clean_nombre(self):
        nombre = self.cleaned_data['nombre']
        if not nombre.isalpha():
            raise forms.ValidationError('El nombre no puede contener numeros o simbolos')
        return nombre 

class ColorForm(forms.ModelForm):
    class Meta:
        model = Color
        fields= ['nombre']
        
    def clean_nombre(self):
        nombre = self.cleaned_data['nombre']
        if not nombre.isalpha():
            raise forms.ValidationError('El nombre no puede contener numeros o simbolos')
        return nombre   
        
class ProductoForm(forms.ModelForm):
    
    def __init__(self, *args, **kwargs):
        super(ProductoForm, self).__init__(*args, **kwargs)
        self.fields['precio'].widget.attrs['min'] = 1
        self.fields['stock'].widget.attrs['min'] = 1
        self.fields['porcentaje'].widget.attrs['min'] = 1
        self.fields['porcentaje'].widget.attrs['max'] = 99

    class Meta:
        model= Producto
        fields= ['categoria','nombre','precio', 'stock','porcentaje'] 
