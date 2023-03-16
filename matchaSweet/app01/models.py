from django.contrib.auth.models import AbstractUser
from django.db import models


class UserInfo(AbstractUser):
    nid = models.AutoField(primary_key=True)
    nick_name = models.CharField(max_length=64, null=True, blank=True)
    tel = models.CharField(max_length=64, null=True, blank=True)
    addr = models.CharField(max_length=64, null=True, blank=True)
    name = models.CharField(max_length=64, null=True, blank=True)
    sex = models.CharField(max_length=64, null=True, blank=True)
    national = models.CharField(max_length=64, null=True, blank=True)
    amount = models.IntegerField(default=0)
    shop_cart = models.ManyToManyField(
        to='ShopInfo',
        blank=True
    )

    def __str__(self):
        return str(self.username)


class MatchaImage(models.Model):
    nid = models.AutoField(primary_key=True)
    url = models.FileField(upload_to='image/')

    def __str__(self):
        return str(self.url)


class ShopInfo(models.Model):
    nid = models.AutoField(primary_key=True)
    shop_name = models.CharField(max_length=64, null=True, blank=True)
    price = models.IntegerField(default=0)
    details = models.TextField(null=True, blank=True)
    number = models.IntegerField(default=0)
    avatar = models.ForeignKey(
        to='MatchaImage',
        to_field='nid',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    create_date = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.shop_name)


class Order(models.Model):
    nid = models.AutoField(primary_key=True)
    shop = models.ForeignKey(
        to='ShopInfo',
        to_field='nid',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    order_number = models.IntegerField(default=0)
    total_price = models.IntegerField(default=0)
    create_date = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(
        to='UserInfo',
        to_field='nid',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )

    def __str__(self):
        return str(self.nid)


class Comment(models.Model):
    nid = models.AutoField(primary_key=True)
    shop = models.ForeignKey(to='ShopInfo', to_field='nid', on_delete=models.CASCADE)
    content = models.TextField(verbose_name='评论内容')
    user = models.ForeignKey(
        to='UserInfo',
        to_field='nid',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    create_date = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return self.content

