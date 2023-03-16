import json
from django.utils.deprecation import MiddlewareMixin
from api.utils.get_user_info import get_ip
from django.core.cache import cache


class Statistical(MiddlewareMixin):
    def process_request(self, request):
        ip = get_ip(request)
        online_ips = list(cache.get("online_ips", []))

        if online_ips:
            online_ips = list(cache.get_many(online_ips).keys())

        cache.set(ip, 0, 10)

        if ip not in online_ips:
            online_ips.append(ip)

        cache.set("online_ips", online_ips)

        request.online_list = online_ips


class Md1(MiddlewareMixin):
    def process_request(self, request):
        if request.method != 'GET' and request.META.get('CONTENT_TYPE') == 'application/json':
            data = json.loads(request.body)
            request.data = data

    def process_response(self, request, response):
        return response
