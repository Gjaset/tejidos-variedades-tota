# Generated by Django 4.1.1 on 2022-09-29 01:20

from django.db import migrations, models
import gestion.models


class Migration(migrations.Migration):

    dependencies = [
        ('gestion', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='backup',
            name='archivo',
            field=models.FileField(upload_to='', validators=[gestion.models.validate_file_extension]),
        ),
    ]
