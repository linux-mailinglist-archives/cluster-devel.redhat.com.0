Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFE26D0160
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 12:37:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680172639;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5QHfYK4L+ShyHkhoulB2o8AHckH/Mpd3a3lRdE+7Qyg=;
	b=K+Xy2cZfO0YL9a9/tF6DYaY8R2wbcFIiVun8sa/R1YIhh6OpjIKu/CtgnAvvr27P5a56mY
	fYn5SWTpXnw4Lpef3rpuejdEVX3xcLSsJeMuwYlnbjycaBCQe3tvocHDH1U8bDcnQoEXe6
	CxLr46DwwgyTGHR+Uup3kzhmJCvZbTw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-QtvMTNUCOXWIeSPX00YsGQ-1; Thu, 30 Mar 2023 06:37:16 -0400
X-MC-Unique: QtvMTNUCOXWIeSPX00YsGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6362D8028AD;
	Thu, 30 Mar 2023 10:37:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B56542166B33;
	Thu, 30 Mar 2023 10:37:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7079919465A2;
	Thu, 30 Mar 2023 10:37:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5C2C51946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Mar 2023 10:09:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EEACF440D7; Thu, 30 Mar 2023 10:09:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6E7918EC2
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 10:09:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4EA83815EEE
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 10:09:19 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-cIhUjIoiMK6sADaIln9pIQ-1; Thu, 30 Mar 2023 06:09:16 -0400
X-MC-Unique: cIhUjIoiMK6sADaIln9pIQ-1
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-3e390e23f83so476031cf.1
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 03:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680170956;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5QHfYK4L+ShyHkhoulB2o8AHckH/Mpd3a3lRdE+7Qyg=;
 b=F1Fzheiekbd6vAM7fktLw0SjXyjRAS+fziIm6r4sbZVVQ1HQ6RsF4DeiYK80WtK384
 LVMs6VY/qirUud8jWp9DTc6KlOBSKumvAOzoi2Rr76beZkDfVsZ02iCgfDu+Zvp3ikM5
 W93epnI+IXLqMm56GyXUsWfkZpfCOiXQ1yagBKRKu9T7PsoDWgpB27dQ5EjAGFmBRejv
 fdkydiCoK0bgyv0mHl4ui2pDLhtwUjXOvNi5+pCY0zioNdnvH+uoV/Cec4coNHOGkKIC
 T4z756LYQ7r7RMb4Ud9BkqP7+6pVOf4iJYRjSpHZJnm2J9KrPBc36gtT0kFeRvZkGsuZ
 r8Ow==
X-Gm-Message-State: AAQBX9ejN0fhEFe99XqKPjK0h4TKACLmpfvmSbg2oiOvKyNX1cix71N9
 DK+aM0TQMI8dB/F0KF06GSY8vxgKsOl+SYuR+MxFDA==
X-Google-Smtp-Source: AKy350Y80+QkSJsZopsDohV2gcHyIz6/stE6BaGOTjtia6jmm8aSYAzJcTz5XTMBRHxX57rCN7LBoqUFEPkvdOkl6to=
X-Received: by 2002:ac8:7f87:0:b0:3d3:3cc:6f70 with SMTP id
 z7-20020ac87f87000000b003d303cc6f70mr72806qtj.17.1680170956136; Thu, 30 Mar
 2023 03:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000bdc7df05f7f837ff@google.com>
In-Reply-To: <000000000000bdc7df05f7f837ff@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 30 Mar 2023 12:09:02 +0200
Message-ID: <CANp29Y50uKR9SgXi+wFGQkdcrSn98MfTsmwQXxofYngkzWaKjQ@mail.gmail.com>
To: syzbot <syzbot+list6e220af77940a0f2148c@syzkaller.appspotmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Thu, 30 Mar 2023 10:37:13 +0000
Subject: Re: [Cluster-devel] [syzbot] Monthly cluster report
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FTR The subsystem was recently renamed to gfs2 on syzbot, so the list
of gfs2 bugs can now be found at:
https://syzkaller.appspot.com/upstream/s/gfs2

On Tue, Mar 28, 2023 at 6:19=E2=80=AFPM syzbot
<syzbot+list6e220af77940a0f2148c@syzkaller.appspotmail.com> wrote:
>
> Hello cluster maintainers/developers,
>
> This is a 30-day syzbot report for the cluster subsystem.
> All related reports/information can be found at:
> https://syzkaller.appspot.com/upstream/s/cluster
>
> During the period, 1 new issues were detected and 0 were fixed.
> In total, 23 issues are still open and 12 have been fixed so far.
>
> Some of the still happening issues:
>
> Crashes Repro Title
> 237     Yes   kernel BUG in gfs2_glock_nq (2)
>               https://syzkaller.appspot.com/bug?extid=3D70f4e455dee59ab40=
c80
> 111     Yes   INFO: task hung in gfs2_jhead_process_page
>               https://syzkaller.appspot.com/bug?extid=3Db9c5afe053a08cd29=
468
> 108     Yes   general protection fault in gfs2_evict_inode (2)
>               https://syzkaller.appspot.com/bug?extid=3D8a5fc6416c175cece=
a34
> 23      Yes   INFO: task hung in __gfs2_trans_begin
>               https://syzkaller.appspot.com/bug?extid=3Da159cc6676345e04f=
f7d
> 21      Yes   WARNING in gfs2_check_blk_type
>               https://syzkaller.appspot.com/bug?extid=3D092b28923eb79e0f3=
c41
> 18      Yes   UBSAN: array-index-out-of-bounds in __gfs2_iomap_get
>               https://syzkaller.appspot.com/bug?extid=3D45d4691b1ed3c48eb=
a05
> 13      Yes   INFO: task hung in gfs2_gl_hash_clear (3)
>               https://syzkaller.appspot.com/bug?extid=3Ded7d0f71a89e28557=
a77
> 6       No    KMSAN: uninit-value in inode_go_dump
>               https://syzkaller.appspot.com/bug?extid=3D79333ce1ae874ab7f=
fbb
> 3       Yes   general protection fault in gfs2_dump_glock (2)
>               https://syzkaller.appspot.com/bug?extid=3D427fed3295e9a7e88=
7f2
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/syzkaller-bugs/000000000000bdc7df05f7f837ff%40google.com.

