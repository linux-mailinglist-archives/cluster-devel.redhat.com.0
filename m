Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 516BE44981C
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Nov 2021 16:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636385152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=LfjtZ7lkNCfutxEoxq1FroT5giN5zH7FzEK8LvUQ9GU=;
	b=G7FIsd2CBGODRR9r5XvnwHfAUkI5bixPDV6vGZ88NqHAltgnJnZencsDKuH8gkSTwHzemi
	Foc5Ygs8Crr6xFf9YF9Ctp3KpMMOqvY6InewPWpbI7S68XCvZTj7wtT0cWgobgooVuSLVa
	11/+kPqwy9IPGIi+bWaoq3hVyS1TNQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-HpjhIGxqOg63hyjio7ka6A-1; Mon, 08 Nov 2021 10:25:51 -0500
X-MC-Unique: HpjhIGxqOg63hyjio7ka6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 950F487D543;
	Mon,  8 Nov 2021 15:25:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 010E2641A7;
	Mon,  8 Nov 2021 15:25:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F2E0180BAD2;
	Mon,  8 Nov 2021 15:25:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A8FPgwT030837 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Nov 2021 10:25:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3AEC12026D67; Mon,  8 Nov 2021 15:25:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 363952026D60
	for <cluster-devel@redhat.com>; Mon,  8 Nov 2021 15:25:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E378A1161A60
	for <cluster-devel@redhat.com>; Mon,  8 Nov 2021 15:25:34 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-374-UlAIH6mCOG-seKQUdxLI-g-1; Mon, 08 Nov 2021 10:25:33 -0500
X-MC-Unique: UlAIH6mCOG-seKQUdxLI-g-1
Received: by mail-wr1-f70.google.com with SMTP id
	z5-20020a5d6405000000b00182083d7d2aso4146417wru.13
	for <cluster-devel@redhat.com>; Mon, 08 Nov 2021 07:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LfjtZ7lkNCfutxEoxq1FroT5giN5zH7FzEK8LvUQ9GU=;
	b=nHoazb7IQ6nuqhBpeS2m/H/1hWyfaFRetd96D79fjEvM8Aef2+hjoQ/oca0VMbXHYU
	GVAochbnO0J1HCr5vknE1AcAKOjr5MWvGgDibRfgD1bA/XlFYYsINenozPowB7vbYuJx
	bZ4C10lc+CwPtP+205HYDBrBMmN461AD19Oh+uIsbCcG4BXWE8uwZQpAYTIb3t68dExl
	D0H61cU7vMA58rgZQgCb+dwDjqBOPnwkyW5mnZc0Sk4kfKPifswQiLyRds/YE63Lt+Cn
	2CP54qokvJdABXdWRc7OGPSxXvLHf4l+GsCJ1E5ksqJMmcVTl/wuJoKTPW3OY22/vfPb
	mXrw==
X-Gm-Message-State: AOAM530PJAeW+b2P6fHNtu9bJ3XO5/3YQWbs2VJPjVfQvCDydbxNP1PD
	gyY+jMPYP6IDPoHlcvtNBNw831oCGc5Oot4k/0riHbEIt+nTfHQSh//WUGdVmdKmR3/WX+ylWEh
	k0x/iCjM9UP7KYbJKxW6DUtYv5mmW9vnUUm/QEQ==
X-Received: by 2002:a5d:628f:: with SMTP id k15mr583868wru.363.1636385132222; 
	Mon, 08 Nov 2021 07:25:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy763gJG9fr1rvt4lkafYdTT5en2/gu00D6uOrffAvMRvN6ec7lSnwAErJxLzP6yPx+UNlU7u9k9NsTE8fCem4=
X-Received: by 2002:a5d:628f:: with SMTP id k15mr583834wru.363.1636385132057; 
	Mon, 08 Nov 2021 07:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20211108145506.GA10167@kili>
In-Reply-To: <20211108145506.GA10167@kili>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 8 Nov 2021 16:25:20 +0100
Message-ID: <CAHc6FU65ZYMfG3bUO-shvQbsRfFzB3vRx4GsZ9pZaB0Bs_YTwg@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [bug report] gfs2: Introduce flag for glock
 holder auto-demotion
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

Hi Dan,

On Mon, Nov 8, 2021 at 3:55 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Hello Bob Peterson,
>
> The patch dc732906c245: "gfs2: Introduce flag for glock holder
> auto-demotion" from Aug 19, 2021, leads to the following Smatch
> static checker warning:
>
>         fs/gfs2/glock.c:421 demote_incompat_holders()
>         warn: iterator 'gh->gh_list.next' changed during iteration
>
> fs/gfs2/glock.c
>     411 static void demote_incompat_holders(struct gfs2_glock *gl,
>     412                                     struct gfs2_holder *new_gh)
>     413 {
>     414         struct gfs2_holder *gh;
>     415
>     416         /*
>     417          * Demote incompatible holders before we make ourselves eligible.
>     418          * (This holder may or may not allow auto-demoting, but we don't want
>     419          * to demote the new holder before it's even granted.)
>     420          */
> --> 421         list_for_each_entry(gh, &gl->gl_holders, gh_list) {
>     422                 /*
>     423                  * Since holders are at the front of the list, we stop when we
>     424                  * find the first non-holder.
>     425                  */
>     426                 if (!test_bit(HIF_HOLDER, &gh->gh_iflags))
>     427                         return;
>     428                 if (test_bit(HIF_MAY_DEMOTE, &gh->gh_iflags) &&
>     429                     !may_grant(gl, new_gh, gh)) {
>     430                         /*
>     431                          * We should not recurse into do_promote because
>     432                          * __gfs2_glock_dq only calls handle_callback,
>     433                          * gfs2_glock_add_to_lru and __gfs2_glock_queue_work.
>     434                          */
>     435                         __gfs2_glock_dq(gh);
>                                 ^^^^^^^^^^^^^^^^^^^^
> This calls list_del_init(&gh->gh_list); which sets the ->next pointer.
> So I think that means we could hit a forever loop situation looking for
> the original &gl->gl_holders list head.
>
> Should it use list_for_each_entry_safe()?

that's exactly right. Thanks for catching this!

Andreas

