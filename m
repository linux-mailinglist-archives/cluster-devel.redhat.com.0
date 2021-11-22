Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CADE645964F
	for <lists+cluster-devel@lfdr.de>; Mon, 22 Nov 2021 21:54:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637614469;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=wnBLYAtYOoRoyT+Nzh2WWtd9MEDDJarOajIy2LBECyI=;
	b=fxbrO8086kNBpmBQryDh/9Db+EtCjVD2fT8ciqiVsn/eR0W+8kLyUV+hwXtZsU/9k7deml
	+d3nI0C2sNMwlp92zZH6oUY+JfcWW3WPurZCmpS3nmE8/dsaoZwMSRJm619hNpIOcbMTUg
	NSJJBmBWMC56LBvWHRmTncCXqVoHy4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-XNHNzVu7MImR1GtkZrA6CQ-1; Mon, 22 Nov 2021 15:54:26 -0500
X-MC-Unique: XNHNzVu7MImR1GtkZrA6CQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 071CF1023F53;
	Mon, 22 Nov 2021 20:54:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E3F85DF5E;
	Mon, 22 Nov 2021 20:54:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB0141832E7F;
	Mon, 22 Nov 2021 20:54:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AMKsC8j015091 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 22 Nov 2021 15:54:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 88C0F4010FFC; Mon, 22 Nov 2021 20:54:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 840F940CFD0B
	for <cluster-devel@redhat.com>; Mon, 22 Nov 2021 20:54:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AA4885A5B5
	for <cluster-devel@redhat.com>; Mon, 22 Nov 2021 20:54:12 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-464-oVguC2--N7WLbzCnYfeziw-1; Mon, 22 Nov 2021 15:54:09 -0500
X-MC-Unique: oVguC2--N7WLbzCnYfeziw-1
Received: by mail-wm1-f69.google.com with SMTP id
	r6-20020a1c4406000000b0033119c22fdbso7341050wma.4
	for <cluster-devel@redhat.com>; Mon, 22 Nov 2021 12:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wnBLYAtYOoRoyT+Nzh2WWtd9MEDDJarOajIy2LBECyI=;
	b=muMe+OAOKkBOahCV59aa8KF5QPQ9ZCxd0ns+wSsL5Sg5pfGo3i1UzjqNLO1GOZ9Scj
	rg7M3qQ2zEMnohbU1gSa7ym5U/x2bqQLEXeaQ9s0to9p97P9VY3fUIfftwQttPYgoemW
	BsFHEqx1SDzvwa8U/cX6Hup2X9wvZnzeH5Iud4uRy5b6m1dC7Vq5I7HkVP2XyxbmiduG
	wgpp1H+q3uLyWVdkscZL3a/Hcu4J0GS+Cpzvd9otvI7wirFTARzDaJ+Wibb0Bk9Dh9zG
	vACH92BWSLjk/vt6TuDf5cc9L9hhCb2vbmrZNZ+pg5cKobjSORGMBK0EwULiP8lvI6Gg
	jX5g==
X-Gm-Message-State: AOAM531oZoDI/stSVlFiOTO1T5I+qPfEkEWrsAfrSrkukYR14E0QAqZ9
	y1T3z92BH6Imb03O2/OUtmghnVrx/qypD4nPZXHGtMkxbqzsGh3WjPL0oa0NYLma/dQtfha54kz
	WVGvV2BOv0AZiC7wJoQ8Stf4UVNMSk611Z9mTMg==
X-Received: by 2002:a1c:f005:: with SMTP id a5mr34716204wmb.19.1637614447738; 
	Mon, 22 Nov 2021 12:54:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwv+3Mg/ra8/58iBRaK53knaHB9ER4yThZJzb8zgPE8orKnr8O96JJP7H9pqOqsH7kMt5oAZrceogwMY0oPPMI=
X-Received: by 2002:a1c:f005:: with SMTP id a5mr34716181wmb.19.1637614447556; 
	Mon, 22 Nov 2021 12:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20211112195312.240650-1-rpeterso@redhat.com>
In-Reply-To: <20211112195312.240650-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 22 Nov 2021 21:53:56 +0100
Message-ID: <CAHc6FU6mtPATLbTp77CG94AB-xD65k7MxfYchOLwQ9WkScX==Q@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: zero out all rgrp lvbs after
	recovery
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Bob,

On Fri, Nov 12, 2021 at 8:53 PM Bob Peterson <rpeterso@redhat.com> wrote:
> When journals are replayed they start from the last stable point in
> the journal. But an rgrp's glock lvb can be updated before the rgrp is
> stable in the journal, so another node can see newer lvb values that
> reflect changes made after the stable point in the journal.
>
> This patch changes function thaw_glock, which is called after journal
> recovery is complete, on every node, regardless of whether or not the
> node replayed the journal (and therefore the rgrps). There's no good
> way for any given node to determine if its rgrp glocks had been replayed
> by a different node from a another node's journal, so it has no way to know
> if its lvbs are still valid. So as soon as it knows recovery is complete
> and the journals have been properly replayed, it zeroes out the lvbs
> for all rgrp glocks. This forces it to re-read the lvb the next time
> the glock is held.

this doesn't make sense to me. When looking at the journal, what
matters is where the journal ends (in other words, the point of the
last journal flush), not where it starts. We really must make sure
that the journal has been flushed to include all the resource group
changes before giving up the resource group glock. That's when the
local LVB changes become visible to the other nodes. We should never
have to go back in history, which is what this patch essentially
allows. If we always go forward, the resource group LVBs will never
"go invalid" in the first place.

Thanks,
Andreas

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/glock.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index 8dbd6fe66420..24c101287b70 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -2161,6 +2161,8 @@ void gfs2_flush_delete_work(struct gfs2_sbd *sdp)
>
>  static void thaw_glock(struct gfs2_glock *gl)
>  {
> +       if (gl->gl_name.ln_type == LM_TYPE_RGRP)
> +               memset(gl->gl_lksb.sb_lvbptr, 0, sizeof(struct gfs2_rgrp_lvb));
>         if (!test_and_clear_bit(GLF_FROZEN, &gl->gl_flags))
>                 return;
>         if (!lockref_get_not_dead(&gl->gl_lockref))
> --
> 2.33.1
>

