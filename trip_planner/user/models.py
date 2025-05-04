from django.db import models
# Create your models here.
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)
    place = models.CharField(max_length=45)
    phone_number = models.CharField(db_column='phone number', max_length=45)  # Field renamed to remove unsuitable characters.
    email = models.CharField(max_length=45,unique=True)
    username = models.CharField(max_length=45,unique=True)
    password = models.CharField(max_length=45,unique=True)

    class Meta:
        managed = False
        db_table = 'user'
