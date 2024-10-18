# Generated by Django 4.1 on 2024-10-16 20:53

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_remove_leitor_status_leitor_endereco_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Agendamento',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('criado', models.DateTimeField(auto_now_add=True, verbose_name='Data de Criação')),
                ('modificado', models.DateTimeField(auto_now=True, verbose_name='Data de Atualização')),
                ('ativo', models.BooleanField(default=True, verbose_name='Ativo?')),
                ('data_retirada', models.DateTimeField(help_text='Escolha uma data e hora futuras', verbose_name='Data de Retirada')),
                ('status', models.CharField(choices=[('scheduled', 'Agendado'), ('completed', 'Finalizado')], default='scheduled', max_length=20, verbose_name='Status')),
                ('leitor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('livro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.livro')),
            ],
            options={
                'verbose_name': 'Agendamento de Retirada',
                'verbose_name_plural': 'Agendamentos de Retirada',
            },
        ),
    ]
