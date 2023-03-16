from django.db.models import F
from django.http import JsonResponse
from django.views import View
from app01.models import ShopInfo, Order, UserInfo


class OrderView(View):
    def post(self, request, nid):
        res = {'msg': 'Success！', 'code': 0}

        number = int(request.data.get('order_number'))
        if number <= 0:
            res = {
                'msg': 'error！',
                'code': 500
            }
            return JsonResponse(res)
        shop_query = ShopInfo.objects.filter(nid=nid)
        if shop_query.first().number - number < 0:
            res = {
                'msg': 'Insufficient inventory！',
                'code': 500
            }
            return JsonResponse(res)
        total_price = shop_query.first().price * number
        if request.user.amount < total_price:
            res = {
                'msg': 'Lack of balance！',
                'code': 500
            }
            return JsonResponse(res)
        Order.objects.create(shop_id=nid, order_number=number, user=request.user, total_price=total_price)
        request.user.shop_cart.remove(nid)

        shop_query.update(number=F('number') - number)
        user_query = UserInfo.objects.filter(nid=request.user.nid)
        user_query.update(amount=F('amount') - total_price)

        return JsonResponse(res)