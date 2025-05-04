from django.db import models
from package.models import Package
from staff.models import Staff
from user.models import User

# Create your models here.
# class Itinerary(models.Model):
#     itinerary_id = models.AutoField(primary_key=True)
#     # package_id = models.IntegerField()
#     package = models.ForeignKey(Package,on_delete=models.CASCADE)
#     # staff_id = models.IntegerField()
#     staff = models.ForeignKey(Staff,on_delete=models.CASCADE)
#     description = models.CharField(max_length=1000)
#
#     class Meta:
#         managed = False
#         db_table = 'itinerary'



class Itinerary(models.Model):
    itinerary_id = models.AutoField(primary_key=True)
    # package_id = models.IntegerField()
    package = models.ForeignKey(Package, on_delete=models.CASCADE)

    # staff_id = models.IntegerField()
    staff = models.ForeignKey(Staff, on_delete=models.CASCADE)
    description = models.CharField(max_length=1000)
    destination = models.CharField(max_length=45, blank=True, null=True)
    days = models.IntegerField(blank=True, null=True)
    budget = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'itinerary'


class Plan(models.Model):
    planid = models.AutoField(primary_key=True)
    plan = models.CharField(max_length=3000)
    # user_id = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        managed = False
        db_table = 'plan'

