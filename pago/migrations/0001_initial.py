# Generated by Django 4.1.1 on 2022-09-22 18:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ("usuarios", "0001_initial"),
        ("facturas", "0001_initial"),
    ]

    operations = [
        migrations.CreateModel(
            name="Pago",
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
                    "usuario",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="usuarios.usuario",
                        verbose_name="Nombre",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Detalle_pago",
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
                ("valor", models.IntegerField(blank=True, null=True)),
                ("total", models.IntegerField(blank=True, null=True)),
                (
                    "detalle",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="facturas.detalle",
                        verbose_name="detalle",
                    ),
                ),
                (
                    "pago",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="pago.pago",
                        verbose_name="Pago",
                    ),
                ),
            ],
        ),
    ]
