# Generated by Django 4.1.1 on 2022-09-22 18:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ("usuarios", "0001_initial"),
        ("productos", "0001_initial"),
    ]

    operations = [
        migrations.CreateModel(
            name="Factura",
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
                    "fecha",
                    models.DateField(
                        auto_now=True,
                        help_text="MM/DD/AAAA",
                        verbose_name="Fecha de factura",
                    ),
                ),
                (
                    "tipofactura",
                    models.CharField(max_length=10, verbose_name="Tipo de factura"),
                ),
                ("neto_pagar", models.IntegerField(default=0)),
                (
                    "estado",
                    models.CharField(
                        choices=[
                            ("Abierta", "Abierta"),
                            ("Cerrada", "Cerrada"),
                            ("Anulada", "Anulada"),
                        ],
                        default="Abierta",
                        max_length=10,
                        verbose_name="Estado",
                    ),
                ),
                (
                    "decision",
                    models.CharField(
                        choices=[("Activo", "Activo"), ("Inactivo", "Inactivo")],
                        default="Activo",
                        max_length=10,
                        verbose_name="Estado",
                    ),
                ),
                (
                    "rol",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="usuarios.rol",
                        verbose_name="Rol",
                    ),
                ),
                (
                    "usuario",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="usuarios.usuario",
                        verbose_name="Nombre",
                    ),
                ),
            ],
            options={"db_table": "facturas_factura",},
        ),
        migrations.CreateModel(
            name="Detalle",
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
                    "nombre_p",
                    models.CharField(
                        max_length=50, verbose_name="Nombre del producto "
                    ),
                ),
                (
                    "estado",
                    models.CharField(
                        choices=[
                            ("Abierta", "Abierta"),
                            ("Cerrada", "Cerrada"),
                            ("Anulada", "Anulada"),
                        ],
                        default="Abierta",
                        max_length=10,
                        verbose_name="Estado",
                    ),
                ),
                ("cantidad_detalle", models.IntegerField(default=0)),
                ("total", models.IntegerField(default=0)),
                ("precioX", models.IntegerField(default=0)),
                (
                    "factura",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="facturas.factura",
                        verbose_name="Factura",
                    ),
                ),
                (
                    "producto",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="productos.producto",
                        verbose_name="Producto",
                    ),
                ),
            ],
        ),
    ]
