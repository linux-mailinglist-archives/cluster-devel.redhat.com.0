Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4E723253D5A
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 08:01:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598508081;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WNpC+f3zCzRp3DlafwiCmtmd2OKdSI6tAH1gxnvTtGI=;
	b=ZrLzuC6DcGVFuqqPhjNdmh+FmtTxGgvLvfMf+kzxtXNUHtBke6IwGeA3rbOvma01ZpVULZ
	VwTxYY6EKcm669HLfPvo3WJARrCwVQn2JStEXM8TbkVusR2H+f5C/GxJt02e7QBoHfvsL8
	2XTlqgjCiIdSPqthE5bhHwr3umSLEWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-EDszUngWPvih10qKOfSsnw-1; Thu, 27 Aug 2020 02:01:19 -0400
X-MC-Unique: EDszUngWPvih10qKOfSsnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51401186A570;
	Thu, 27 Aug 2020 06:01:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 415F0747BD;
	Thu, 27 Aug 2020 06:01:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D682181A06B;
	Thu, 27 Aug 2020 06:01:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07R61FBd019354 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 02:01:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77E3F2166BA4; Thu, 27 Aug 2020 06:01:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 725132166BB3
	for <cluster-devel@redhat.com>; Thu, 27 Aug 2020 06:01:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DFC880019A
	for <cluster-devel@redhat.com>; Thu, 27 Aug 2020 06:01:13 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-370-sbFQKMbXPdmiWeLWGiUgxw-1; Thu, 27 Aug 2020 02:01:11 -0400
X-MC-Unique: sbFQKMbXPdmiWeLWGiUgxw-1
Received: by mail-ot1-f69.google.com with SMTP id l28so2265248oti.18
	for <cluster-devel@redhat.com>; Wed, 26 Aug 2020 23:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WNpC+f3zCzRp3DlafwiCmtmd2OKdSI6tAH1gxnvTtGI=;
	b=E/Rn3cPQ6P9oOe9cJEdGzJF370YTDeh77AlO5j9laSFRIAvNQKsDtpMUEuo0zIMphS
	3sNZ44rxo/AH5OF02aBoy/uZvrpMSHFFzq4NTymxKIfWGK3akjeuCCas1n5Pun+fZdrp
	3e+os1NEW+bFU8GWyagkUexIUkpWNJ1IEUxIgChxnF7FwZtLChUj6/8Hle6aQ4Mhc68c
	Km7Y3LnYb+iTbNN8+w+z16R2KCLo5xt/eGb9CLNczXZGgnRxcRaMVDFitadZA6ZYReVq
	SD9q5djAclzbO7UZT5yidrlxAafX5kzFQK7AGIw2EONzMhiE+/aZRcW1cv8+ExA3i3ZQ
	bkHg==
X-Gm-Message-State: AOAM533gx+o7sMwjHWjvWTO2NoILpEqAGacg6QFxTradTTARvuKHBgvx
	JX7pYq01CviF0dHyjaM6+Pnj7dUQWfrQcF5Sku+A67OcuxXN6JjIkEgp5/U4KVSRnBJ8sB6qkQ8
	UW249L+J+EuLakD+jjVX7UIp5xZMMnMMhx/rj+A==
X-Received: by 2002:a05:6830:1c2b:: with SMTP id
	f11mr12409264ote.58.1598508070311; 
	Wed, 26 Aug 2020 23:01:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7NDyzsh81cPeVkmaMOxWfBuelh9p7vShHpZh/DegiroYFASPkH9V2EdH1pyd6+T1Dx/LXAgMMmc8Q4oPIrAY=
X-Received: by 2002:a05:6830:1c2b:: with SMTP id
	f11mr12409232ote.58.1598508069579; 
	Wed, 26 Aug 2020 23:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200821173337.20377-1-rpeterso@redhat.com>
	<20200821173337.20377-8-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-8-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 27 Aug 2020 08:00:00 +0200
Message-ID: <CAHc6FU4yVZwgK7966J+Op=6Y3cCFFPe9uQ16x5u_xZ3zs=fhkg@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 07/12] gfs2: make
 gfs2_ail1_empty_one return the count of active items
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Bob,

On Fri, Aug 21, 2020 at 7:33 PM Bob Peterson <rpeterso@redhat.com> wrote:
> This patch is one baby step toward simplifying the journal management.
> It simply changes function gfs2_ail1_empty_one from a void to an int and
> makes it return a count of active items. This allows the caller to check
> the return code rather than list_empty on the tr_ail1_list. This way
> we can, in a later patch, combine transaction ail1 and ail2 lists.

what does "we can combine transaction ail1 and ail2 lists" mean?

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/log.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index 3e24e8733950..4fb1a96b8124 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -244,13 +244,15 @@ static void gfs2_ail1_start(struct gfs2_sbd *sdp)
>   * @tr: the transaction
>   * @max_revokes: If nonzero, issue revokes for the bd items for written buffers
>   *
> + * returns: the transaction's count of remaining active items
>   */
>
> -static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
> +static int gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
>                                 int *max_revokes)
>  {
>         struct gfs2_bufdata *bd, *s;
>         struct buffer_head *bh;
> +       int active_count = 0;
>
>         list_for_each_entry_safe_reverse(bd, s, &tr->tr_ail1_list,
>                                          bd_ail_st_list) {
> @@ -265,8 +267,10 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
>                  * If the ail buffer is not busy and caught an error, flag it
>                  * for others.
>                  */
> -               if (!sdp->sd_log_error && buffer_busy(bh))
> +               if (!sdp->sd_log_error && buffer_busy(bh)) {
> +                       active_count++;
>                         continue;
> +               }
>                 if (!buffer_uptodate(bh) &&
>                     !cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
>                         gfs2_io_error_bh(sdp, bh);
> @@ -285,6 +289,7 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
>                 }
>                 list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
>         }
> +       return active_count;
>  }
>
>  /**
> @@ -303,8 +308,7 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
>
>         spin_lock(&sdp->sd_ail_lock);
>         list_for_each_entry_safe_reverse(tr, s, &sdp->sd_ail1_list, tr_list) {
> -               gfs2_ail1_empty_one(sdp, tr, &max_revokes);
> -               if (list_empty(&tr->tr_ail1_list) && oldest_tr)
> +               if (!gfs2_ail1_empty_one(sdp, tr, &max_revokes) && oldest_tr)
>                         list_move(&tr->tr_list, &sdp->sd_ail2_list);
>                 else
>                         oldest_tr = 0;
> --
> 2.26.2
>

Thanks,
Andreas

