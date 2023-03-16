from django.views import View
from django.http import JsonResponse
from app01.models import UserInfo


class UserLurView(View):

    def put(self, request):
        res = {
            'code': 201,
            'msg': 'Success！'
        }
        nid = request.data.get('nid')
        user_name = request.data.get('userName')
        user_sex = request.data.get('userSex')
        user_nation = request.data.get('userNation')
        phone = request.data.get('phone')
        user_query = UserInfo.objects.filter(nid=nid)
        user_query.update(name=user_name, sex=user_sex, national=user_nation, tel=phone)
        res['code'] = 200
        return JsonResponse(res)

    def post(self, request):
        res = {
            'code': 201,
            'msg': 'Success！'
        }
        value = request.data.get('value')
        user_query = UserInfo.objects.filter(nid=request.user.nid)
        user_query.update(amount=value)
        res['code'] = 200
        return JsonResponse(res)