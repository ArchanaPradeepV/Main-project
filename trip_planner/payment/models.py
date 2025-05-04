from django.db import models
from user.models import User

# Create your models here.
class Payment(models.Model):
    payment_id = models.AutoField(primary_key=True)
    booking_id = models.IntegerField()
    # user_id = models.IntegerField()
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    amount = models.IntegerField()
    date = models.DateField()
    status = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'payment'

