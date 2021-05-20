Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 854FF38AC42
	for <lists+cluster-devel@lfdr.de>; Thu, 20 May 2021 13:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621510636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fApY2/CJIX1tFI96hzXYxLzQ0BStaTApGqNhPN+PjZY=;
	b=My6mKMrMqf3kmvFg6XgMTv/CmdXlB+Y0oX3eH25l2NvNPHu1t64hKfV+VIAKcMPTU7ejwX
	VYTePBxAxzKO9N0m5gVR3IRYJeA+8CugawV4RPnFIhET8Z7IN2k0wzyt1ShBJo3YsbgRbl
	NjjIrlvVFJDxrm6hvOufKZUArtis5Us=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-YdLtg77vPH2usHZLlOy0Pw-1; Thu, 20 May 2021 07:37:15 -0400
X-MC-Unique: YdLtg77vPH2usHZLlOy0Pw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F2D3192378E;
	Thu, 20 May 2021 11:37:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C4FA19C59;
	Thu, 20 May 2021 11:37:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BDAA55357;
	Thu, 20 May 2021 11:37:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KBTKkh025643 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 07:29:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30672BC86; Thu, 20 May 2021 11:29:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B36F10FF01
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 11:29:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD27F95F34E
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 11:29:16 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-551-MgispolsN6iCnx7mU9TAmQ-1; Thu, 20 May 2021 07:29:15 -0400
X-MC-Unique: MgispolsN6iCnx7mU9TAmQ-1
Received: by mail-wr1-f69.google.com with SMTP id
	c13-20020a5d6ccd0000b029010ec741b84bso8507421wrc.23
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 04:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fApY2/CJIX1tFI96hzXYxLzQ0BStaTApGqNhPN+PjZY=;
	b=a2z0N7ckz+IspjsHAFgrKVHt3iwL5j4EYsnJRV6gbBrth7WYK19ErFe62KLmYanqmO
	ikh9SbAVGha3igf4n1Jxbwncb24AcUp6QmGVXuYUgq04vDwENMw89ecaT15XwDq1CL5t
	HZzExqekJ3KI9dtYBTTB24PGEO6tP/NWkq5UXX8Uhg7xKH9KK9Fc9euR0jd4MMRIL8of
	T4Nruv2PpwiIK4JB9cZsjGz8mzH8xvZCSMJNgbZ3EZrViigP2zoTB49/fO/npJwkXfk2
	ekvk019ZEpjFcVetj+ZGqblE8IhhvGbdDJbscBqkGS7LWomq05Lbr6XrMGDXrLzUcodr
	UiSA==
X-Gm-Message-State: AOAM5335lEp7EJF8l/4iOMUgrMvKDwcA5g0UR9FDoWh3Yl3Paqh2QMRz
	219o8QG4WxNfYanR2dO6wZajMwwUll7WF3EHAwMDwpx0aiETvloHCgNpvuO0tREaZGWhNy5Yvuz
	f0bQml4RJRTM6ITBwJrdSvF38/5SS1kguj+5jWA==
X-Received: by 2002:adf:e589:: with SMTP id l9mr3891976wrm.361.1621510153897; 
	Thu, 20 May 2021 04:29:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuJsZNK3zu08Ws9lCvd1BVkAGIlYMcVEjOIv5bj7ch735Gnid6Ymu5WOSwbPYZGxsNdrkKZq/r+3iHJThN8k8=
X-Received: by 2002:adf:e589:: with SMTP id l9mr3891964wrm.361.1621510153781; 
	Thu, 20 May 2021 04:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210519060809.1288-1-hdanton@sina.com>
In-Reply-To: <20210519060809.1288-1-hdanton@sina.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 20 May 2021 13:29:02 +0200
Message-ID: <CAHc6FU4iHhbJ-mfOR=sJMNXfMjLLfr7fnrRxQ1cmj9VaT9yQFg@mail.gmail.com>
To: Hillf Danton <hdanton@sina.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, syzkaller-bugs@googlegroups.com,
	LKML <linux-kernel@vger.kernel.org>,
	syzbot <syzbot+34ba7ddbf3021981a228@syzkaller.appspotmail.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: fix uaf in glock shrinker
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, May 19, 2021 at 8:08 AM Hillf Danton <hdanton@sina.com> wrote:
> The GLF_LRU flag is checked under lru_lock in gfs2_glock_remove_from_lru() to
> remove glock from the lru list in __gfs2_glock_put().
>
> On the shrink scan path, the same flag is cleared under lru_lock but because
> of cond_resched_lock(&lru_lock) in gfs2_dispose_glock_lru() progress on the
> put side can be made without deleting glock from lru.
>
> Keep GLF_LRU across the race window opened by cond_resched_lock(&lru_lock) to
> ensure correct behaviors on both sides - clear GLF_LRU after list_del under
> lru_lock. That is the fix to uaf reported by the smart syzbot.

Thanks, I've added this to for-next.

Andreas

