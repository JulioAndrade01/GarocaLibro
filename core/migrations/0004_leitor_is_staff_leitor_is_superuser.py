# Generated by Django 4.1 on 2024-10-16 22:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_agendamento'),
    ]

    operations = [
        migrations.AddField(
            model_name='leitor',
            name='is_staff',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='leitor',
            name='is_superuser',
            field=models.BooleanField(default=False),
        ),
    ]
