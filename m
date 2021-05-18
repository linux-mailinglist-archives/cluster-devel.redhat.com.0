Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB92387F74
	for <lists+cluster-devel@lfdr.de>; Tue, 18 May 2021 20:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621361885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EEtj3b1h+TVtthMLR2Vm0iC3HKcMa5FleveLxh8rZu8=;
	b=SKlOKkXO6SjT156bpSsgIUPUfKcjicox7eG/Zo/CldKhVKizxeI54zVHC+1/WuKzl+R7c7
	Pt8yC1NUmfK/lYof+EsSmiGFJXFdBaHxGJkwbw5pSjV928VDOYVPURScO7rFEWeTGjtLzY
	So9FZkKoOw/Vctsh+azouf9f0oiJGH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-XlHy0s9IOWaydBHGf2ijRg-1; Tue, 18 May 2021 14:18:03 -0400
X-MC-Unique: XlHy0s9IOWaydBHGf2ijRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6D13101371D;
	Tue, 18 May 2021 18:18:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1C8818E47;
	Tue, 18 May 2021 18:18:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43F9355347;
	Tue, 18 May 2021 18:17:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14IIHsr5012127 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 May 2021 14:17:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2167D208BDCB; Tue, 18 May 2021 18:17:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D326208BDC1
	for <cluster-devel@redhat.com>; Tue, 18 May 2021 18:17:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 997F2101D222
	for <cluster-devel@redhat.com>; Tue, 18 May 2021 18:17:51 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-359-ZShHkUepN0GKIYpnpxeKdQ-1; Tue, 18 May 2021 14:17:49 -0400
X-MC-Unique: ZShHkUepN0GKIYpnpxeKdQ-1
Received: by mail-wm1-f69.google.com with SMTP id
	129-20020a1c02870000b0290176ef5297e3so997091wmc.0
	for <cluster-devel@redhat.com>; Tue, 18 May 2021 11:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EEtj3b1h+TVtthMLR2Vm0iC3HKcMa5FleveLxh8rZu8=;
	b=kNq2WPiiKJOM6Um2ASsiB04nCaKWZIULzY/OM7BA3paxSv2bQwprY6VuQquRsgbaGq
	ifjhwbnEVLS5DHdscgPkByTz3MRpwEWGZDJrqN6Gs6dD3zaZqtBaBADNa1nE2e4GEOUQ
	JwQvYw7dAQ4WPPl7dDj1Choi6DzPi2TxKdq8AdRCHfYbbv8niG1IMLA9TYQVqusjvfOd
	pnYfGBNYd6LMEJAQeBpwOpjf6jEisrwu6COCQFh0WrEsRtVk72+LhQVNGODNWQChRwkF
	DYFod1KftS4bfr4v27obaneh1kpxXjbFWtIMM4C6oLgJBRQ6sGKGRtMc7rlFffsZaYYP
	88UA==
X-Gm-Message-State: AOAM533bpIAh2b++b0HkZzPFvaxeLiEXLBCBezMKYH2xfcflkpE2YPEP
	MLQfLbZib7PejoDaXcAYKQcH2Fq5s556zAHGhgARC0cbMSiLTIAcsokoH1eZ30Q3aop1DWz6VUH
	qKME4on+rk6TDwIk/kk0ulElent6Z6ICMKQXBpQ==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
	m14mr6362254wmq.164.1621361868408; 
	Tue, 18 May 2021 11:17:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4tpMc0UiqFTnD6zHyjW8xwzSKubIEvzJUVyYl99FmY+w/NnEBD4LvzThF6zY7u8mIvEHhYDLFA7ELxxXlu6g=
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
	m14mr6362238wmq.164.1621361868198; 
	Tue, 18 May 2021 11:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000018cf5d05c2949b75@google.com>
	<20210518084625.1200-1-hdanton@sina.com>
In-Reply-To: <20210518084625.1200-1-hdanton@sina.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 18 May 2021 20:17:36 +0200
Message-ID: <CAHc6FU4totOX-S7r3BsZJ+n67MfCgTdC=_DL3XfC4NE0kRZgEw@mail.gmail.com>
To: Hillf Danton <hdanton@sina.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, syzkaller-bugs@googlegroups.com,
	LKML <linux-kernel@vger.kernel.org>,
	syzbot <syzbot+34ba7ddbf3021981a228@syzkaller.appspotmail.com>
Subject: Re: [Cluster-devel] [syzbot] KASAN: use-after-free Read in
	gfs2_glock_shrink_scan
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

Hi,

On Tue, May 18, 2021 at 10:49 AM Hillf Danton <hdanton@sina.com> wrote:
> When put, glock is removed from lru by calling gfs2_glock_remove_from_lru()
> in __gfs2_glock_put(), and check GLF_LRU under lru_lock.
>
> On the shrink scan path, GLF_LRU is cleared under lru_lock but because of
> cond_resched_lock(&lru_lock) in gfs2_dispose_glock_lru() progress on the put
> side can be made without deleting glock from lru.
>
> Keep GLF_LRU across the race window opened by cond_resched_lock(&lru_lock) to
> ensure correct behavior on both sides - clrear GLF_LRU after list_del under
> lru_lock.

can you please resend with a Signed-off-by tag and a valid patch (---
line missing)?

Thanks,
Andreas

> +++ x/fs/gfs2/glock.c
> @@ -1772,6 +1772,7 @@ __acquires(&lru_lock)
>         while(!list_empty(list)) {
>                 gl = list_first_entry(list, struct gfs2_glock, gl_lru);
>                 list_del_init(&gl->gl_lru);
> +               clear_bit(GLF_LRU, &gl->gl_flags);
>                 if (!spin_trylock(&gl->gl_lockref.lock)) {
>  add_back_to_lru:
>                         list_add(&gl->gl_lru, &lru_list);
> @@ -1817,7 +1818,6 @@ static long gfs2_scan_glock_lru(int nr)
>                 if (!test_bit(GLF_LOCK, &gl->gl_flags)) {
>                         list_move(&gl->gl_lru, &dispose);
>                         atomic_dec(&lru_count);
> -                       clear_bit(GLF_LRU, &gl->gl_flags);
>                         freed++;
>                         continue;
>                 }
>

