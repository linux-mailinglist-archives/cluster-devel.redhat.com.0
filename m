Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B429B253D59
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 08:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598508069;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HT7xNMqOMe7Doxio6Z1gvgOXGF0U9dwxT8LfIAd4d2A=;
	b=HwD32XCJ6Sd/0JWOuvRRZuuWAZLudZOcMYwC8AsMhsUhJA4vwRPr7F9KMOvKpmoSkRrWA8
	XT3KSN+3F33Up2RmgdgqlgjiXTI2PcHBw2kvfU+nxuXG2OxJBu1ODeQEV1GLKe5sSIsZmQ
	0v5UhVlr2mHEMX1PJvThWfAvF2ckunI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-0lRNO8C-PHO7y-qj4G5YQQ-1; Thu, 27 Aug 2020 02:01:08 -0400
X-MC-Unique: 0lRNO8C-PHO7y-qj4G5YQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAFE61DE01;
	Thu, 27 Aug 2020 06:01:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C97C85D9E8;
	Thu, 27 Aug 2020 06:01:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9261FA2208;
	Thu, 27 Aug 2020 06:01:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07R613Pm019317 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 02:01:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77092115588B; Thu, 27 Aug 2020 06:01:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 730531155882
	for <cluster-devel@redhat.com>; Thu, 27 Aug 2020 06:01:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE583185A78B
	for <cluster-devel@redhat.com>; Thu, 27 Aug 2020 06:01:00 +0000 (UTC)
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
	[209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-534-bUaJOcEOO1-9esDepZK02g-1; Thu, 27 Aug 2020 02:00:58 -0400
X-MC-Unique: bUaJOcEOO1-9esDepZK02g-1
Received: by mail-oo1-f72.google.com with SMTP id a5so2373834ooj.6
	for <cluster-devel@redhat.com>; Wed, 26 Aug 2020 23:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HT7xNMqOMe7Doxio6Z1gvgOXGF0U9dwxT8LfIAd4d2A=;
	b=YQ4Q4dkXCP+HWmsl7zCdVw5ToEO3mXIGB43/lL1SiTyb1zGVgdLwB1qbDPLNp47HHh
	S2cduEjRm7WLXun8Qk8q8LdlrTY46kS4o8Fns41rbcAgtJ+kMwJG9sy9ULcimlsQmqJv
	H9wHiPlrYyCVpqIe0aCrX6NYET/EpdFmfzelwsckg6vtleDTrZ7za9ww/3MdveSzvbSH
	rnwpy/3ZiZ5lIUJvebtyI3s2G+7CPpCsJ5ntRToGZsEesYZRqFQ78k62IS0aEAN58DQj
	PGlPTe1IAvf2lNkzXIl3eBl0K8h66/d4LRM+l9EasEALgx8SdH2nkO/IvJTag81dch0K
	8DIw==
X-Gm-Message-State: AOAM531yGZ+ipc25I7hBsjOPYbqTmp+eXHJiI0SjvrPsy0Eu5pKbS3CV
	VIRoSQB+u+gFSE8Ahxd3lRU18VPuz7vMrET8NYQOBNoS2rl5vucqCNjcOM+5+aq0Ginj9ZmJvHq
	A7khUJnPYNiUoNsm/1xBDV1hTLEcZqBwcijaY1g==
X-Received: by 2002:a54:4007:: with SMTP id x7mr5777929oie.178.1598508057514; 
	Wed, 26 Aug 2020 23:00:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC1K56UuMhwkWiQllu/L9He6wVtZ1V8Ot/yAQb3nZ3kvZH8bsMXWYMdhcpEhX6K7REgacsGvghBi8F61bPOTw=
X-Received: by 2002:a54:4007:: with SMTP id x7mr5777918oie.178.1598508057225; 
	Wed, 26 Aug 2020 23:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200821173337.20377-1-rpeterso@redhat.com>
	<20200821173337.20377-6-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-6-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 27 Aug 2020 08:00:00 +0200
Message-ID: <CAHc6FU6iq27VdNHSOsvv0A_ULz6raGtCCsi-qGS6h2cUxvCvzg@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 05/12] gfs2: Calculate number of
 revokes during evict
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 21, 2020 at 7:33 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, function gfs2_evict_inode would start a transaction
> in order to write some unknown number of revokes. Instead of calculating
> the value, it used sdp->sd_jdesc->jd_blocks, the number of blocks in the
> entire journal. You can fit a lot of revokes in a block (in a 4K block
> you can fit 503 of them). For a 512MB journal has 131072 blocks, it would
> ask for 261 free blocks.
>
> This patch changes it to calculate the number of revokes based on the
> nrpages values of the address space plus glock address space. Note that
> since it does this after clearing out the ail list, we don't need to
> use the number of (old) revokes in the calculation. We calculate it from
> the number of standing new items that need revoking.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/super.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 9f4d9e7be839..80ac446f0110 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1336,6 +1336,7 @@ static void gfs2_evict_inode(struct inode *inode)
>         struct gfs2_inode *ip = GFS2_I(inode);
>         struct gfs2_holder gh;
>         struct address_space *metamapping;
> +       int nr_revokes;
>         int error;
>
>         if (test_bit(GIF_FREE_VFS_INODE, &ip->i_flags)) {
> @@ -1434,7 +1435,11 @@ static void gfs2_evict_inode(struct inode *inode)
>         write_inode_now(inode, 1);
>         gfs2_ail_flush(ip->i_gl, 0);
>
> -       error = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
> +       nr_revokes = inode->i_mapping->nrpages + metamapping->nrpages;

We could surely use a more realistic number of revokes here, but this
approach really doesn't make any sense, sorry.

> +       if (!nr_revokes)
> +               goto out_unlock;
> +
> +       error = gfs2_trans_begin(sdp, 0, nr_revokes);
>         if (error)
>                 goto out_unlock;
>         /* Needs to be done before glock release & also in a transaction */
> --
> 2.26.2

Thanks,
Andreas

