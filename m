Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E106561639
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Jun 2022 11:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656580996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KjnDuNtpSD7eZexVYfmSL1k8PwdI9ho0cW38MmOj+E8=;
	b=PXPS+rBc73gUz3biMjWmYuaSSkbXw6/DwKxLNYmj8lm8hPBKJwqRBDtRBauu2x5Burnopv
	NxFMKrtgAOGHCm7qyUp5VNrI11JVyVdsA8ruJe0h3wh5gnXKeUq1R5RxosPkExnrjlFz8+
	m8bbr1WJwaBy232WlTffbhWA/81BiLo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-PV4ry0rSOqCtc57X3_hX7g-1; Thu, 30 Jun 2022 05:23:11 -0400
X-MC-Unique: PV4ry0rSOqCtc57X3_hX7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 186FB2919ED0;
	Thu, 30 Jun 2022 09:23:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E8CF112131B;
	Thu, 30 Jun 2022 09:23:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8D1401947076;
	Thu, 30 Jun 2022 09:23:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D8E1C19466DF for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 01:57:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B867A112131B; Wed, 29 Jun 2022 01:57:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3EA21121314
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 01:57:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97C4385A582
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 01:57:29 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-0HBkryYwNHiuNuB1FrSdeg-1; Tue, 28 Jun 2022 21:57:27 -0400
X-MC-Unique: 0HBkryYwNHiuNuB1FrSdeg-1
Received: by mail-ej1-f52.google.com with SMTP id sb34so29485326ejc.11;
 Tue, 28 Jun 2022 18:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KjnDuNtpSD7eZexVYfmSL1k8PwdI9ho0cW38MmOj+E8=;
 b=veLUxVsFsWIqmOcePBTk4qUwGErgZZ1tTXoZ08dRoN4BIFCWxQ6XSZvqi/BoqAypJF
 ZjEbEjZwaiHf3KD+JsAubIvtyHnOpQDvc9xI2HLPhMyN4Ym1xPErnnK+pnfYiJafZN8o
 BKc6l2Ns+pts8PzFZwacIOUuJjIWTTEXSBtOXnNn/BEk6J3BpymykZqgCZRYSLjMLA2z
 u0NUwu/Ar+G3vfHtEpa8qfLwt+O63VKlGvuLZH0WdGXH41n4GjLAtDHceWlJVU5v3omM
 Hp160LqmDnw74kNS5eIzy3ceBlPr8xwFKux+eVJgSW7HddABLHJJZy6RdRLsLKvWTc6K
 pUUg==
X-Gm-Message-State: AJIora8Cu9mWF0KzSay8yIZo17Aniu0ACLP/NO/cexyJrYJKVBEoOhJw
 BARxkSCNqpjipT7nSKfkVOy6xBo6TznZ29W794goUf+izM88vA==
X-Google-Smtp-Source: AGRyM1tuMLXxLNkEoh6G8ObRG/eaf7ivhKlsB652e3VHUvJp/djX5DGU72F2kJcjVmVWw/EfQt2A1nMx9Ofwym/m/0Y=
X-Received: by 2002:a17:907:6e1a:b0:726:9f52:bafc with SMTP id
 sd26-20020a1709076e1a00b007269f52bafcmr922509ejc.413.1656467845654; Tue, 28
 Jun 2022 18:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220628055949.566089-1-dzm91@hust.edu.cn>
 <CAHc6FU4PR9hwBY1NxdyAMAAh4rY+KHvO26PTSsDBXJ=yHK2msQ@mail.gmail.com>
 <CAD-N9QXikfrnjD-4a8pnLYUFfcm0LdpBaXjO4=CXU5MNS-jvSQ@mail.gmail.com>
In-Reply-To: <CAD-N9QXikfrnjD-4a8pnLYUFfcm0LdpBaXjO4=CXU5MNS-jvSQ@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 29 Jun 2022 09:56:44 +0800
Message-ID: <CAD-N9QX_3PeTYA3-+zJLG4LM3Gst2B2bOEg9fEVXDTx+aYPtwg@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mailman-Approved-At: Thu, 30 Jun 2022 09:23:07 +0000
Subject: Re: [Cluster-devel] [PATCH] gfs2: fix overread in the strlcpy of
 init_names
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 cluster-devel <cluster-devel@redhat.com>, Jean Delvare <khali@linux-fr.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, syzkaller <syzkaller@googlegroups.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 29, 2022 at 9:33 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> On Tue, Jun 28, 2022 at 8:06 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > Dongliang Mu,
> >
> > On Tue, Jun 28, 2022 at 8:10 AM Dongliang Mu <dzm91@hust.edu.cn> wrote:
> > > From: Dongliang Mu <mudongliangabcd@gmail.com>
> > >
> > > In init_names, strlcpy will overread the src string as the src string is
> > > less than GFS2_FSNAME_LEN(256).
> > >
> > > Fix this by modifying strlcpy back to snprintf, reverting
> > > the commit 00377d8e3842.
> >
> > ... if the source string isn't NULL-terminated. But in that case, the
> > code will still do the same thing with this patch. In other words,
> > this doesn't fix anything. So let's check for NULL termination
> > instead.
>
> Partially yes. Even if the source string is NULL-terminated, strlcpy
> will invoke memcpy to overread the adjacent memory of source string as
> the specified length is longer than source string.

The above statement is incorrect after I double check the
implementation of strlcpy.

The correct fix should be NULL-termination check of src string.

>
> >
> > Thanks,
> > Andreas
> >
> > > Fixes: 00377d8e3842 ("[GFS2] Prefer strlcpy() over snprintf()")
> > > Reported-by: syzkaller <syzkaller@googlegroups.com>
> > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > ---
> > >  fs/gfs2/ops_fstype.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> > > index c9b423c874a3..ee29b50d39b9 100644
> > > --- a/fs/gfs2/ops_fstype.c
> > > +++ b/fs/gfs2/ops_fstype.c
> > > @@ -383,8 +383,8 @@ static int init_names(struct gfs2_sbd *sdp, int silent)
> > >         if (!table[0])
> > >                 table = sdp->sd_vfs->s_id;
> > >
> > > -       strlcpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
> > > -       strlcpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
> > > +       snprintf(sdp->sd_proto_name, GFS2_FSNAME_LEN, "%s", proto);
> > > +       snprintf(sdp->sd_table_name, GFS2_FSNAME_LEN, "%s", table);
> > >
> > >         table = sdp->sd_table_name;
> > >         while ((table = strchr(table, '/')))
> > > --
> > > 2.35.1
> > >
> >

