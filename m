Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DBADD1F03DA
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403011;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+WE4Lbj5HbIup3fDAwRbZbnNZOZHXXgrGk9ZQaJUWQQ=;
	b=i6t/hi+y44baXy/u6DTGv9kMAmL3/HDhxAbSQZj1lK+1a/dR03Gtn7ij0zRTECwefI3x9d
	EXfksmq8VCalvd1tkUUzQJvCHXgCwj2qXpHpNEzY9Wv/4TFqT4t6ZrdVQhxODJUQ88ZJTY
	RUy3BBtbgBKkl5W/NbaEp7c8vh1rBN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-J1q_7TfPMtuNbAq_d5Uz2A-1; Fri, 05 Jun 2020 20:23:30 -0400
X-MC-Unique: J1q_7TfPMtuNbAq_d5Uz2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CED9680B725;
	Sat,  6 Jun 2020 00:23:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCAAB61985;
	Sat,  6 Jun 2020 00:23:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A86421809547;
	Sat,  6 Jun 2020 00:23:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055DOuJq000851 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 09:24:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E95D2166B28; Fri,  5 Jun 2020 13:24:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA902156A49
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 13:24:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38E56833B4E
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 13:24:54 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
	[209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-415-IOfsnPByPsCzpL_THWJgeQ-1; Fri, 05 Jun 2020 09:24:52 -0400
X-MC-Unique: IOfsnPByPsCzpL_THWJgeQ-1
Received: by mail-ot1-f70.google.com with SMTP id 93so4679477oti.5
	for <cluster-devel@redhat.com>; Fri, 05 Jun 2020 06:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+WE4Lbj5HbIup3fDAwRbZbnNZOZHXXgrGk9ZQaJUWQQ=;
	b=Vk0ZXIrlkFhE/WmtEQBv3tj4DMn0lOSJeWJ2udlUynwzbM3QTCBnBEz5DUGLaMxsSB
	ohndqB3LFsLLk09JkAz4/sH5U47RJFzTObVoYci0o1cdlJiiGfTr/qoIu6E8SvHXInsk
	Q9+SRvdVKxtVAN+40vEn19hxvEJoMwFFRN0GH/3e0AXhutJ8BcFr+7hvNC2BHgfsPdhG
	3fNvmsXmM0Bk/KR991jrvVKpl1+GUDkRcgbkOu8k7hiudvp5APPLUnvSBAhS/XmOPMi/
	i3idNARcO/pesT+vn6s4d/WKTaeFX5rsiGLRMbn2eVHHBypiHu84OpTOL8CWXOcJa6CR
	3K0g==
X-Gm-Message-State: AOAM532GwMTJzuy2X7XUL+cFMT7FhA0wPiLmE0lfCeKPGYyuBcGHNK/u
	fQeTKkoQbcyWsacCJUqQvsyVCiVWMm718gAEuh3lzxZAThRuJhY01K4aGm7jFlbEDF+XSF4EvP+
	8qHqSHef3fXlNw44X2dCDu2MN4puhl8EfcB8OmQ==
X-Received: by 2002:a9d:6e96:: with SMTP id a22mr6732165otr.58.1591363491334; 
	Fri, 05 Jun 2020 06:24:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjDQlVDtuQDGSHd0ugkGxDDaoSpjTYCENGyl927b1oWvljpdjQSPvHMsvqeEW6iAWHJnp2E+XJIFG04q3tBtE=
X-Received: by 2002:a9d:6e96:: with SMTP id a22mr6732159otr.58.1591363491127; 
	Fri, 05 Jun 2020 06:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200526130536.295081-1-rpeterso@redhat.com>
	<20200526130536.295081-7-rpeterso@redhat.com>
In-Reply-To: <20200526130536.295081-7-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 5 Jun 2020 15:24:39 +0200
Message-ID: <CAHc6FU6Zo3gQCRt=rj8Xf3yyf4T8uX1vfHL9L1DJy3L90XkARQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 6/8] gfs2: instrumentation wrt log_flush
	stuck
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
Content-Type: text/plain; charset="UTF-8"

Hi Bob,

On Tue, May 26, 2020 at 3:05 PM Bob Peterson <rpeterso@redhat.com> wrote:
> This adds checks for gfs2_log_flush being stuck, similarly to the check
> in gfs2_ail1_flush.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/log.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index 1d51b4781bdd..636c82dda68b 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -145,9 +145,6 @@ static void dump_ail_list(struct gfs2_sbd *sdp)
>         struct gfs2_bufdata *bd;
>         struct buffer_head *bh;
>
> -       fs_err(sdp, "Error: In gfs2_ail1_flush for ten minutes! t=%d\n",
> -              current->journal_info ? 1 : 0);
> -
>         list_for_each_entry_reverse(tr, &sdp->sd_ail1_list, tr_list) {
>                 list_for_each_entry_reverse(bd, &tr->tr_ail1_list,
>                                             bd_ail_st_list) {
> @@ -197,6 +194,8 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc)
>  restart:
>         ret = 0;
>         if (time_after(jiffies, flush_start + (HZ * 600))) {
> +               fs_err(sdp, "Error: In gfs2_ail1_flush for ten minutes! "
> +                      "t=%d\n", current->journal_info ? 1 : 0);
>                 dump_ail_list(sdp);
>                 goto out;
>         }
> @@ -970,7 +969,16 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
>
>         if (!(flags & GFS2_LOG_HEAD_FLUSH_NORMAL)) {
>                 if (!sdp->sd_log_idle) {
> +                       unsigned long start = jiffies;
> +
>                         for (;;) {
> +                               if (time_after(jiffies, start + (HZ * 600))) {

This should probably have some rate limiting as well, for example:

                                        start = jiffies;

I'm not sure what provides similar rate limiting in gfs2_ail1_flush.

> +                                       fs_err(sdp, "Error: In gfs2_log_flush "
> +                                              "for 10 minutes! t=%d\n",
> +                                              current->journal_info ? 1 : 0);

Please don't break the format string up like that; this makes grepping harder.

> +                                       dump_ail_list(sdp);
> +                                       break;
> +                               }
>                                 gfs2_ail1_start(sdp);
>                                 gfs2_ail1_wait(sdp);
>                                 if (gfs2_ail1_empty(sdp, 0))
> --
> 2.26.2
>

