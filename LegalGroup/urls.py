"""LegalGroup URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from LegalApp.views import *
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    path('',index,name="index"),
    path('index/',index,name="index"),
    path('userreg/',userreg,name="userreg"),
    path('userregaction/',userregaction,name="userregaction"),
    path('lawyerreg/',lawyerreg,name="lawyerreg"),
    path('lawyerregaction/',lawyerregaction,name="lawyerregaction"),
    path('login/',login,name="login"),
    path('loginaction/',loginaction,name="loginaction"),
    path('adminhome/',adminhome,name="adminhome"),
    path('userhome/',userhome,name="userhome"),
    path('lawyerhome/',lawyerhome,name="lawyerhome"),
    path('advu/',advu,name="advu"),
    path('lv/',lv,name="lv"),
    path('approvelawyer/',approvelawyer,name="approvelawyer"),
    path('rejectlawyer/',rejectlawyer,name="rejectlawyer"),
    path('law/',law,name="law"),
    path('lawaction/',lawaction,name="lawaction"),
    path('fees/',fees,name="fees"),
    path('feesaction/',feesaction,name="feesaction"),
    path('case/',case,name="case"),
    path('caseaction/',caseaction,name="caseaction"),
    path('requestlawyer/',requestlawyer,name="requestlawyer"),
    path('requestlawyer/',requestlawyer,name="requestlawyer"),
    path('request/',request,name="request"),
    path('crequest/',crequest,name="crequest"),
    path('acceptrequest/',acceptrequest,name="acceptrequest"),
    path('rejectrequest/',rejectrequest,name="rejectrequest"),
    path('mycases/',mycases,name="mycases"),
    path('apcase/',apcase,name="apcase"),
    path('uploadcase/',uploadcase,name="uploadcase"),
    path('uploadcaseaction/',uploadcaseaction,name="uploadcaseaction"),
    path('lacase/',lacase,name="lacase"),
    path('lacaseview/',lacaseview,name="lacaseview"),
    path('payment/',payment,name="payment"),
    path('payaction/',payaction,name="payaction"),
    path('viewpayment/',viewpayment,name="viewpayment"),
    path('paydet/',paydet,name="paydet"),
    path('paydetaction/',paydetaction,name="paydetaction"),
    path('report/',report,name="report"),
    path('reportaction/',reportaction,name="reportaction"),
    path('ureport/',ureport,name="ureport"),
    path('ureportaction/',ureportaction,name="ureportaction"),
    path('chlawyer/',chlawyer,name="chlawyer"),
    path('chat/',chat,name="chat"),
    path('chataction/',chataction,name="chataction"),
    path('lchat/',lchat,name="lchat"),
    path('lchataction/',lchataction,name="lchataction"),
    path('oldcase/',oldcase,name="oldcase"),
    path('lawyer1/',lawyer1,name="lawyer1"),
    path('lawyer2/',lawyer2,name="lawyer2"),
    path('ulaw/',ulaw,name="ulaw"),
    path('caseComplete/',caseComplete,name="caseComplete"),


]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns+=staticfiles_urlpatterns()
if settings.DEBUG:
    urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
    urlpatterns+=static(settings.MEDIA_URL,document_root=settings.STATIC_ROOT)
urlpatterns+=staticfiles_urlpatterns()
