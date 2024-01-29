from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(['GET'])
def getRoutes(request):
    routes = [
        {
            'Endpoint': '/notes/',
            'method': 'GET',
            'body': None,
            'description': 'Return an array of notes'
        },
        {
            'Endpoint': '/notes/id',
            'method': 'GET',
            'body': None,
            'description': 'Return a single note object'
        },
        {
            'Endpoint': '/notes/create/',
            'method': 'POST',
            'body': {'body': ""},
            'description': 'Create a new note'
        },
        {
            'Endpoint': '/notes/id/update',
            'method': 'PUT',
            'body': {'body': ""},
            'description': 'Update an existing note'
        },
        {
            'Endpoint': '/notes/id/delete',
            'method': 'DELETE',
            'body': None,
            'description': 'Delete an existing note'
        }
    ]

    return Response(routes)