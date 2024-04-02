from django import forms
from LegalApp.models import imodel

class iform(forms.Form):
    cs=forms.CharField(max_length=20)
    up=forms.FileField()
    class Meta:
        model=imodel
        fields=['title','ufiles','cid','uid']