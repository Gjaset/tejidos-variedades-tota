# Generated by Django 4.1.1 on 2022-09-22 18:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ("usuarios", "0001_initial"),
    ]

    operations = [
        migrations.CreateModel(
            name="Color",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "nombre",
                    models.CharField(max_length=20, unique=True, verbose_name="Nombre"),
                ),
                (
                    "estado",
                    models.CharField(
                        choices=[
                            ("Activo", "Activo"),
                            ("Inactivo", "Inactivo"),
                            ("Anulado", "Anulado"),
                        ],
                        default="Activo",
                        max_length=10,
                        verbose_name="Estado",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Marca",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "nombre",
                    models.CharField(max_length=20, unique=True, verbose_name="Nombre"),
                ),
                (
                    "estado",
                    models.CharField(
                        choices=[
                            ("Activo", "Activo"),
                            ("Inactivo", "Inactivo"),
                            ("Anulado", "Anulado"),
                        ],
                        default="Activo",
                        max_length=10,
                        verbose_name="Estado",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Talla",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "nombre",
                    models.CharField(max_length=10, unique=True, verbose_name="nombre"),
                ),
                (
                    "estado",
                    models.CharField(
                        choices=[
                            ("Activo", "Activo"),
                            ("Inactivo", "Inactivo"),
                            ("Anulado", "Anulado"),
                        ],
                        default="Activo",
                        max_length=10,
                        verbose_name="Estado",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Producto",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "categoria",
                    models.CharField(
                        choices=[
                            ("Tejidos", "Tejidos"),
                            ("Ropa", "Ropa"),
                            ("Calzado", "Calzado"),
                        ],
                        max_length=10,
                        verbose_name="Categoría",
                    ),
                ),
                (
                    "nombre",
                    models.CharField(
                        max_length=50, verbose_name="Nombre del producto "
                    ),
                ),
                ("stock", models.IntegerField(verbose_name="Cantidad")),
                ("precio", models.FloatField(verbose_name="Precio")),
                (
                    "precio_venta",
                    models.FloatField(default=0, verbose_name="Precio venta"),
                ),
                ("porcentaje", models.IntegerField(verbose_name="Porcentaje")),
                (
                    "valorPorcentaje",
                    models.FloatField(default=0, verbose_name="Valor Porcentaje "),
                ),
                (
                    "estado",
                    models.CharField(
                        choices=[
                            ("Activo", "Activo"),
                            ("Inactivo", "Inactivo"),
                            ("Anulado", "Anulado"),
                        ],
                        default="Activo",
                        max_length=10,
                        verbose_name="Estado",
                    ),
                ),
                (
                    "color",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="productos.color",
                        verbose_name="Color",
                    ),
                ),
                (
                    "marca",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="productos.marca",
                        verbose_name="Marca",
                    ),
                ),
                (
                    "rol",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="usuarios.rol",
                        verbose_name="Proveedor/Asociada",
                    ),
                ),
                (
                    "talla",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="productos.talla",
                        verbose_name="Talla",
                    ),
                ),
                (
                    "usuario",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="usuarios.usuario",
                        verbose_name="Proveedor/Asociada",
                    ),
                ),
            ],
        ),
    ]