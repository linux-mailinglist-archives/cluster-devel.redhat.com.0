Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C70372EB4AA
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Jan 2021 22:07:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-bc9tDdPfOoG5KH9df2szkw-1; Tue, 05 Jan 2021 16:07:44 -0500
X-MC-Unique: bc9tDdPfOoG5KH9df2szkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59A7A800D53;
	Tue,  5 Jan 2021 21:07:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06D685D9CC;
	Tue,  5 Jan 2021 21:07:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD8FF180954D;
	Tue,  5 Jan 2021 21:07:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 105L7VEi023480 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 5 Jan 2021 16:07:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A176D2166B2A; Tue,  5 Jan 2021 21:07:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CB332166B29
	for <cluster-devel@redhat.com>; Tue,  5 Jan 2021 21:07:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B62E80120A
	for <cluster-devel@redhat.com>; Tue,  5 Jan 2021 21:07:28 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-264-TEyICO5YOTGILc3ILFxNCA-1; Tue, 05 Jan 2021 16:07:24 -0500
X-MC-Unique: TEyICO5YOTGILc3ILFxNCA-1
Received: by mail-lf1-f50.google.com with SMTP id b26so1691177lff.9;
	Tue, 05 Jan 2021 13:07:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CTH/D0pcYHgEAjveQTnm1uxYGg2A1423go8OVRIN0MU=;
	b=B54GVFVzlGRP6EqFJJ4dEI0HQXeQjF7CVDIXGvILoXIO2dlWljxRj+YAiZc7RBUovC
	w8JZxSYbFXvSCukkc/6JI433A+QBuS4aaMx0no3FtlwkDCpWZfKf4l8wjBKeUvSHjTmF
	IxxSs9TBSXRQaMm3topPYV6CEId+fx0Dv13ingQe1FhPt7zrK322DhFrIx4SsrC2AcnR
	w2YgHXSnZ1/pk6rdqsMP6lqLFpvlV6FZj3oPCW32A7q7HZInv1DmZgJcYkNKMWX+ryF0
	eer4C6Lz6zf46c/0UO2RM3SO03zBdCksD6fkd7+x2CjasJrJSXgm8Jf8ADqaXP3UjKde
	HDbw==
X-Gm-Message-State: AOAM5318r0lJeHoi/I22v+odm1hvIlbleFAz5XWRio82+zqtFsxbvbE2
	94zDTeT8Gq+eQKsBkWPSbNkA1jdvo1zkMwYQQCgdX23dboMLIw==
X-Google-Smtp-Source: ABdhPJwoDlljj6UnXYXS8jwT9nLNh018rIQ0TvEI+X4OC+OrB+OAaGkMhYBqnuB2Zj+PTdu/D/I72a3LGcrUGfrdrb8=
X-Received: by 2002:ac2:561b:: with SMTP id v27mr457934lfd.425.1609880842100; 
	Tue, 05 Jan 2021 13:07:22 -0800 (PST)
MIME-Version: 1.0
References: <1609807642-31552-1-git-send-email-huangzhaoyang@gmail.com>
	<1535117686.42500348.1609851274846.JavaMail.zimbra@redhat.com>
In-Reply-To: <1535117686.42500348.1609851274846.JavaMail.zimbra@redhat.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 5 Jan 2021 22:07:10 +0100
Message-ID: <CAHpGcMKfjSddqj7FuUhR00GY+B4Qkzc=bHMVCk4UYQsWeMkxMw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Huangzhaoyang <huangzhaoyang@gmail.com>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Subject: Re: [Cluster-devel] [PATCH v2] fs: amend SLAB_RECLAIM_ACCOUNT on
	gfs2 related slab cache
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Bob,

Am Di., 5. Jan. 2021 um 14:28 Uhr schrieb Bob Peterson <rpeterso@redhat.com>:
> ----- Original Message -----
> > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >
> > As gfs2_quotad_cachep and gfs2_glock_cachep have registered
> > the shrinker, amending SLAB_RECLAIM_ACCOUNT when creating
> > them, which make the slab acount to be presiced.
> >
> > Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > ---
> > v2: add gfs2_glock_cachep for same operation
> > ---
> Hi,
>
> Thanks. Your patch is now pushed to the linux-gfs2/for-next branch.
> I cleaned up the description a bit. For example, I changed "fs:" to
> "gfs2:" to conform to other gfs2 patches.

so the patch description now reads:

"As gfs2_quotad_cachep and gfs2_glock_cachep have registered
shrinkers, amending SLAB_RECLAIM_ACCOUNT when creating them,
which improves slab accounting."

I'm not sure what that description is based on; the definition of
SLAB_RECLAIM_ACCOUNT in include/linux/slab.h looks as follows, which
indicates that the purpose isn't really accounting but object
grouping:

/* The following flags affect the page allocator grouping pages by mobility */
/* Objects are reclaimable */
#define SLAB_RECLAIM_ACCOUNT    ((slab_flags_t __force)0x00020000U)
#define SLAB_TEMPORARY          SLAB_RECLAIM_ACCOUNT    /* Objects are
short-lived */

Furthermore, would it make sense to use SLAB_RECLAIM_ACCOUNT or
SLAB_TEMPORARY for gfs2_bufdata and gfs2_trans as well?

Thanks,
Andreas

