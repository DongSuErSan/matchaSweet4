from django.http import JsonResponse
from django.views import View


class CollectsView(View):
    def post(self, request, nid):
        res = {'msg': 'Success！', 'code': 0}

        request.user.shop_cart.add(nid)

        return JsonResponse(res)

    def delete(self, request, nid):
        res = {'msg': 'Success！', 'code': 0}

        request.user.shop_cart.remove(nid)

        return JsonResponse(res)