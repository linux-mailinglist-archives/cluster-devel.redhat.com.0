Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A27584F1750
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 16:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649083365;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hXiWPffxpHbWQ2eIaoK3c/FiSIjbtVnbbyc5wOi1X2k=;
	b=SZV5nZccHmicIYcp0ZtVtM0NDhR/a1usRkozPwBohH9509e/2l8GIvPWckMXIj6kYIasfx
	bVZGl5haOVXa+T/M324ZrnznU4V/7T2l4SJ385XCenFATY0no+8k5sVjNq39GwPqSbHwXk
	Jf0SylVwcQmih1g3F5qpLmG/jYmXq28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-nUArLqWwOW6x30y55o8trg-1; Mon, 04 Apr 2022 10:42:44 -0400
X-MC-Unique: nUArLqWwOW6x30y55o8trg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A2F1833978;
	Mon,  4 Apr 2022 14:42:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CF8B40F013;
	Mon,  4 Apr 2022 14:42:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 692661940365;
	Mon,  4 Apr 2022 14:42:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DE54C19451EF for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 14:42:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7BCEB40F013; Mon,  4 Apr 2022 14:42:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 781F8401E9A
 for <cluster-devel@redhat.com>; Mon,  4 Apr 2022 14:42:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AB293C11A07
 for <cluster-devel@redhat.com>; Mon,  4 Apr 2022 14:42:17 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-uk78mnMONsKXg9StovJiuQ-1; Mon, 04 Apr 2022 10:42:16 -0400
X-MC-Unique: uk78mnMONsKXg9StovJiuQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r64-20020a1c2b43000000b0038b59eb1940so81486wmr.0
 for <cluster-devel@redhat.com>; Mon, 04 Apr 2022 07:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hXiWPffxpHbWQ2eIaoK3c/FiSIjbtVnbbyc5wOi1X2k=;
 b=LYiGqQG0WVVwZ4G43A8zw7skIh7CzVIcPk+mKCUyqmxQgC79IWi/pOFAXgSCbNRZFT
 Vgt4H1kcFspOXQgln0p1ZiTn/6LazsxFtJWqzfWewqXownjIcKdFd5k0l++1YTdn2Blp
 I7SC00vXpjM5OAxANF4YGU5/3Fi8V92Nq4fGfsbEvdBE78z6OEKerwWCa+cffHZcaw+3
 tRziubbWY/U02jOwfYY/aCIJnKuK9otv3It1cgwgRAjTNK96XmTFzQGnvoXXwbgUh+mN
 M1DTUPSIdA3XonEkHQe85+yjVwa2z5dO2DsA8vOEO2C8ylZUnBt91niO3Sd0C5i6u95B
 /IEQ==
X-Gm-Message-State: AOAM533pSnS6REnLc54+AJFwxhb4uPg/Ntk/45rIubbnA1c8//FyhyLB
 4XCBPvgC+AKNPwk0AeZNp2aQBTnKfGQgQpjTl0JXKM3k8EQNzIGuOfxJrCpT2ViNmaVIC5xesvN
 34j0/lSwgXmrVfsZwfqg6jUPqzJ/1CUdXDGbO3g==
X-Received: by 2002:a5d:4684:0:b0:206:160d:e0c9 with SMTP id
 u4-20020a5d4684000000b00206160de0c9mr2639819wrq.493.1649083334824; 
 Mon, 04 Apr 2022 07:42:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg+AfJaKH2047sRS+vqJejShKW3qlU7AVJoJsOCrGfYlFDGBqiqqYdurFN8nbwtgyAQlaX7ImMjM46ne0LI5w=
X-Received: by 2002:a5d:4684:0:b0:206:160d:e0c9 with SMTP id
 u4-20020a5d4684000000b00206160de0c9mr2639801wrq.493.1649083334618; Mon, 04
 Apr 2022 07:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220331223857.902911-1-jakobkoschel@gmail.com>
 <20220331223857.902911-2-jakobkoschel@gmail.com>
In-Reply-To: <20220331223857.902911-2-jakobkoschel@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 4 Apr 2022 16:42:03 +0200
Message-ID: <CAHc6FU41FSZHGx+H1zBsBEnLo2s2fViDKJV4P-LJXg3s5xP4WA@mail.gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 2/2] gfs2: replace usage of found with
 dedicated list iterator variable
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
Cc: LKML <linux-kernel@vger.kernel.org>, "Bos, H.J." <h.j.bos@vu.nl>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 cluster-devel <cluster-devel@redhat.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, Mike Rapoport <rppt@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Jakob,

On Fri, Apr 1, 2022 at 12:40 AM Jakob Koschel <jakobkoschel@gmail.com> wrote:
> To move the list iterator variable into the list_for_each_entry_*()
> macro in the future it should be avoided to use the list iterator
> variable after the loop body.
>
> To *never* use the list iterator variable after the loop it was
> concluded to use a separate iterator variable instead of a
> found boolean [1].
>
> This removes the need to use a found variable and simply checking if
> the variable was set, can determine if the break/goto was hit.
>
> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  fs/gfs2/quota.c    | 13 ++++++-------
>  fs/gfs2/recovery.c | 22 ++++++++++------------
>  2 files changed, 16 insertions(+), 19 deletions(-)
>
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index be0997e24d60..dafd04fb9164 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -443,7 +443,7 @@ static int qd_check_sync(struct gfs2_sbd *sdp, struct gfs2_quota_data *qd,
>
>  static int qd_fish(struct gfs2_sbd *sdp, struct gfs2_quota_data **qdp)
>  {
> -       struct gfs2_quota_data *qd = NULL;
> +       struct gfs2_quota_data *qd = NULL, *iter;
>         int error;
>         int found = 0;
>
> @@ -454,15 +454,14 @@ static int qd_fish(struct gfs2_sbd *sdp, struct gfs2_quota_data **qdp)
>
>         spin_lock(&qd_lock);
>
> -       list_for_each_entry(qd, &sdp->sd_quota_list, qd_list) {
> -               found = qd_check_sync(sdp, qd, &sdp->sd_quota_sync_gen);
> -               if (found)
> +       list_for_each_entry(iter, &sdp->sd_quota_list, qd_list) {
> +               found = qd_check_sync(sdp, iter, &sdp->sd_quota_sync_gen);
> +               if (found) {
> +                       qd = iter;

we might as well get rid of 'found' here like in the below two
changes. Let me fix that up.

>                         break;
> +               }
>         }
>
> -       if (!found)
> -               qd = NULL;
> -
>         spin_unlock(&qd_lock);
>
>         if (qd) {
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index 016ed1b2ca1d..2bb085a72e8e 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -55,17 +55,16 @@ int gfs2_replay_read_block(struct gfs2_jdesc *jd, unsigned int blk,
>  int gfs2_revoke_add(struct gfs2_jdesc *jd, u64 blkno, unsigned int where)
>  {
>         struct list_head *head = &jd->jd_revoke_list;
> -       struct gfs2_revoke_replay *rr;
> -       int found = 0;
> +       struct gfs2_revoke_replay *rr = NULL, *iter;
>
> -       list_for_each_entry(rr, head, rr_list) {
> -               if (rr->rr_blkno == blkno) {
> -                       found = 1;
> +       list_for_each_entry(iter, head, rr_list) {
> +               if (iter->rr_blkno == blkno) {
> +                       rr = iter;
>                         break;
>                 }
>         }
>
> -       if (found) {
> +       if (rr) {
>                 rr->rr_where = where;
>                 return 0;
>         }
> @@ -83,18 +82,17 @@ int gfs2_revoke_add(struct gfs2_jdesc *jd, u64 blkno, unsigned int where)
>
>  int gfs2_revoke_check(struct gfs2_jdesc *jd, u64 blkno, unsigned int where)
>  {
> -       struct gfs2_revoke_replay *rr;
> +       struct gfs2_revoke_replay *rr = NULL, *iter;
>         int wrap, a, b, revoke;
> -       int found = 0;
>
> -       list_for_each_entry(rr, &jd->jd_revoke_list, rr_list) {
> -               if (rr->rr_blkno == blkno) {
> -                       found = 1;
> +       list_for_each_entry(iter, &jd->jd_revoke_list, rr_list) {
> +               if (iter->rr_blkno == blkno) {
> +                       rr = iter;
>                         break;
>                 }
>         }
>
> -       if (!found)
> +       if (!rr)
>                 return 0;
>
>         wrap = (rr->rr_where < jd->jd_replay_tail);
> --
> 2.25.1
>

Thanks,
Andreas

