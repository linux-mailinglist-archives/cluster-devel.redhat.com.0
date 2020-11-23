Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 05F3C2C0ED1
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 16:31:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606145468;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=n5B+FPNZ7/nI6MLbnAuYG4akrTLBVajklT8NZmNzarw=;
	b=Zgjn7B48vbO7MhFSjDWkBEzFLolCCCYHF/VKoQI41eWTctr33du9gPdhSSHNfLvZ3JMtR8
	lIIArCu1qlyt7m5MC61RHJww96+UHKq5yUteNgM1dFs1MnYT6PK9MyQcfXlidvy9fGQeYW
	G2UKzzQtXhjWZ/pRXPD6+Kr0n3HNMf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-XhZ3xZSTPKuSAw9YRQ6jzA-1; Mon, 23 Nov 2020 10:31:05 -0500
X-MC-Unique: XhZ3xZSTPKuSAw9YRQ6jzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAA3D1876527;
	Mon, 23 Nov 2020 15:31:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2CFA10016FA;
	Mon, 23 Nov 2020 15:31:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 842511809C9F;
	Mon, 23 Nov 2020 15:30:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANFUsJm011979 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 10:30:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6299C2026D49; Mon, 23 Nov 2020 15:30:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E3C92026D12
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 15:30:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D85921065069
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 15:30:51 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-309-n6rWq_XMPf6ldg5RVaSRZQ-1; Mon, 23 Nov 2020 10:30:50 -0500
X-MC-Unique: n6rWq_XMPf6ldg5RVaSRZQ-1
Received: by mail-wr1-f70.google.com with SMTP id v5so6061801wrr.0
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 07:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n5B+FPNZ7/nI6MLbnAuYG4akrTLBVajklT8NZmNzarw=;
	b=eSLzBoynWQ4HWH4bMsyc8a0Io938Ox5RzEd5xwqxniEANIro4FZ/tuM1uQrTPrcK0E
	biUPf7pr33HgEXi6qLExuPHN32mKc5iYtnpJZYTTp6SP+hvPidp//0r9IX68HryO7pLP
	XXtwI4+KsrUKTRsO6LshFm6NNHkzg+xZWfGCdPb5MApMSZh8+xJg2qBShC5aIE5S72xn
	K00VDELeYvTyleKwplpKFw+aeHb3zoSlIDQIOeVVedv1+KpTHbqVIwWA9p35WQgPQT+Z
	HAarciT6zg2MDq8oBeu5Ue8VnfxsnMiIhY7xlJ7xRo3OY4uTZt3loWIIWNXnVe9wJZWM
	2DXQ==
X-Gm-Message-State: AOAM533LLXYI4PV8h8UGSvk90yF+94YZaqROeMT7gdSsvg9jR/rAcbcD
	g+mrzzppk5YQDiuQ0/53wm9aKXoo/GvK8Do+AsmSJ3RD4sz9x6oR8/3E0ve86yQEdi+AUUTUrAJ
	10+WIx5bXqCvv1xBpgHGgFl+pyQnL8H/OnZuZog==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr233807wre.78.1606145448872;
	Mon, 23 Nov 2020 07:30:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzepPohFrcwkFvufFYzjTkMx/3VmTCo1TMFA+SsqIyGTMm+QHI0vMzEdDKsr8QA384UVg2iQLJJ3LVHrhBwKwE=
X-Received: by 2002:adf:b64b:: with SMTP id i11mr233790wre.78.1606145448618;
	Mon, 23 Nov 2020 07:30:48 -0800 (PST)
MIME-Version: 1.0
References: <20201122231024.249253-1-aahringo@redhat.com>
In-Reply-To: <20201122231024.249253-1-aahringo@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 23 Nov 2020 16:30:36 +0100
Message-ID: <CAHc6FU6ZeDt9a_d5Aju0uBJCUiHd6tO1BchV6vwFyMyeciDjdw@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH gfs2/for-next] gfs2: Fix deadlock
	dumping resource group glocks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 12:10 AM Alexander Aring <aahringo@redhat.com> wrote:
> Commit 0e539ca1bbbe ("gfs2: Fix NULL pointer dereference in gfs2_rgrp_dump")
> introduced additional locking in gfs2_rgrp_go_dump, which is also used for
> dumping resource group glocks via debugfs.  However, on that code path, the
> glock spin lock is already taken in dump_glock, and taking it again in
> gfs2_glock2rgrp leads to deadlock.  This can be reproduced with:
>
>   $ mkfs.gfs2 -O -p lock_nolock /dev/FOO
>   $ mount /dev/FOO /mnt/foo
>   $ touch /mnt/foo/bar
>   $ cat /sys/kernel/debug/gfs2/FOO/glocks
>
> Fix that by not taking the glock spin lock inside the go_dump callback.
>
> Fixes: 0e539ca1bbbe ("gfs2: Fix NULL pointer dereference in gfs2_rgrp_dump")
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/gfs2/glops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 67f2921ae8d4..6cedeefb7b3f 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -245,7 +245,7 @@ static void rgrp_go_inval(struct gfs2_glock *gl, int flags)
>  static void gfs2_rgrp_go_dump(struct seq_file *seq, struct gfs2_glock *gl,
>                               const char *fs_id_buf)
>  {
> -       struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(gl);
> +       struct gfs2_rgrpd *rgd = gl->gl_object;
>
>         if (rgd)
>                 gfs2_rgrp_dump(seq, rgd, fs_id_buf);
> --
> 2.26.2
>

Thanks. I've added this to for-next for now, but I'll try to push this
to Linus before the 5.10 release.

Andreas

