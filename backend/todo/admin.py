from django.contrib import admin

# Register your models here.
from .models import Todo

class TodoAdmin(admin.ModelAdmin):  # add this
  list_display = ('title', 'description', 'completed') # add this

admin.site.register(Todo, TodoAdmin)