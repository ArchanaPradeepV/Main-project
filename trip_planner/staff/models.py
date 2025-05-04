from django.db import models

# Create your models here.
class Staff(models.Model):
    staff_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)
    place = models.CharField(max_length=45)
    phone_number = models.CharField(db_column='phone number', max_length=45)  # Field renamed to remove unsuitable characters.
    email = models.CharField(max_length=45,unique=True)
    status = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'staff'
