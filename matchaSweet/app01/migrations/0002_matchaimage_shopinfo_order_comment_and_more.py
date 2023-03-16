# Generated by Django 4.1.7 on 2023-03-14 04:11

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='MatchaImage',
            fields=[
                ('nid', models.AutoField(primary_key=True, serialize=False)),
                ('url', models.FileField(upload_to='image/')),
            ],
        ),
        migrations.CreateModel(
            name='ShopInfo',
            fields=[
                ('nid', models.AutoField(primary_key=True, serialize=False)),
                ('shop_name', models.CharField(blank=True, max_length=16, null=True)),
                ('price', models.IntegerField(blank=True, default=0, null=True)),
                ('details', models.CharField(blank=True, max_length=64, null=True)),
                ('number', models.IntegerField(blank=True, default=0, null=True)),
                ('avatar', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='app01.matchaimage')),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('nid', models.AutoField(primary_key=True, serialize=False)),
                ('order_number', models.IntegerField(default=0)),
                ('total_price', models.IntegerField(default=0)),
                ('create_date', models.DateTimeField(auto_now_add=True)),
                ('shop', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='app01.shopinfo')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('nid', models.AutoField(primary_key=True, serialize=False)),
                ('content', models.TextField(verbose_name='评论内容')),
                ('shop', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app01.shopinfo')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='userinfo',
            name='shop_cart',
            field=models.ManyToManyField(blank=True, to='app01.shopinfo'),
        ),
    ]
