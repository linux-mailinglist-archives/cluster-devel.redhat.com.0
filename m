Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E71D03C6A15
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 08:01:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626156063;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=9bCaNkAj4f1LnLkK/10jGnK5QRfAHPC6zgTttqqRfXY=;
	b=eniX714LNWsWPOvvFqMT/aVDGM13aRnOEserDutJtp12RXySJBnLbKZev1f7qIyRaDlKWO
	iZlaaqb47029uwz/AQPIwb02om7PMWTSyQTL1/mBOMGvZr323AK2LEbR18/0C1/4Eh3UjZ
	SnBLx9G5eqd3qRYkAnr2Vd8gKyaQr+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-lvmKTl8YMKel3QvteoBrQg-1; Tue, 13 Jul 2021 02:01:01 -0400
X-MC-Unique: lvmKTl8YMKel3QvteoBrQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F99362F9;
	Tue, 13 Jul 2021 06:00:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88ECB5D6BA;
	Tue, 13 Jul 2021 06:00:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15B631809C99;
	Tue, 13 Jul 2021 06:00:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16D60nG7015956 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 02:00:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A01A1100332C; Tue, 13 Jul 2021 06:00:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BFCA11457C9
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 06:00:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9DB289C7E1
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 06:00:44 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-549-oRiJnSNkOEubrS0jg1H0zg-1; Tue, 13 Jul 2021 02:00:43 -0400
X-MC-Unique: oRiJnSNkOEubrS0jg1H0zg-1
Received: by mail-wr1-f71.google.com with SMTP id
	z6-20020a5d4c860000b029013a10564614so7957080wrs.15
	for <cluster-devel@redhat.com>; Mon, 12 Jul 2021 23:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9bCaNkAj4f1LnLkK/10jGnK5QRfAHPC6zgTttqqRfXY=;
	b=MGGUTPFJHjf3TbFJF37qPKx2ciSL1jkCAHAp6z08TVJshTiq6o92Jw01xEnn4d/iPX
	QW7HL68EJgQU7NXVZ1k/HRpxMLJGoQMF73rnuWJ4VT9Zgs/fffe20l88gwcqVplZiTwZ
	CecnD6a0QpRPFL69f8AQx5dXL2ZeEQ4bWATRGaAyANYWkUNCQHTJQoIRFrx8R7u/n4vj
	w+cnwMxQU6mYJbpKp9xZ2oufvuKnXvbG7bHRrY/MIQNX+4lcJ53Rc2YmytNrCORqpO9M
	HCKX29uO3RGv2y0mbHE6ZEcIx4nWqhxqQU0Tqny5sSWAwlE1mc4jx7Hng4YqsPf54yBL
	HN5w==
X-Gm-Message-State: AOAM531Gc1Jhe5fmMuEw+j3/4Bdovuw1i270wud6bJNbqQ3NmcOnXlSf
	9l0HwH0Il1mSnrXwIAGQqwem8rfoWNRrZB/AfyZeHs4yW8YkX4BHr72bWiZ6MnZy1FLFWVjOduv
	CvIXueJ233CPY/GsH8nZMr/5oqOVV5daj5Up59g==
X-Received: by 2002:a1c:62c4:: with SMTP id w187mr3060485wmb.27.1626156041631; 
	Mon, 12 Jul 2021 23:00:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCzQbgh9kCPy6bTMehMxShnwdK8pEgvMZNUVi0DDbMegUNP6IeRgE3zmDkHYgleDuxud58cKPgdT3TkAFz/18=
X-Received: by 2002:a1c:62c4:: with SMTP id w187mr3060445wmb.27.1626156041061; 
	Mon, 12 Jul 2021 23:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210712162430.104913-1-colin.king@canonical.com>
In-Reply-To: <20210712162430.104913-1-colin.king@canonical.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 13 Jul 2021 08:00:00 +0200
Message-ID: <CAHc6FU7oj0j=YC9Y06S8jwT_mew+hbbvXSZo55xxuOKZgSEAPA@mail.gmail.com>
To: Colin King <colin.king@canonical.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix memory leak of object lsi on
	error return path
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Colin,

On Mon, Jul 12, 2021 at 6:24 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> In the case where IS_ERR(lsi->si_sc_inode) is true the error exit path
> to free_local does not kfree the allocated object lsi leading to a memory
> leak. Fix this by kfree'ing lst before taking the error exit path.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 97fd734ba17e ("gfs2: lookup local statfs inodes prior to journal recovery")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/gfs2/ops_fstype.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 5f4504dd0875..bd3b3be1a473 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -677,6 +677,7 @@ static int init_statfs(struct gfs2_sbd *sdp)
>                         error = PTR_ERR(lsi->si_sc_inode);
>                         fs_err(sdp, "can't find local \"sc\" file#%u: %d\n",
>                                jd->jd_jid, error);
> +                       kfree(lsi);
>                         goto free_local;
>                 }
>                 lsi->si_jid = jd->jd_jid;
> --
> 2.31.1

added to for-next.

Thanks,
Andreas

