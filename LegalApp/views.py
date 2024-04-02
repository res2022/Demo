from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import HttpResponseRedirect,HttpResponseRedirect
from django.db import connection

from django.contrib import messages
from LegalApp.forms import iform
from LegalApp.models import imodel
from datetime import *
import datetime
today_date = datetime.date.today()
today = today_date.strftime("%Y-%m-%d")


# Create your views here.


def index(request):
    return render(request,'index.html')

def advu(request):
    cursor=connection.cursor()
    s="select * from user"
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'id':r[0],'uname':r[1],'add':r[2],'phn':r[3],'email':r[4]}
        alist.append(x)
    return render(request,'advu.html',{'a':alist})
def lv(request):
    cursor=connection.cursor()
    s="select * from lawyer"
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'id':r[0],'lname':r[1],'add':r[2],'phn':r[3],'email':r[4],'gen':r[5],'exp':r[6],'qua':r[7],'lic':r[8],'spc':r[9],'st':r[10],'hl':r[11],'dt':r[12]}
        alist.append(x)
    return render(request,'lv.html',{'a':alist})
def approvelawyer(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sql="update lawyer set lstatus='approved' where lid='%s'"%(id)
    cursor.execute(sql)
    sql2="update login set status='true' where uid='%s'"%(id)
    cursor.execute(sql2)
    msg="<script>alert('Successfully approved');window.location='/lv/';</script>"
    return HttpResponse(msg)
def rejectlawyer(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sql="update lawyer set lstatus='rejected' where lid='%s'"%(id)
    cursor.execute(sql)
    sql2="update login set status='false' where uid='%s'"%(id)
    cursor.execute(sql2)
    msg="<script>alert('Successfully rejected');window.location='/lv/';</script>"
    return HttpResponse(msg)
def userreg(request):
    return render(request,'userreg.html')
def login(request):
    return render(request,'login.html')    
def userregaction(request):
    cursor=connection.cursor()
    na=request.GET['uname']
    adr=request.GET['addr']
    phn=request.GET['phone']
    em=request.GET['email']
    pwd=request.GET['pass']
    sql = "select * from user where email='%s'"%(em)
    cursor.execute(sql)

    if  cursor.rowcount > 0:
        msg = "<script>alert('ALREADY EXIST');window.location='/userreg/'</script>"
        return HttpResponse(msg)
    else:
        sql1="insert into user(name,adr,phn,email,udate) values('%s','%s','%s','%s','%s')"%(na,adr,phn,em,today)
        cursor.execute(sql1)
        utype='user'
        sql2="SELECT max(uid) as uid from user"
        cursor.execute(sql2)

        output=cursor.fetchall()
    for row in output:
        sql = "insert into login(uid,uname,upass,utype,status)values('%s','%s','%s','%s','true')"%(row[0],em,pwd,utype)
        cursor.execute(sql)
    msg="<script>alert('Successfully Added');window.location='/index/';</script>"
    return HttpResponse(msg)
def lawyerreg(request):
    return render(request,'lawyerreg.html')
def lawyerregaction(request):
    cursor=connection.cursor()
    na=request.GET['nam']
    adr=request.GET['addr']
    phn=request.GET['phone']
    em=request.GET['email']
    ge=request.GET['gender']
    # hl=request.GET['ct']
    ex=request.GET['expr']
    qu=request.GET['quali']
    li=request.GET['lic']
    sp=request.GET['spec']
    pwd=request.GET['pass']
    hl=request.GET['ct']
    # dt=request.GET['dat']
    a1 = "select * from lawyer where lemail='%s'"%(em)
    cursor.execute(a1)
    if  cursor.rowcount > 0:
        msg = "<script>alert('ALREADY EXIST');window.location='/lawyerreg/'</script>"
        return HttpResponse(msg)
    else:
        sql1="insert into lawyer(lname,laddr,lphn,lemail,lgender,lexpr,lqualification,lnumber,lspec,lstatus,hlawyer,rdate) values('%s','%s','%s','%s','%s','%s','%s','%s','%s','Pending','%s','%s')"%(na,adr,phn,em,ge,ex,qu,li,sp,hl,today)
        cursor.execute(sql1)
        li='lawyer'
        sql2="SELECT max(lid) as lid from lawyer"
        cursor.execute(sql2)

        output=cursor.fetchall()
    for row in output:
        sql3 = "insert into login(uid,uname,upass,utype,status)values('%s','%s','%s','%s','pending')"%(row[0],em,pwd,li)
        cursor.execute(sql3)
    msg="<script>alert('Successfully Added');window.location='/index/';</script>"
    return HttpResponse(msg)
def loginaction(request):
    cursor=connection.cursor()
    p=request.GET['uname']
    q=request.GET['pass']
    sql2="select * from login where uname='%s' and upass='%s' and status='true'"%(p,q)
    cursor.execute(sql2)
    if(cursor.rowcount)>0:
        # sql3="select * from login where uname='%s' and upass='%s'and status='true'"%(p,q)
        # cursor.execute(sql3)
        output=cursor.fetchall()
        for row in output:
            request.session['lid']=row[0]
            request.session['uid']=row[1]
            request.session['uname']=row[2]
            request.session['upass']=row[3]
            request.session['utype']=row[4]
        if(request.session['utype']=='admin'):
            return render(request,'adminhome.html')

        elif(request.session['utype']=='user'):
            return render(request,'userhome.html')
        elif(request.session['utype']=='lawyer'):
            return render(request,'lawyerhome.html')
    else:
        html="<script>alert('invalid password and uname');window.location='/login/';</script>"
        return HttpResponse(html)
def adminhome(request):
    return render(request,'adminhome.html')
def userhome(request):
    return render(request,'userhome.html')
def lawyerhome(request):
    return render(request,'lawyerhome.html')
def law(request):
    cursor=connection.cursor()
    s="select * from law"
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'id':r[0],'sno':r[1],'sname':r[2],'des':r[3]}
        alist.append(x)
    return render(request,'law.html',{'a':alist})
def lawaction(request):
    cursor=connection.cursor()
    no=request.GET['sno']
    name=request.GET['sname']
    des=request.GET['des']
    sql1="insert into law(sno,sname,des) values('%s','%s','%s')"%(no,name,des)
    cursor.execute(sql1)
    msg="<script>alert('Successfully Added');window.location='/law/';</script>"
    return HttpResponse(msg)
def fees(request):
    cursor=connection.cursor()
    lid=request.session['uid']
    s="select * from fees where lid='%s'"%(lid)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'fid':r[0],'ctype':r[1],'cfe':r[2],'lid':r[3]}
        alist.append(x)
    return render(request,'fees.html',{'a':alist})
def feesaction(request):
    cursor=connection.cursor()
    c=request.GET['ctype']
    f=request.GET['cfe']
    lid=request.session['uid']
    sql1="insert into fees(ctype,cfees,lid) values('%s','%s','%s')"%(c,f,lid)
    cursor.execute(sql1)
    msg="<script>alert('Successfully Added');window.location='/fees/';</script>"
    return HttpResponse(msg)
def case(request):
    # cursor=connection.cursor()
    # sid=request.session['uid']
    # s="select * from casereg where uid='%s'"%(sid)
    # cursor.execute(s)
    # rs=cursor.fetchall()
    # alist=[]
    # for r in rs:
    #     x={'cid':r[0],'cnam':r[1],'cdet':r[2],'ctyp':r[3],'vic':r[4],'uid':r[5]}
    #     alist.append(x)
    return render(request,'case.html')
def caseaction(request):
    cursor=connection.cursor()
    n=request.GET['nam']
    d=request.GET['det']
    t=request.GET['ctype']
    v=request.GET['victim']
    sid=request.session['uid']
    sql1="insert into casereg(cnam,cdet,ctyp,vic,uid,status) values('%s','%s','%s','%s','%s','pending')"%(n,d,t,v,sid)
    cursor.execute(sql1)
    msg="<script>alert('Successfully Added');window.location='/mycases/';</script>"
    return HttpResponse(msg)
# def requestlawyer(request):
#     return render(request,'requestlawyer.html')
def requestlawyer(request):
    ctyp=request.GET['ctyp']
    cid=request.GET['cid']
    cursor=connection.cursor()
    s="select * from lawyer where lstatus='approved' and lspec like '%%%s%%'"%(ctyp)
    cursor.execute(s)
    # s1="update   casereg set rstatus='requested' where cid='%s'"%(cid) 
    # cursor.execute(s1)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'id':r[0],'lname':r[1],'add':r[2],'phn':r[3],'email':r[4],'gen':r[5],'exp':r[6],'qua':r[7],'lic':r[8],'spc':r[9],'st':r[10]}
        alist.append(x)
    return render(request,'requestlawyer.html',{'a':alist,'cid':cid})
def request(request):
    cursor=connection.cursor()
    lid=request.GET['lid']
    cid=request.GET['cid']
    uid=request.session['uid']
    sql1="insert into request(lid,cid,uid,status) values('%s','%s','%s','pending')"%(lid,cid,uid,)
    cursor.execute(sql1)
    msg="<script>alert('Successfully requested');window.location='/userhome/';</script>"
    return HttpResponse(msg)
def crequest(request):
    cursor=connection.cursor()
    lid=request.session['uid']
    s="select * from request  inner join user on request.uid=user.uid inner join casereg on request.cid=casereg.cid where request.lid='%s'"%(lid)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'rqid':r[0],'st':r[4],'name':r[6],'cid':r[11],'cnam':r[12],'cdet':r[13],'ctype':r[14]}
        alist.append(x)
    return render(request,'crequest.html',{'a':alist})
def acceptrequest(request):
    cursor=connection.cursor()
    id=request.GET['id']
    cid=request.GET['cid']
    sql="update request set status='accepted' where rqid='%s'"%(id)
    cursor.execute(sql)
    sql1="update casereg set status='accepted' where cid='%s'"%(cid)
    cursor.execute(sql1)
    msg="<script>alert('Successfully accepted');window.location='/crequest/';</script>"
    return HttpResponse(msg)
def rejectrequest(request):
    cursor=connection.cursor()
    id=request.GET['id']
    cid=request.GET['cid']
    sql="update request set status='rejected' where rqid='%s'"%(id)
    cursor.execute(sql)
    sql1="update casereg set status='accepted' where cid='%s'"%(cid)
    cursor.execute(sql1)
    msg="<script>alert('Successfully rejected');window.location='/crequest/';</script>"
    return HttpResponse(msg)
def mycases(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    s="select * from casereg where uid='%s'"%(uid)
    cursor.execute(s)
    # sql1="insert into casereg(cnam,cdet,ctyp,vic,uid,status) values('%s','%s','%s','%s','%s','pending')"%(sql1)
    # cursor.execute(s)
    rs=cursor.fetchall()
    alist1=[]
    for r in rs:
        s1="select * from request inner join lawyer on request.lid=lawyer.lid where cid='%s' and status='accepted'"%(r[0])
        cursor.execute(s1)
        if(cursor.rowcount>0):
            rs1=cursor.fetchall()
            for rw in rs1:
                x={'cid':r[0],'cnam':r[1],'cdet':r[2],'ctyp':r[3],'vic':r[4],'uid':r[5],'status':r[6],'rqid':rw[0],'lid':rw[1],'uid':rw[2],'lname':rw[6]}
                alist1.append(x)
        else:
            x={'cid':r[0],'cnam':r[1],'cdet':r[2],'ctyp':r[3],'vic':r[4],'uid':r[5],'status':r[6]}
            alist1.append(x)
    return render(request,'mycases.html',{'alist1':alist1})
def apcase(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    s="select * from request inner join casereg on request.cid=casereg.cid inner join lawyer on  request.lid=lawyer.lid where request.uid='%s' and request.status='accepted'"%(uid)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'rqid':r[0],'lid':r[1],'cid':r[3],'status':r[4],'cnam':r[6],'cdet':r[7],'ctyp':r[8],'vic':r[9],'uid':r[10],'lname':r[12]}
        alist.append(x)
    return render(request,'apcase.html',{'a':alist})
def uploadcase(request):
    cursor=connection.cursor()
    cid=request.GET['cid']
    uid=request.session['uid']
    s1="select * from uploadcase where cid='%s' and uid='%s'"%(cid,uid)
    cursor.execute(s1)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'title':r[1],'ufiles':r[2]}
        alist.append(x)
    return render(request,'uploadcase.html',{'cid':cid,'a':alist})
def uploadcaseaction(request):
    if request.method == "POST":
        MyProfileForm = iform(request.POST, request.FILES)
        if MyProfileForm.is_valid():
            profile = imodel()
            profile.title = MyProfileForm.cleaned_data["cs"]
            profile.ufiles = MyProfileForm.cleaned_data["up"]
            profile.cid=request.POST["cid"]
            profile.uid=request.session["uid"]
            profile.save()
            html = "<script>alert('Successfully uploaded');window.location='/mycases/';</script>"
            saved = True
    else:
        MyProfileForm = iform()
    return HttpResponse(html)
def lacase(request):
    cursor=connection.cursor()
    lid=request.session['uid']
    s="select * from request  inner join user on request.uid=user.uid inner join casereg on request.cid=casereg.cid where request.lid='%s' and request.status='accepted'"%(lid)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'rqid':r[0],'uid':r[2],'cid':r[3],'st':r[4],'name':r[6],'cnam':r[12],'cdet':r[13],'ctype':r[14]}
        alist.append(x)
    return render(request,'lacase.html',{'a':alist})
def lacaseview(request):
    cursor=connection.cursor()
    cid=request.GET['cid']
    s="select * from uploadcase where cid='%s'"%(cid)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'title':r[1],'ufiles':r[2]}
        alist.append(x)
    return render(request,'lacaseview.html',{'a':alist}) 
def payment(request):
    cursor=connection.cursor()
    cid=request.GET['cid']
    s="select * from pay where cid='%s' and  status='paid' "%(cid)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'pid':r[0],'pdate':r[1],'amt':r[3]}
        alist.append(x)
    return render(request,'payment.html',{'cid':cid,'alist':alist})
def payaction(request):
    cursor=connection.cursor()
    cn=request.GET['amt']
    lid=request.GET['cid']
    sql1="insert into pay(rdate,amt,cid) values('%s','%s','%s')"%(today,cn,lid)
    cursor.execute(sql1)
    msg="<script>alert('Successfully added');window.location='/lacase/';</script>"
    return HttpResponse(msg)
def viewpayment(request):
    cursor=connection.cursor()
    cid=request.GET['cid']
    # amt=request.GET['amt']
    # da=request.GET['rdate']
    s="select * from pay where cid='%s'"%(cid)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs: 
        x={'pid':r[0],'rdate':r[2],'amt':r[3]}
        alist.append(x)
    return render(request,'viewpayment.html',{'a':alist})
def paydet(request):
    amt=request.GET['amt']
    pid=request.GET['pid']
    return render(request,'paydet.html',{'pid':pid,'amt':amt}) 
def paydetaction(request):
    cursor=connection.cursor()
    # pid=request.GET['pid']
    na=request.GET['nam']
    ac=request.GET['ac']
    cv=request.GET['cw']
    at=request.GET['amt']
    dt=request.GET['ep']
    pid=request.GET['pid']
    sql="update pay set pdate='%s', status='paid' where pid='%s'"%(today,pid)
    cursor.execute(sql)
    sql1="insert into paydet(cname,acno,cvv,amt,edate,pid) values('%s','%s','%s','%s','%s','%s')"%(na,ac,cv,at,dt,pid)
    cursor.execute(sql1)
    msg="<script>alert('Successfully paid');window.location='/userhome/';</script>"
    return HttpResponse(msg)
def report(request):
    return render(request,'report.html')
def reportaction(request):
    cursor=connection.cursor()
    fr=request.GET['frm']
    to=request.GET['to']
    s1="select * from lawyer where rdate between '%s'and '%s'"%(fr,to)
    cursor.execute(s1)  
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'id':r[0],'lname':r[1],'add':r[2],'phn':r[3],'email':r[4],'gen':r[5],'exp':r[6],'qua':r[7],'lic':r[8],'spc':r[9],'st':r[10],'hl':r[11]}
        alist.append(x)
    return render(request,'report.html',{'a':alist}) 
def ureport(request):
    return render(request,'ureport.html')
def ureportaction(request):
    cursor=connection.cursor()
    fr=request.GET['fm']
    to=request.GET['tod']
    s="select * from user where udate between '%s' and '%s'"%(fr,to)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'id':r[0],'uname':r[1],'add':r[2],'phn':r[3],'email':r[4]}
        alist.append(x)
    return render(request,'ureport.html',{'a':alist})
def chlawyer(request):
    cursor=connection.cursor()
    rqid=request.GET['rqid']
    lid=request.GET['lid']
    cid=request.GET['cid']
    ctyp=request.GET['ctyp']
    rqid=request.GET['rqid']
    s1="update request set status='changed' where rqid='%s'"%(rqid)
    cursor.execute(s1) 
    s2="update casereg set status='pending' where cid='%s'"%(cid)
    cursor.execute(s2)
    s="select * from lawyer where lstatus='approved' and lspec like '%%%s%%' and lid !='%s'"%(ctyp,lid)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'lid':r[0],'lname':r[1],'add':r[2],'phn':r[3],'email':r[4],'gen':r[5],'exp':r[6],'qua':r[7],'lic':r[8],'spc':r[9],'st':r[10]}
        alist.append(x)
    return render(request,'chlawyer.html',{'a':alist,'cid':cid})
def chat(request):
    cursor=connection.cursor()
    lid=request.GET['lid']
    uid=request.session['uid']
    cd=today
    s="select * from chatm  inner join chats on chatm.chatid=chats.chatid where chatm.lid='%s' and chatm.uid='%s'"%(lid,uid)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'chatid':r[0],'chatdate':r[3],'msg':r[5],'typ':r[6]}
        alist.append(x)
    return render(request,'chat.html',{'lid':lid,'uid':uid,'alist':alist})
def chataction(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    lid=request.GET['lid']
    msg=request.GET['msg']
    ss="select * from chatm where uid= '%s' and lid='%s' and chatdate='%s'"%(uid,lid,today)
    cursor.execute(ss)
    if(cursor.rowcount>0):
        ss="select max(chatid) as chatid from chatm"
        cursor.execute(ss)
        rss=cursor.fetchall()
        for row in rss:
            chid=row[0]
            sql="insert into chats(chatid,msg,typ)values('%s','%s','user')"%(chid,msg)
            cursor.execute(sql)
    else:
        sql1="insert into chatm(uid,lid,chatdate) values('%s','%s','%s')"%(uid,lid,today)
        cursor.execute(sql1)
        sql2="select max(chatid) as chatid from chatm"
        cursor.execute(sql2)
        output=cursor.fetchall()
        for row in output:
            sql1="insert into chats(chatid,msg,typ)values('%s','%s','user')"%(row[0],msg)
            cursor.execute(sql1)
    msg="<script>;window.location='/chat?lid="+lid+"';</script>"
    return HttpResponse(msg)
def lchat(request):
    cursor=connection.cursor()
    uid=request.GET['uid']
    lid=request.session['uid']
    cd=today
    s="select * from chatm  inner join chats on chatm.chatid=chats.chatid where chatm.lid='%s' and chatm.uid='%s' order by chatdate asc"%(lid,uid)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'chatid':r[0],'chatdate':r[3],'msg':r[5],'typ':r[6]}
        alist.append(x)
    return render(request,'lchat.html',{'uid':uid,'lid':lid,'alist':alist})
def lchataction(request):
    cursor=connection.cursor()
    uid=request.GET['uid']
    lid=request.session['uid']
    msg=request.GET['msg']
    ss="select * from chatm where uid=%s and lid=%s and chatdate='%s'"%(uid,lid,today)
    cursor.execute(ss)
    if(cursor.rowcount>0):
        ss="select max(chatid) as chatid from chatm"
        cursor.execute(ss)
        rss=cursor.fetchall()
        for row in rss:
            chid=row[0]
            sql="insert into chats(chatid,msg,typ)values('%s','%s','lawyer')"%(chid,msg)
            cursor.execute(sql)
    else:
        sql1="insert into chatm(lid,uid,chatdate) values('%s','%s','%s')"%(lid,uid,today)
        cursor.execute(sql1)
        sql2="SELECT max(chatid) as chatid from chatm"
        cursor.execute(sql2)
        output=cursor.fetchall()
        for row in output:
            sql1="insert into chats(chatid,msg,typ)values('%s','%s','lawyer')"%(row[0],msg)
            cursor.execute(sql1)
    msg="<script>;window.location='/lchat?uid="+uid+"';</script>"
    return HttpResponse(msg)
def oldcase(request):
    cursor=connection.cursor()
    lid=request.session['uid']
    s="select * from request  inner join user on request.uid=user.uid inner join casereg on request.cid=casereg.cid where request.lid='%s' and request.status='changed'or request.status='completed'"%(lid)
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'rqid':r[0],'uid':r[2],'cid':r[3],'st':r[4],'name':r[6],'cnam':r[12],'cdet':r[13],'ctype':r[14]}
        alist.append(x)
    return render(request,'oldcase.html',{'a':alist})  
def lawyer1(request):
    cursor=connection.cursor()
    s1="select * from lawyer where hlawyer='lowercourt'"
    cursor.execute(s1)  
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'id':r[0],'lname':r[1],'add':r[2],'phn':r[3],'email':r[4],'gen':r[5],'exp':r[6],'qua':r[7],'lic':r[8],'spc':r[9],'st':r[10],'hl':r[11]}
        alist.append(x)
    return render(request,'lawyer1.html',{'a':alist})
def lawyer2(request):
    cursor=connection.cursor()
    s1="select * from lawyer where hlawyer='highcourt'"
    cursor.execute(s1)  
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'id':r[0],'lname':r[1],'add':r[2],'phn':r[3],'email':r[4],'gen':r[5],'exp':r[6],'qua':r[7],'lic':r[8],'spc':r[9],'st':r[10],'hl':r[11]}
        alist.append(x)
    return render(request,'lawyer2.html',{'a':alist})
def caseComplete(request):
    cursor=connection.cursor()
    rqid=request.GET['rqid']
    s1="update request set status='completed' where rqid='%s'"%(rqid)
    cursor.execute(s1) 
    msg="<script>alert('Successfully Added');window.location='/lacase/';</script>"
    return HttpResponse(msg)
def ulaw(request):
    cursor=connection.cursor()
    s="select * from law"
    cursor.execute(s)
    rs=cursor.fetchall()
    alist=[]
    for r in rs:
        x={'id':r[0],'sno':r[1],'sname':r[2],'des':r[3]}
        alist.append(x)
    return render(request,'ulaw.html',{'a':alist})


