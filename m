Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1C56163A
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Jun 2022 11:23:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656580998;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KIhlFiRLTeYDajDFixtlLrmUsyayl0HijGJY+Ov1teI=;
	b=IBbgDyP8Eacu0kiRsgvg/vBkaiQW+igce/cAnlbf1/UUNljZpKo+HNVA9u73FRX/jopZYM
	dn8kgEllGnrzNIA4gQ2annnae4vA3HKdKDLuaZqPWm+1lbLspXb3GYGhGcTuMaE2LvmC4+
	KEcLVtPvtEgPZ1hLzYh8q7q/p2SrcPA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-sKw1_0WjMpOXatc34IIN5Q-1; Thu, 30 Jun 2022 05:23:11 -0400
X-MC-Unique: sKw1_0WjMpOXatc34IIN5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1862D2919ECF;
	Thu, 30 Jun 2022 09:23:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AAF5740466B0;
	Thu, 30 Jun 2022 09:23:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 75E171947064;
	Thu, 30 Jun 2022 09:23:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 223921947056 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 01:34:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EED5D1410F3B; Wed, 29 Jun 2022 01:34:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA22E1410DD8
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 01:34:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1553101A586
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 01:34:27 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-pypbhmmROX6l4wsTOmmXUw-1; Tue, 28 Jun 2022 21:34:26 -0400
X-MC-Unique: pypbhmmROX6l4wsTOmmXUw-1
Received: by mail-ej1-f43.google.com with SMTP id g26so29455115ejb.5;
 Tue, 28 Jun 2022 18:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KIhlFiRLTeYDajDFixtlLrmUsyayl0HijGJY+Ov1teI=;
 b=MrPa6Nf7j2AvmtPg8aQGnVHs728z1iyuKw8bEvTCtW+LqcRBgb55g1iZzMCRVNN0zq
 KTpi6qR5iIdktje8DEYNLaU7ju8HWYpd63JwTEWiXGEafOYV4q5EkwnOKLwUbbuYpm9p
 L2EqmgtykfhNfTFuxBbJYcO3bJlo1JNN3XczdrXWtnwuZVdUjiCd9l4AnmKSEGHLLqqB
 17W3+hbspw9TfPu2+3hbhJXtMW/3ADat5e7LHx+DEyFyiYIp5fayvln2iPtwMCWkXzsX
 UQIFmBlNqqokWEu/cw4EhupdX6AL5Cq1PC+rIVJXa+NwDB9EEVQjJb0Cya7XjhVS2sMD
 oyoQ==
X-Gm-Message-State: AJIora9W46eXrw3aixS7zFVHK9HHILMIPaIwBZ3Snkv0rXUV4yZxIk4A
 MDKrtT+yQrVKtzr6F1DxC4YuuqE7LCjSgl7C1cLq+WXdAQ6DHK0D
X-Google-Smtp-Source: AGRyM1vVJcyaqr2XFOiRYKIC1my7c8I2SDWqT4BkNkx+WwHN0GJcO5U8wMNfY0dQLa15+dw2e0OBOfRaIEIDTouY7UM=
X-Received: by 2002:a17:907:6ea8:b0:726:a8bb:5a3e with SMTP id
 sh40-20020a1709076ea800b00726a8bb5a3emr883622ejc.753.1656466464303; Tue, 28
 Jun 2022 18:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220628055949.566089-1-dzm91@hust.edu.cn>
 <CAHc6FU4PR9hwBY1NxdyAMAAh4rY+KHvO26PTSsDBXJ=yHK2msQ@mail.gmail.com>
In-Reply-To: <CAHc6FU4PR9hwBY1NxdyAMAAh4rY+KHvO26PTSsDBXJ=yHK2msQ@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 29 Jun 2022 09:33:43 +0800
Message-ID: <CAD-N9QXikfrnjD-4a8pnLYUFfcm0LdpBaXjO4=CXU5MNS-jvSQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 28, 2022 at 8:06 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Dongliang Mu,
>
> On Tue, Jun 28, 2022 at 8:10 AM Dongliang Mu <dzm91@hust.edu.cn> wrote:
> > From: Dongliang Mu <mudongliangabcd@gmail.com>
> >
> > In init_names, strlcpy will overread the src string as the src string is
> > less than GFS2_FSNAME_LEN(256).
> >
> > Fix this by modifying strlcpy back to snprintf, reverting
> > the commit 00377d8e3842.
>
> ... if the source string isn't NULL-terminated. But in that case, the
> code will still do the same thing with this patch. In other words,
> this doesn't fix anything. So let's check for NULL termination
> instead.

Partially yes. Even if the source string is NULL-terminated, strlcpy
will invoke memcpy to overread the adjacent memory of source string as
the specified length is longer than source string.

>
> Thanks,
> Andreas
>
> > Fixes: 00377d8e3842 ("[GFS2] Prefer strlcpy() over snprintf()")
> > Reported-by: syzkaller <syzkaller@googlegroups.com>
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> >  fs/gfs2/ops_fstype.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> > index c9b423c874a3..ee29b50d39b9 100644
> > --- a/fs/gfs2/ops_fstype.c
> > +++ b/fs/gfs2/ops_fstype.c
> > @@ -383,8 +383,8 @@ static int init_names(struct gfs2_sbd *sdp, int silent)
> >         if (!table[0])
> >                 table = sdp->sd_vfs->s_id;
> >
> > -       strlcpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
> > -       strlcpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
> > +       snprintf(sdp->sd_proto_name, GFS2_FSNAME_LEN, "%s", proto);
> > +       snprintf(sdp->sd_table_name, GFS2_FSNAME_LEN, "%s", table);
> >
> >         table = sdp->sd_table_name;
> >         while ((table = strchr(table, '/')))
> > --
> > 2.35.1
> >
>

