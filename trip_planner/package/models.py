from django.db import models
from category.models import Category
# Create your models here.
# class Package(models.Model):
#     package_id = models.AutoField(primary_key=True)
#     destination = models.CharField(max_length=300)
#     descriptiom = models.CharField(max_length=300)
#     amount = models.IntegerField()
#     days = models.CharField(max_length=45)
#     image = models.CharField(max_length=500)
#     # category_id = models.IntegerField()
#     category = models.ForeignKey(Category,on_delete=models.CASCADE)
#     people = models.IntegerField()
#
#     class Meta:
#         managed = False
#         db_table = 'package'

class Package(models.Model):
    package_id = models.AutoField(primary_key=True)
    destination = models.CharField(max_length=300)
    descriptiom = models.CharField(max_length=300)
    amount = models.IntegerField()
    days = models.CharField(max_length=45)
    image = models.CharField(max_length=500)
    # category_id = models.IntegerField()
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    people = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'package'
