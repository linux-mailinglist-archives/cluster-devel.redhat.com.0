Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5307D143ADA
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jan 2020 11:24:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579602244;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jS9GqG7DWyXKfX6Nq3L6CU4X2p04rMbF2IFePEYMDRg=;
	b=PtUB7SMO5x75e+R7ydvBdsn1byaupYUDPMdAa9LD1tN/gEcB1rRz5b3DjUd0ZdImS6dYhN
	jKoUcLmFb0vAQEGGyjpE01BcdBlT6M1fHcfCJiRQedeY5vjvgNDhiF08HvDgsyadKF+Tcz
	R7i1yUPTWfYg+vxy4hY0zmIPH7KsPYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-8aWmP1msPLKsAiec5DqSpw-1; Tue, 21 Jan 2020 05:24:02 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B90A184AD3D;
	Tue, 21 Jan 2020 10:23:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D045960BE0;
	Tue, 21 Jan 2020 10:23:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 242C818034E9;
	Tue, 21 Jan 2020 10:23:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LANqSH004668 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 05:23:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1ABC8202DDEA; Tue, 21 Jan 2020 10:23:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 160CC2093CE3
	for <cluster-devel@redhat.com>; Tue, 21 Jan 2020 10:23:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DF85101D229
	for <cluster-devel@redhat.com>; Tue, 21 Jan 2020 10:23:50 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-429-eq5c0wIuM7iPPrgv7XmLyQ-1; Tue, 21 Jan 2020 05:23:48 -0500
Received: by mail-io1-f65.google.com with SMTP id m25so2272424ioo.8;
	Tue, 21 Jan 2020 02:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NPi3Lmn/rLl5sk7+WqJ3pNoshTfD7fI1hPp452tWTQs=;
	b=LxMWtu7XynEV0K9U7NmxhzsUSv1ajRvQqViUb5D4MP1ptBqJssyoyvjhx3NKRRuw4O
	fwuYegYXnUknLcPiLKcjGdVKFPpcJTeKBPt2XEF0XZTAH/RwlpueCBu32ldTWPG/TtwJ
	OljI5TlbA9U30ZZ1p57llruU/ZDEFB5He9J7KtihxAAsRuovY+oOOwbICslACU2c6X/E
	IE8wTpG7PJs/afQY3tQibyE4/3P13B6Ce5aAKcVMzZ/CFgjw+H2IpLDiRx7sN3bme2nD
	TkMZ7TBHKgT1p2LspSdZQx1Am3wnHLz7X4dDhaoI6wAagKv4GdTdb8UxN6+kssqEN432
	59fw==
X-Gm-Message-State: APjAAAVo/D5TDmEyc2Z6BcX2sfto/P0gnd4dvSD6hHVXxVWVc+GOKrTe
	LymzpW3uisTxeVoY7HrJNEpwg4yA2ynmG+qM8t6jVld7
X-Google-Smtp-Source: APXvYqy5txtGIUOlVMW00U6h6TUq4v7ArC+trH+W23WSkjui7DAbUKjy1gz6j6gSVWyd8H40U/IPOfju3T++/58bEoE=
X-Received: by 2002:a6b:8f11:: with SMTP id r17mr2541090iod.50.1579602227546; 
	Tue, 21 Jan 2020 02:23:47 -0800 (PST)
MIME-Version: 1.0
References: <1579596552-257820-1-git-send-email-alex.shi@linux.alibaba.com>
In-Reply-To: <1579596552-257820-1-git-send-email-alex.shi@linux.alibaba.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 21 Jan 2020 11:23:35 +0100
Message-ID: <CAHpGcMJ6DazJ_rMPB2uUKfH-1oxVy=RoLvt2nMEvcdWWCnWjDw@mail.gmail.com>
To: Alex Shi <alex.shi@linux.alibaba.com>
X-MC-Unique: eq5c0wIuM7iPPrgv7XmLyQ-1
X-MC-Unique: 8aWmP1msPLKsAiec5DqSpw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00LANqSH004668
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] fs/gfs2: remove IS_DINODE
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Alex,

Am Di., 21. Jan. 2020 um 09:50 Uhr schrieb Alex Shi
<alex.shi@linux.alibaba.com>:
> After commit 1579343a73e3 ("GFS2: Remove dirent_first() function"), this
> macro isn't used any more. so remove it.
>
> Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
> Cc: Bob Peterson <rpeterso@redhat.com>
> Cc: Andreas Gruenbacher <agruenba@redhat.com>
> Cc: cluster-devel@redhat.com
> Cc: linux-kernel@vger.kernel.org
> ---
>  fs/gfs2/dir.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
> index eb9c0578978f..636a8d0f3dab 100644
> --- a/fs/gfs2/dir.c
> +++ b/fs/gfs2/dir.c
> @@ -74,7 +74,6 @@
>  #include "util.h"
>
>  #define IS_LEAF     1 /* Hashed (leaf) directory */
> -#define IS_DINODE   2 /* Linear (stuffed dinode block) directory */

The same is true for the IS_LEAF macro. I'm adjusting the patch accordingly=
.

The other patch removing the LBIT macros looks good as well, so I'm
applying both.

Thanks,
Andreas


