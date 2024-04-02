from django.db import models
class imodel(models.Model):
    title=models.CharField(max_length=20)
    ufiles=models.FileField(upload_to='upload')
    cid=models.CharField(max_length=20)
    uid=models.CharField(max_length=20)
    class Meta:
        db_table="uploadcase"
