from django.views import View
from django.http import JsonResponse
from app01.models import Comment


class CommentView(View):
    def post(self, request, nid):
        res = {
            'code': 412,
            'msg': 'Success！'
        }
        data = request.data
        content = data.get('comment_content')
        if not content:
            res['msg'] = 'placeholder content！'
            return JsonResponse(res)

        comment_obj = Comment.objects.create(
                shop_id=nid,
                content=content,
                user=request.user
            )
        res['code'] = 0
        return JsonResponse(res)

    def delete(self, request, nid):
        res = {
            'code': 412,
            'msg': 'Success！'
        }
        comment_query = Comment.objects.filter(nid=nid)
        comment_query.delete()
        res['code'] = 0
        return JsonResponse(res)
