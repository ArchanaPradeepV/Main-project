from django.db import models
class Category(models.Model):
    category_id = models.AutoField(primary_key=True)
    category_name = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'category'

