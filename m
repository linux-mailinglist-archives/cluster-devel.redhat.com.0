Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 780F3414B33
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Sep 2021 15:55:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632318941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hDqhsx8sqj9mkphU6hCu/Nig6ssAUQvAmrOKyr5itBU=;
	b=UPtGYxHNLJFPpFoEtf5Ar8SePlDO3zY2c1jnDb+VCdTLgfk734YyhrUY8k4U0O20qddcju
	iFgO+OqRd1ynv8qNb7/uCljwb9ukk80ZfiiIUCGKWgSr349r081p60EjdqwIH6gL4VMNxV
	xcRY3nUF3AG6hktaQoc1sgym97ICb/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-FkK5elc7NxmIVpL8EUv-oQ-1; Wed, 22 Sep 2021 09:55:40 -0400
X-MC-Unique: FkK5elc7NxmIVpL8EUv-oQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E09D7100D68B;
	Wed, 22 Sep 2021 13:55:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE5AF19C79;
	Wed, 22 Sep 2021 13:55:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3C734EA2F;
	Wed, 22 Sep 2021 13:55:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18MDtXok026661 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 Sep 2021 09:55:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF757AEC8C; Wed, 22 Sep 2021 13:55:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA181AECA6
	for <cluster-devel@redhat.com>; Wed, 22 Sep 2021 13:55:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E426811E9E
	for <cluster-devel@redhat.com>; Wed, 22 Sep 2021 13:55:04 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-305-6eYxtQATMS2ZX9_Tnab2Ug-1; Wed, 22 Sep 2021 09:55:02 -0400
X-MC-Unique: 6eYxtQATMS2ZX9_Tnab2Ug-1
Received: by mail-wr1-f71.google.com with SMTP id
	s14-20020adff80e000000b001601b124f50so2246343wrp.5
	for <cluster-devel@redhat.com>; Wed, 22 Sep 2021 06:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hDqhsx8sqj9mkphU6hCu/Nig6ssAUQvAmrOKyr5itBU=;
	b=GtUcGJZM8OiYxwO7hJ1lmUr3AA5doFg7R8hK2LSmJY+0jCJpOti0D+eibGw1Dw21rE
	mD0xxewyt61yHjFsZRTxD8gkAMKITX6Dhq3bI7t6xujA4rfGK/PMY4VDrVHjfaR3jNGv
	P8kdc2VSPjBkvzjoQ7G1YgHZ4XgYWkkFtVWEFTlcysbawI+TJk9F4NYKQXhlIPgzUtro
	6xf6OcU9oO7ionAAnaZqq/kaGu4wzEzrVisnjdvz1P5WFnKFIbd7XNCzyPJXhpymCG3Q
	EQ550JOCRnh6f9BBsVIBSSTQE3W9W/IJePSngEMdBDzZo6fIDDV1ZVdIOOyFUKiCuoHy
	q3hg==
X-Gm-Message-State: AOAM532OOjHigglbGTKh6NzqmqIR8xxRqLnbRzmIw0JaRaRClbflKdxQ
	5DpZq9FTIuRMdZtUHpd/naKutP6zi0bw5rjPB2vyUSGN9ES5O0vxx8ibfaynfyJhVQJ4yq/ai8p
	1E2DnjLts8MyG+ynlqBy9ELShxMa4tOVbaBjLfg==
X-Received: by 2002:adf:dcc1:: with SMTP id x1mr42387946wrm.415.1632318901051; 
	Wed, 22 Sep 2021 06:55:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIqMmQTfYRjDwU+7TrMV3lwO2I/KSIKUnvrfKLzbdBgpzgDM92Dp6ADgfriPaYO6gCg84zcHzKDkWB/eRU/T0=
X-Received: by 2002:adf:dcc1:: with SMTP id x1mr42387922wrm.415.1632318900804; 
	Wed, 22 Sep 2021 06:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210916191003.105866-1-rpeterso@redhat.com>
	<20210916191003.105866-7-rpeterso@redhat.com>
	<CAHc6FU5=0U-mv8Jdu+RtJ2DKXCA7q0DPMfwNUGFrd2v_QKDiiw@mail.gmail.com>
	<7c83e1ac-5ec6-b008-51d0-11d978ec642f@redhat.com>
In-Reply-To: <7c83e1ac-5ec6-b008-51d0-11d978ec642f@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 22 Sep 2021 15:54:49 +0200
Message-ID: <CAHc6FU7KBVKQYev8fAuCt5p1ENczHqDdKV96xCKc_p1aowgk+Q@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v2 6/6] gfs2: introduce and use new
 glops go_lock_needed
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

On Wed, Sep 22, 2021 at 2:47 PM Bob Peterson <rpeterso@redhat.com> wrote:
> On 9/22/21 6:57 AM, Andreas Gruenbacher wrote:
> > On Thu, Sep 16, 2021 at 9:11 PM Bob Peterson <rpeterso@redhat.com> wrote:
> >> Before this patch, when a glock was locked, the very first holder on the
> >> queue would unlock the lockref and call the go_lock glops function (if
> >> one exists), unless GL_SKIP was specified. When we introduced the new
> >> node-scope concept, we allowed multiple holders to lock glocks in EX mode
> >> and share the lock, but node-scope introduced a new problem: if the
> >> first holder has GL_SKIP and the next one does NOT, since it is not the
> >> first holder on the queue, the go_lock op was not called.
> >
> > We use go_lock to (re)validate inodes (for inode glocks) and to read
> > in bitmaps (for resource group glocks). I can see how calling go_lock
> > was originally tied to the first lock holder, but GL_SKIP already
> > broke the simple model that the first holder will call go_lock. The
> > go_lock_needed callback only makes things worse yet again,
> > unfortunately.
>
> In what way does go_lock_needed make things worse?

It adds an indirection that papers over the fact that the existing
abstraction (first holder calls go_lock) doesn't make sense.

> > How about we introduce a new GLF_REVALIDATE flag that indicates that
> > go_lock needs to be called? The flag would be set when instantiating a
> > new glock and when dequeuing the last holder, and cleared in go_lock
> > (and in gfs2_inode_refresh for GL_SKIP holders). I'm not sure if
>
> That was my original design, and it makes the most sense. I named the
> flag GLF_GO_LOCK_SKIPPED, but essentially the same thing. Unfortunately,
> I ran into all kinds of problems implementing it. In those patches,
> first holders would either call glops->go_lock() or set
> GLF_GO_LOCK_SKIPPED. Once the go_lock function was complete, it cleared
> GLF_GO_LOCK_SKIPPED, and called wake_up_bit. Secondary holders did
> wait_on_bit and waited for the other process's go_lock to complete.

Just set the flag when we know the glock needs revalidation. There are
two possible points in time for doing that: either when we're locking
the first holder, or when the glock is new / the last holder is
dequeued. Then, we can handle clearing the flag and races among
multiple go_lock instances in the go_lock handlers.

> But I had tons of problems getting this to work properly. Processes
> would hang and deadlock for seemingly no reason. Finally I got
> frustrated and sought other solutions.
>
> I'm willing to try to resurrect that patch set and try again. Maybe you
> can help me figure out what I'm doing wrong and why it's not working.
>
> Bob Peterson
>
> > GLF_REVALIDATE can fully replace GIF_INVALID as well, but it looks
> > like it at first glance.
> >
> > Thanks,
> > Andreas
>

Thanks,
Andreas

