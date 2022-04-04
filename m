Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC24D4F17C4
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 16:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649084362;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UTGtn1rG1oHnPf4jWqsoBHgFGHb3FmEXtAlPLct00TQ=;
	b=bZsDsYtOvviFaGzeYAeyeADTKF48qQ853DZd0N/NTJeg1GHAYfrqjgU77ynRAswSFrYQJR
	IHqrle+SfZz+xAKbvo95d7xT7QZg/dsgj2fptmOJI5Ze3j178JrNVHuJcrQy/zWOXQAaUM
	q7bnwQPPuZCTtP/mDnRJl23WWNSp2Po=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-v0sEl_vzOLuEqXv23OSm5w-1; Mon, 04 Apr 2022 10:59:19 -0400
X-MC-Unique: v0sEl_vzOLuEqXv23OSm5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3271D2800F60;
	Mon,  4 Apr 2022 14:59:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D934400E871;
	Mon,  4 Apr 2022 14:59:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D03B91940367;
	Mon,  4 Apr 2022 14:59:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E4B2519451EF for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 14:59:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D011163A5D; Mon,  4 Apr 2022 14:59:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CACC7637A3
 for <cluster-devel@redhat.com>; Mon,  4 Apr 2022 14:59:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9CE0185A7A4
 for <cluster-devel@redhat.com>; Mon,  4 Apr 2022 14:59:07 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-Ane-LNSiOnaaE5rmQmGqCw-1; Mon, 04 Apr 2022 10:59:06 -0400
X-MC-Unique: Ane-LNSiOnaaE5rmQmGqCw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l7-20020a05600c1d0700b0038c9c48f1e7so7044331wms.2
 for <cluster-devel@redhat.com>; Mon, 04 Apr 2022 07:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UTGtn1rG1oHnPf4jWqsoBHgFGHb3FmEXtAlPLct00TQ=;
 b=rKCAkoSvXxAGlbFI5Vb2hHinsWo8lVrWOLsjALren2nOPbkzTbHrfuFWbm0naGdcbb
 gn3npHTg544geYvjCSEPc08hPjR5ingQap9ZDL6h7GBJbAvznoG0HTMDhKGPDZK9XHTn
 YMbImREUx4yf8AFrkrkbHZv+/HbixvEim8WOQABp2xlWOwbCVqrqIuvPe5ikSiMeWgN+
 q7vKWn6fG0hs8kdjzc1Opzcq/bwNA7MbNu5X8cj+yvX8fLlP7ImotJMX/dZ/k3Zo1B0k
 EA+7bTBd0UBY7RN3Gdn5AnZjUDY0/QVAJWDdHPaRQMDjpvgIYuOygGmaYmknLGaKN89z
 LqQw==
X-Gm-Message-State: AOAM5325Z2d4RHZHaaEeoOsJrDtDx7DV7dzOfuHgSLXykJclw2ugswcb
 JEQZy4yftHoN5ZSil9gbCKkM4nqjhAynSpWjjqY/+7n10dLpLafE2j7PlEO23Vy4e1cD+TER/50
 vQJypKxXQvSKGXXnruFqQe8aGvqRHVpC5kY7IHQ==
X-Received: by 2002:a7b:cbc1:0:b0:38e:7c42:fe38 with SMTP id
 n1-20020a7bcbc1000000b0038e7c42fe38mr972396wmi.51.1649084345329; 
 Mon, 04 Apr 2022 07:59:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuYUVoq7tbnpe6v2K8Vg+lD8MBTb279vFZsP129/zboUn+PR7U05cmYuZ6pqPwC3hRYGrFm8x2cCpEeiOz8+E=
X-Received: by 2002:a7b:cbc1:0:b0:38e:7c42:fe38 with SMTP id
 n1-20020a7bcbc1000000b0038e7c42fe38mr972374wmi.51.1649084345107; Mon, 04 Apr
 2022 07:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220331223857.902911-1-jakobkoschel@gmail.com>
In-Reply-To: <20220331223857.902911-1-jakobkoschel@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 4 Apr 2022 16:58:53 +0200
Message-ID: <CAHc6FU4s952rPPsceefvZER8dPM9RVWyQrmneMyqaW_0oViFSA@mail.gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 1/2] gfs2: remove usage of list iterator
 variable for list_for_each_entry_continue()
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Jakob,

On Fri, Apr 1, 2022 at 12:40 AM Jakob Koschel <jakobkoschel@gmail.com> wrote:
> In preparation to limiting the scope of a list iterator to the list
> traversal loop, use a dedicated pointer to iterate through the list [1].
>
> Since that variable should not be used past the loop iteration, a
> separate variable is used to 'remember the current location within the
> loop'.
>
> To either continue iterating from that position or start a new
> iteration (if the previous iteration was complete) list_prepare_entry()
> is used.

I can see how accessing an iterator variable past a for_each_entry
loop will cause problems when it ends up pointing at the list head.
Here, the iterator variables are not accessed outside the loops at
all, though. So this patch is ugly, and it doesn't even help.

> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  fs/gfs2/lops.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index 6ba51cbb94cf..74e6d05cee2c 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -653,7 +653,7 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
>                                 bool is_databuf)
>  {
>         struct gfs2_log_descriptor *ld;
> -       struct gfs2_bufdata *bd1 = NULL, *bd2;
> +       struct gfs2_bufdata *bd1 = NULL, *bd2, *tmp1, *tmp2;
>         struct page *page;
>         unsigned int num;
>         unsigned n;
> @@ -661,7 +661,7 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
>
>         gfs2_log_lock(sdp);
>         list_sort(NULL, blist, blocknr_cmp);
> -       bd1 = bd2 = list_prepare_entry(bd1, blist, bd_list);
> +       tmp1 = tmp2 = list_prepare_entry(bd1, blist, bd_list);

We should actually be using list_entry() here, not list_prepare_entry().

>         while(total) {
>                 num = total;
>                 if (total > limit)
> @@ -675,14 +675,18 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
>                 ptr = (__be64 *)(ld + 1);
>
>                 n = 0;
> +               bd1 = list_prepare_entry(tmp1, blist, bd_list);
> +               tmp1 = NULL;
>                 list_for_each_entry_continue(bd1, blist, bd_list) {
>                         *ptr++ = cpu_to_be64(bd1->bd_bh->b_blocknr);
>                         if (is_databuf) {
>                                 gfs2_check_magic(bd1->bd_bh);
>                                 *ptr++ = cpu_to_be64(buffer_escaped(bd1->bd_bh) ? 1 : 0);
>                         }
> -                       if (++n >= num)
> +                       if (++n >= num) {
> +                               tmp1 = bd1;
>                                 break;
> +                       }
>                 }
>
>                 gfs2_log_unlock(sdp);
> @@ -690,6 +694,8 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
>                 gfs2_log_lock(sdp);
>
>                 n = 0;
> +               bd2 = list_prepare_entry(tmp2, blist, bd_list);
> +               tmp2 = NULL;
>                 list_for_each_entry_continue(bd2, blist, bd_list) {
>                         get_bh(bd2->bd_bh);
>                         gfs2_log_unlock(sdp);
> @@ -712,8 +718,10 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
>                                 gfs2_log_write_bh(sdp, bd2->bd_bh);
>                         }
>                         gfs2_log_lock(sdp);
> -                       if (++n >= num)
> +                       if (++n >= num) {
> +                               tmp2 = bd2;
>                                 break;
> +                       }
>                 }
>
>                 BUG_ON(total < num);
>
> base-commit: f82da161ea75dc4db21b2499e4b1facd36dab275
> --
> 2.25.1
>

Thanks,
Andreas

