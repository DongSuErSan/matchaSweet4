# Generated by Django 4.1.7 on 2023-03-14 05:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0003_comment_create_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shopinfo',
            name='details',
            field=models.TextField(blank=True, null=True),
        ),
    ]
