from django.db import models
from package.models import Package
from user.models import User


# Create your models here.
# class Booking(models.Model):
#     booking_id = models.AutoField(primary_key=True)
#     # user_id = models.IntegerField()
#     user = models.ForeignKey(User, on_delete=models.CASCADE)
#     # package_id = models.IntegerField()
#     package = models.ForeignKey(Package,on_delete=models.CASCADE)
#
#     date = models.DateField()
#     time = models.TimeField()
#     status = models.CharField(max_length=45)
#
#     class Meta:
#         managed = False
#         db_table = 'booking'


class Booking(models.Model):
    booking_id = models.AutoField(primary_key=True)

    # user_id = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    # package_id = models.IntegerField()
    package = models.ForeignKey(Package,on_delete=models.CASCADE)

    date = models.DateField()
    status = models.CharField(max_length=45)
    adults = models.CharField(max_length=45)
    children = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'booking'



