Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA7672A54
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 22:22:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674076967;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2gxfKpkvolSDTmP8G9AtlA39SHe7LBRoCBVnTv14nW0=;
	b=iqOOX4SJScawJeEaB4Zw27VhGfB445sOkcot5AgD5blWlg4zw84elmBOf51CdwrSnjpO89
	JxhIXPm/kQBzwlssbNxzL2tGlfVqDHlE1202jUWl/VP5HKAU5PS1ICjBmGg0zMjhMJX+tK
	xO2orJzQGZXZj91kqW0CyFyhQI/5tVI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-LRklAiW4OWuxepe32bvwEA-1; Wed, 18 Jan 2023 16:22:44 -0500
X-MC-Unique: LRklAiW4OWuxepe32bvwEA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0ED687B2A3;
	Wed, 18 Jan 2023 21:22:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC35C492C18;
	Wed, 18 Jan 2023 21:22:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 53E111946A6E;
	Wed, 18 Jan 2023 21:22:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 100AE1946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 21:22:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 09C98492C18; Wed, 18 Jan 2023 21:22:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02990492C14
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 21:22:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB5CE3C02547
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 21:22:35 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-17-wtwOZTV6NAC3hpdIQRBK3w-1; Wed, 18 Jan 2023 16:22:34 -0500
X-MC-Unique: wtwOZTV6NAC3hpdIQRBK3w-1
Received: by mail-pl1-f198.google.com with SMTP id
 p4-20020a170902e74400b00194b02104a1so175313plf.3
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 13:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2gxfKpkvolSDTmP8G9AtlA39SHe7LBRoCBVnTv14nW0=;
 b=QwVHvnnxlbuu5jF5UEoEm4FRFZMFtIhxHcJhiDrflbK5JkuPLAaHV2sz9eL6g3XZdF
 X1CrtCDMgMjad6eGGfQGz5Hoebu5l37wPpWcO/5Cye1qcN0dVKwLiID+YdbG5+Af+HtK
 w0dafRCPoqh2smgCbuu9aCJeyj0BstYf6XHLN4bXayH4ftdCOZmF+2fw0IvxZ+77IHgm
 pl8C2erJYKCqscoxqvAzTeDM8dY1LONZ5X+z7jLcNa8J8JUP8+aRR74AlKKJn47E7Plx
 M+NVcPdgq1o3toJKx4/IAMdZAD0QIIcjlv1zptJhLiBuJdEjHLretOd3i0UiOIRYZiAe
 YAiw==
X-Gm-Message-State: AFqh2kqtL8Mw0N0Oh/UeQI86z8w/86mAY1QLgpB7qID/zO8xw9TZ7Pdt
 ohzts5x20+xtkjHk+XpcQoPNY+xJDi6Ul1MxU36WGPJ6SM/lN9vZ8RE+24X3EPcHTU0vKlRm8iO
 7ph+6xSi7HwmbNwq2pBrLrEHUeYNdVMCVW6lNqA==
X-Received: by 2002:a62:be13:0:b0:58d:b201:84b1 with SMTP id
 l19-20020a62be13000000b0058db20184b1mr861991pff.41.1674076952265; 
 Wed, 18 Jan 2023 13:22:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtLcKVZ6bDykccsj+jnOo2F/dATqdhlnEqdG92C+vaBhHS3utB3cqQ2gbTqHp/mB4oUwt5eRGaT1myO3ALRKTw=
X-Received: by 2002:a62:be13:0:b0:58d:b201:84b1 with SMTP id
 l19-20020a62be13000000b0058db20184b1mr861990pff.41.1674076952001; Wed, 18 Jan
 2023 13:22:32 -0800 (PST)
MIME-Version: 1.0
References: <20220719041311.709250-1-hch@lst.de>
 <20220719041311.709250-2-hch@lst.de>
In-Reply-To: <20220719041311.709250-2-hch@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 18 Jan 2023 22:22:20 +0100
Message-ID: <CAHc6FU5A71L0r2k5z7QoBZe3pO+5G1nMNvKfGmJzprQWFyDCog@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 1/4] gfs2: stop using generic_writepages
 in gfs2_ail1_start_one
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Christoph,

On Tue, Jul 19, 2022 at 7:07 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use filemap_fdatawrite_wbc instead of generic_writepages in
> gfs2_ail1_start_one so that the functin can also cope with address_space
> operations that only implement ->writepages and to properly account
> for cgroup writeback.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/gfs2/log.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index f0ee3ff6f9a87..a66e3b1f6d178 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -131,7 +131,7 @@ __acquires(&sdp->sd_ail_lock)
>                 if (!mapping)
>                         continue;
>                 spin_unlock(&sdp->sd_ail_lock);
> -               ret = generic_writepages(mapping, wbc);
> +               ret = filemap_fdatawrite_wbc(mapping, wbc);

this patch unfortunately breaks journaled data inodes.

We're in function gfs2_ail1_start_one() here, which is usually called
via gfs2_log_flush() -> empty_ail1_list() -> gfs2_ail1_start() ->
gfs2_ail1_flush() -> gfs2_ail1_start_one(), and we're going through
the list of buffer heads in the transaction to be flushed. We used to
submit each dirty buffer for I/O individually, but since commit
5ac048bb7ea6 ("GFS2: Use filemap_fdatawrite() to write back the AIL"),
we're submitting all the dirty pages in the metadata address space
this buffer head belongs to. That's slightly bizarre, but it happens
to catch exactly the same buffer heads that are in the transaction, so
we end up with the same result. From what I'm being told, this was
done as a performance optimization -- but nobody actually knows the
details anymore.

The above change means that instead of calling generic_writepages(),
we end up calling filemap_fdatawrite_wbc() -> do_writepages() ->
mapping->a_ops->writepages(). But that's something completely
different; the writepages address space operation operates is outward
facing, while we really only want to write out the dirty buffers /
pages in the underlying address space. In case of journaled data
inodes, gfs2_jdata_writepages() actually ends up trying to create a
filesystem transaction, which immediately hangs because we're in the
middle of a log flush.

So I'm tempted to revert the following two of your commits; luckily
that's independent from the iomap_writepage() removal:

  d3d71901b1ea ("gfs2: remove ->writepage")
  b2b0a5e97855 ("gfs2: stop using generic_writepages in gfs2_ail1_start_one")

I think we could go through iomap_writepages() instead of
generic_writepages() here as well,  but that's for another day.

As far as cgroup writeback goes, this is journal I/O and I don't have
the faintest idea how the accounting for that is even supposed to
work.

>                 if (need_resched()) {
>                         blk_finish_plug(plug);
>                         cond_resched();
> @@ -222,8 +222,7 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc)
>         spin_unlock(&sdp->sd_ail_lock);
>         blk_finish_plug(&plug);
>         if (ret) {
> -               gfs2_lm(sdp, "gfs2_ail1_start_one (generic_writepages) "
> -                       "returned: %d\n", ret);
> +               gfs2_lm(sdp, "gfs2_ail1_start_one returned: %d\n", ret);
>                 gfs2_withdraw(sdp);
>         }
>         trace_gfs2_ail_flush(sdp, wbc, 0);
> --
> 2.30.2
>

Thanks,
Andreas

