import datetime

from django.contrib import auth
from django.shortcuts import render, redirect
from app01.models import UserInfo, ShopInfo, Comment, Order, MatchaImage


# Create your views here.
def index(request):
    return render(request, 'index.html')


def logout(request):
    auth.logout(request)
    return redirect('/')


def home(request):
    user_info = UserInfo.objects.filter(nid=request.user.nid).first()
    shop_list = ShopInfo.objects.all()
    return render(request, 'home.html', locals())


def user(request):
    user_info = UserInfo.objects.filter(nid=request.user.nid).first()
    return render(request, 'user.html', locals())


def userinfo(request):
    user_info = UserInfo.objects.filter(nid=request.user.nid).first()
    return render(request, 'userinfo.html', locals())


def shop(request, nid):
    shop_obj = ShopInfo.objects.filter(nid=nid).first()
    comment_list = Comment.objects.filter(shop_id=nid).all()
    user_info = UserInfo.objects.filter(nid=request.user.nid).first()
    return render(request, 'shop.html', locals())


def my_order(request):
    user_info = UserInfo.objects.filter(nid=request.user.nid).first()
    order_list = Order.objects.filter(user=request.user).all()
    return render(request, 'my_order.html', locals())


def search(request):
    user_info = UserInfo.objects.filter(nid=request.user.nid).first()
    return render(request, 'search.html', locals())


def search_shop(request):
    key = request.GET.get('key')
    shop_list = ShopInfo.objects.filter(shop_name__contains=key)
    flag = shop_list.first()
    return render(request, 'search_shop.html', locals())


def shopCart(request):
    user_info = UserInfo.objects.filter(nid=request.user.nid).first()
    shop_list = request.user.shop_cart.all()
    return render(request, 'shoppingCart.html', locals())


def route(request):
    user_info = UserInfo.objects.filter(nid=request.user.nid).first()
    return render(request, 'route.html', locals())


def admin_home(request):
    user_count = UserInfo.objects.count()

    shop_count = ShopInfo.objects.count()

    comment_count = Comment.objects.count()

    order_count = Order.objects.count()

    img_list = MatchaImage.objects.count()

    now = datetime.date.today()
    today_sign = UserInfo.objects.filter(
        date_joined__gte=now
    ).count()

    today_order = Order.objects.filter(
        create_date__gte=now
    ).count()

    online_count = len(request.online_list)
    return render(request, 'admin_home.html', locals())
