from django.utils.deprecation import MiddlewareMixin

class NoCacheMiddleware(MiddlewareMixin):
    def process_response(self, request, response):
        """
        Prevent browser caching for authenticated pages.
        """
        response['Cache-Control'] = 'no-cache, no-store, must-revalidate'
        response['Pragma'] = 'no-cache'
        response['Expires'] = '0'
        return response