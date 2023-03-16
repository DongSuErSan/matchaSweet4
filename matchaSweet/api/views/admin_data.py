import datetime
from app01.models import UserInfo, Order
from django.http import JsonResponse


def get_seven_data(request):
    today = datetime.date.today()
    seven_data = {
        'date': [],
        'login_data': [],
        'sign_data': []
    }
    for i in range(6, -1, -1):
        date = today - datetime.timedelta(days=i)

        login_count = UserInfo.objects.filter(
            last_login__year=date.year,
            last_login__month=date.month,
            last_login__day=date.day
        ).count()

        sign_count = UserInfo.objects.filter(
            date_joined__year=date.year,
            date_joined__month=date.month,
            date_joined__day=date.day
        ).count()

        seven_data['date'].append(date.strftime('%m-%d'))
        seven_data['login_data'].append(login_count)
        seven_data['sign_data'].append(sign_count)
    return JsonResponse(seven_data)


def get_order_data(request):
    response = {
        'name': [],
        'number': []
    }

    order_list = Order.objects.all()

    for order in order_list:
        name = order.shop.shop_name
        number = Order.objects.filter(shop__shop_name=name).count()

        response['name'].append(name)
        response['number'].append(number)

    return JsonResponse(response)


def get_seven_order(request):
    response = {
        'date': [],
        'number': []
    }
    today = datetime.date.today()
    for i in range(6, -1, -1):
        date = today - datetime.timedelta(days=i)

        print(date.year)

        order_count = Order.objects.filter(
            create_date__year=date.year,
            create_date__month=date.month,
            create_date__day=date.day,
        ).count()

        response['date'].append(date.strftime('%m-%d'))

        response['number'].append(order_count)

    return JsonResponse(response)
