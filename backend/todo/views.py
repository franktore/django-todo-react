from django.shortcuts import render
from rest_framework import viewsets
from .serializers import TodoSerializer
from .models import Todo
from todo import logger


# Create your views here.
class TodoView(viewsets.ModelViewSet):
    logger.info("entered todoview!!!")
    serializer_class = TodoSerializer
    queryset = Todo.objects.all()