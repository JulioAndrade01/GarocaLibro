# Generated by Django 4.1 on 2024-10-16 22:58

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_leitor_is_staff_leitor_is_superuser'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='leitor',
            name='is_superuser',
        ),
    ]