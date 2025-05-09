from django.db import models
from user.models import User
# Create your models here.

class Feedback(models.Model):
    feedbackid = models.AutoField(primary_key=True)
    feedback = models.CharField(max_length=100)
    # user_id = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    date = models.DateField()
    rating = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'feedback'

