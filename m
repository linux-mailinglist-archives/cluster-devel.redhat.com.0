Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE9C78D5EE
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Aug 2023 14:40:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693399221;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pXW+YJ7Es1NUxs1wO/8B0lyOdXp6T+rmiitd4bvcpy8=;
	b=gEkB1J4ECFlaX7VvkKZjH8i1JkD0wQgpUEnWwELQNa4XCIpTnaxfQkzmDoA11IqHGAogYx
	mo/7QbWP3ea7Leq47ojYfK1WnCouIp9fJJRD/mQcm50qkYh52oo/s+JGQP/21F6wyB0AMA
	Frh2lInqYXTrlfuIOgO+ZpEBartnQBs=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-iINpk1TNPg-DCD8bneqo4g-1; Wed, 30 Aug 2023 08:40:16 -0400
X-MC-Unique: iINpk1TNPg-DCD8bneqo4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CCFD280D231;
	Wed, 30 Aug 2023 12:40:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7609B140E96E;
	Wed, 30 Aug 2023 12:40:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 34AC919465A3;
	Wed, 30 Aug 2023 12:40:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8B1A31946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 30 Aug 2023 12:15:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 76706140E970; Wed, 30 Aug 2023 12:15:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F0B5140E96F
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 12:15:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E3C51021E14
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 12:15:24 +0000 (UTC)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-AvgcWanePBSexFg_4EcnuA-1; Wed, 30 Aug 2023 08:15:22 -0400
X-MC-Unique: AvgcWanePBSexFg_4EcnuA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2bcba79cedfso60428331fa.2
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 05:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693397721; x=1694002521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pXW+YJ7Es1NUxs1wO/8B0lyOdXp6T+rmiitd4bvcpy8=;
 b=C2iIBwJivI48Qnk3JKEFdo6cgZhHgGstCfbqeSes6NQLWkWkOnSQxvPtfHbppNKy4T
 NFZa3ANtIcdMquci5Xc8YS4FAKlN4zuT1FiRpso33oHIeaOPgxTKQOkSk01g99EFNUBM
 lF6o2h3+HvVt2hN3tvVUIJZvUPvk3cf1A+gA9r3quqHKPf4v7aJ6u6PedBUmhqYlwkPT
 xctu40efxsthTVE60GLiIIf017x3vQsdOChlOyG4OSfUNhW3fjVaL8nYLXs5p+GMcIPk
 oNAxBB1l0/2JBhvrZ47gaFhjT4JEWhquEJ4ypdCuw+WMDer1A8FN50mhBr6XB52p7Nuc
 g2zg==
X-Gm-Message-State: AOJu0YzOoS7j27lCZRwKRqXQKv1KlMV9i9n8JJh9pMpKICZM3Mb7TJYI
 4o1FmVjvmhxrw6g++dD+0oMDObF+jdwHfq01LxonINIc/ZAYHu4UNCqxHFTkihcZU0FP1OQbfud
 d06MWBN14Cw9OKAxxpbs8rWgn2jU9frKF8KjbrHLyxLu+tYRc
X-Received: by 2002:a05:6512:3a8e:b0:500:bc5a:517a with SMTP id
 q14-20020a0565123a8e00b00500bc5a517amr1599275lfu.56.1693397721191; 
 Wed, 30 Aug 2023 05:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH4CTWLGIc2/L6PKaTeIATaE0rFTOba0dxmf+/1WydwsNUiyEi5RRMTlB/tcj2GzHwHxxqFM7q4A7ioapsKgE=
X-Received: by 2002:a05:6512:3a8e:b0:500:bc5a:517a with SMTP id
 q14-20020a0565123a8e00b00500bc5a517amr1599259lfu.56.1693397720785; Wed, 30
 Aug 2023 05:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230823213352.1971009-1-aahringo@redhat.com>
 <20230823213352.1971009-3-aahringo@redhat.com>
 <ae36349af354dcf40c29ff1c6bf7d930f08e7115.camel@kernel.org>
In-Reply-To: <ae36349af354dcf40c29ff1c6bf7d930f08e7115.camel@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 30 Aug 2023 08:15:09 -0400
Message-ID: <CAK-6q+hZ8T+Ji5kkmrE4xfA0mf+B7k44nySJqDf2zyJEO3n9Ng@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 2/7] lockd: don't call vfs_lock_file()
 for pending requests
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
Cc: linux-nfs@vger.kernel.org, fstests@vger.kernel.org,
 cluster-devel@redhat.com, ocfs2-devel@lists.linux.dev, chuck.lever@oracle.com,
 anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 25, 2023 at 2:10=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Wed, 2023-08-23 at 17:33 -0400, Alexander Aring wrote:
> > This patch returns nlm_lck_blocked in nlmsvc_lock() when an asynchronou=
s
> > lock request is pending. During testing I ran into the case with the
> > side-effects that lockd is waiting for only one lm_grant() callback
> > because it's already part of the nlm_blocked list. If another
> > asynchronous for the same nlm_block is triggered two lm_grant()
> > callbacks will occur but lockd was only waiting for one.
> >
> > To avoid any change of existing users this handling will only being mad=
e
> > when export_op_support_safe_async_lock() returns true.
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  fs/lockd/svclock.c | 24 +++++++++++++++++-------
> >  1 file changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> > index 6e3b230e8317..aa4174fbaf5b 100644
> > --- a/fs/lockd/svclock.c
> > +++ b/fs/lockd/svclock.c
> > @@ -531,6 +531,23 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_fil=
e *file,
> >               goto out;
> >       }
> >
> > +     spin_lock(&nlm_blocked_lock);
> > +     /*
> > +      * If this is a lock request for an already pending
> > +      * lock request we return nlm_lck_blocked without calling
> > +      * vfs_lock_file() again. Otherwise we have two pending
> > +      * requests on the underlaying ->lock() implementation but
> > +      * only one nlm_block to being granted by lm_grant().
> > +      */
> > +     if (export_op_support_safe_async_lock(inode->i_sb->s_export_op,
> > +                                           nlmsvc_file_file(file)->f_o=
p) &&
> > +         !list_empty(&block->b_list)) {
> > +             spin_unlock(&nlm_blocked_lock);
> > +             ret =3D nlm_lck_blocked;
> > +             goto out;
> > +     }
>
> Looks reasonable. The block->b_list check is subtle, but the comment
> helps.

thanks. To be honest, I am "a little bit" worried (I am thinking of
this scenario) that we might have a problem here with multiple
identically lock requests being granted at the same time. In such
cases the most fields of struct file_lock are mostly the same and
nlm_compare_locks() checks exactly on those fields. I am concerned
this corner case could cause problems, but it is a very rare case and
it makes totally no sense that an application is doing such a request.

I am currently trying to get an xfstest for this upstream.

- Alex

