Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EAF0EFE4BE
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Nov 2019 19:16:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573841795;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8UEBR1m2jn0xM6G9fomOzyxAYAcz9OcK/lRP8i7NH44=;
	b=h7tsGfBDO1uAc7LwpHgDnkDP2YzdpZODvZBPZNraV7pkrQmu/Ldz9M5nNgoEwGeHBHqzyT
	8z1ZRqdubnHqQMo5J7xof6o27A5066sEGBtx9+5B1UMWj6/XBBFjrsrtF3TPRdxT+cLdTC
	pBRP1/pibokIt6n8ZUjvPO31O/rVUqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-tTb43NVdMC-OMilWL8XERQ-1; Fri, 15 Nov 2019 13:16:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C3901852E23;
	Fri, 15 Nov 2019 18:16:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF2AD60BE1;
	Fri, 15 Nov 2019 18:16:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 969234BB65;
	Fri, 15 Nov 2019 18:16:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAFIGQgq014780 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 15 Nov 2019 13:16:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A5A9553C7; Fri, 15 Nov 2019 18:16:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1E0C53C4
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 18:16:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFE6E185A793
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 18:16:24 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
	[209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-366-ty9-k_REPzaHCBQCRNxxTA-1; Fri, 15 Nov 2019 13:16:23 -0500
Received: by mail-oi1-f199.google.com with SMTP id s204so5528264oib.7
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 10:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MA9nvrQFTHk/M4T9UYxiJvNxl9y698+lI/ym7uAAnyc=;
	b=JqPvQniedkW8oRsTzLqkVjEoC1Z0sRwRxFCcEBovq8J126S7F5wN0hkJD3FFXACyJU
	sUchsPCH5PyRN5GurVLB+qdtXUv2AeM4QqbqhZKSOyoxgNARiItMcRTTS9yonfo21QXG
	aeWzsv5pdsqyd/50k13KHOn2nekblnFWAdMGJ55D60x2m5XwSyPejF7qPbKxk1Himgtj
	6xEreSAui5n7coGqtCr+rX1rycFMvHpH3wTAZdFoEoIKsNEEaHdzuUbPJFErlenSlB1+
	3SBtznLJJCHdb+FNcB/T8GsIBB6/uWqrB1iihIHkPBzzC08rqTnqywrn5xw36Erz31SY
	u4dA==
X-Gm-Message-State: APjAAAVIlCcuCjGIkKnRNFxVG5sR08pMBQnRSjtqot6EjQPNe6o3qyB7
	vA8YcLmwinFctUH4PdaAxgRUreEb7QDzeK+0tnGykSVua9SXUTB9mDxnhhhJMQTGPZXhRgJ5Cbn
	6xsTaj6gFq+ZlPmhMQ8/ZyKQgmn0vEGosE/KGfw==
X-Received: by 2002:aca:5cc6:: with SMTP id q189mr8980112oib.101.1573841782923;
	Fri, 15 Nov 2019 10:16:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8ARVNQCzR81JqtuFb/bo5FydF3AjMsjpdf/P0mWNj42JZV3QGyJzA18l+4ee9vBoeJTzDyKY0N0DKas6wlmc=
X-Received: by 2002:aca:5cc6:: with SMTP id q189mr8980096oib.101.1573841782628;
	Fri, 15 Nov 2019 10:16:22 -0800 (PST)
MIME-Version: 1.0
References: <923916143.30270056.1573833780225.JavaMail.zimbra@redhat.com>
In-Reply-To: <923916143.30270056.1573833780225.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 15 Nov 2019 19:16:11 +0100
Message-ID: <CAHc6FU5wWpheANOX8rTBB1QpkA1kY=CUH01xQFSb+v+_9WiSqQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: ty9-k_REPzaHCBQCRNxxTA-1
X-MC-Unique: tTb43NVdMC-OMilWL8XERQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAFIGQgq014780
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v2] gfs2: if finish_open returns
 error, clean up iopen glock mess
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Bob,

On Fri, Nov 15, 2019 at 5:03 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Just noticed (and fixed) the redundant clear_bit. Sorry.
> ---
> Before this patch, if anything went wrong in function gfs2_create_inode
> it would goto fail_gunlock3 and clean up the iopen glock it had just
> created and locked. However, if function finish_open returns an error
> it did not. That meant subsequent attempts to create the file were
> seen as glock recursion errors on the iopen glock.
>
> This patch adds additional checking for an error from finish_open and
> cleans up the iopen glock appropriately.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/inode.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index dcb5d363f9b9..36eb223b185e 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -772,6 +772,11 @@ static int gfs2_create_inode(struct inode *dir, stru=
ct dentry *dentry,
>         gfs2_glock_dq_uninit(ghs);
>         gfs2_glock_dq_uninit(ghs + 1);
>         clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
> +       if (error) {
> +               glock_clear_object(io_gl, ip);
> +               gfs2_glock_dq_uninit(&ip->i_iopen_gh);
> +               gfs2_glock_put(io_gl);
> +       }
>         return error;
>
>  fail_gunlock3:
>

this doesn't look quite right. In gfs2_create_inode, the call to
d_instantiate is supposed to be the "point of no return": after that,
the vfs should be calling .evict_inode once the inode goes away. So it
looks more like gfs2_evict_inode isn't cleaning things up properly to
me. I need to investigate further.

Thanks,
Andreas


