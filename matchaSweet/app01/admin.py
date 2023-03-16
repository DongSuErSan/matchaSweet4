from django.contrib import admin
from django.utils.safestring import mark_safe

from app01.models import MatchaImage, ShopInfo, Order, Comment, UserInfo


# Register your models here.

class UserInfoAdmin(admin.ModelAdmin):
    list_display = ['username', 'name', 'tel', 'sex', 'national']

    list_filter = ['name']

    list_per_page = 20


class ShopInfoAdmin(admin.ModelAdmin):
    def get_img(self):
        if self.avatar:
            return mark_safe(f'<img src="{self.avatar.url.url}" style="height:60px; border-radius:5px;">')
        return

    list_display = ['shop_name', 'price', 'number', get_img, 'create_date']

    list_filter = ['shop_name']

    list_per_page = 10


class OrderAdmin(admin.ModelAdmin):
    def get_user(self):
        return self.user.username

    def get_shop_name(self):
        return self.shop.shop_name

    list_display = [get_user, get_shop_name, 'order_number', 'total_price', 'create_date']

    list_filter = ['create_date']

    list_per_page = 20


class CommentAdmin(admin.ModelAdmin):
    def get_user(self):
        return self.user.username

    def get_shop_name(self):
        return self.shop.shop_name

    list_display = [get_user, get_shop_name, 'content', 'create_date']

    list_filter = ['content', 'create_date']

    list_per_page = 20

admin.site.register(UserInfo, UserInfoAdmin)
admin.site.register(MatchaImage)
admin.site.register(ShopInfo, ShopInfoAdmin)
admin.site.register(Comment, CommentAdmin)
admin.site.register(Order, OrderAdmin)

admin.site.site_header = 'MatchaSweetSystemManage'

admin.site.site_title = 'MatchaSweetSystemManage'
