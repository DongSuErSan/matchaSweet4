from django.urls import path, re_path
from api.views import login, user, shop, order, comment, admin_data

urlpatterns = [
    path('login/', login.LoginView.as_view()),
    path('sign/', login.SignView.as_view()),
    path('userlur/', user.UserLurView.as_view()),
    path('get_seven_data/', admin_data.get_seven_data),  # 获取七日用户注册
    path('get_order_data/', admin_data.get_order_data),  # 获取商品销量
    path('get_seven_order/', admin_data.get_seven_order),
    re_path('collects/(?P<nid>\d+)/', shop.CollectsView.as_view()),
    re_path('order/(?P<nid>\d+)/', order.OrderView.as_view()),
    re_path(r'comment/(?P<nid>\d+)/', comment.CommentView.as_view()),
]
