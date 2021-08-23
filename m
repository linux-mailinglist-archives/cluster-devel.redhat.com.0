Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EF2053F467E
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Aug 2021 10:15:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629706511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sAS3UII3BoCLendYghwp+E5/qpLsis2DFPR6GELCxPg=;
	b=JKO8dSMf4ZMtaQby6VaPJeJKqwpOYuQbTqh6j4bvaadw/IDDP1tdJHaHM0Xi2i46PZfRL/
	viQZRAUDYF649NOsRdXEkoiaiVwmMuHJDgxW4aKPI8QYhlJMaLUUM+clU07vJVMPA0PJp7
	GtgrtO9eZdqFtSTWar1VI5NMXCp0Z6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-SOjCJU0APX2ykIGUw9fpyg-1; Mon, 23 Aug 2021 04:15:09 -0400
X-MC-Unique: SOjCJU0APX2ykIGUw9fpyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7140887D54F;
	Mon, 23 Aug 2021 08:15:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B80260CCC;
	Mon, 23 Aug 2021 08:15:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CC6E181A0F7;
	Mon, 23 Aug 2021 08:15:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17N8Ev0r013875 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Aug 2021 04:14:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 193B92157F48; Mon, 23 Aug 2021 08:14:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 147D02157F47
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 08:14:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86454800B28
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 08:14:54 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-426-fxQa5_eAN7OWr9H4WeafTA-1; Mon, 23 Aug 2021 04:14:53 -0400
X-MC-Unique: fxQa5_eAN7OWr9H4WeafTA-1
Received: by mail-wm1-f70.google.com with SMTP id
	r125-20020a1c2b830000b0290197a4be97b7so4172258wmr.9
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 01:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=sAS3UII3BoCLendYghwp+E5/qpLsis2DFPR6GELCxPg=;
	b=UJgvltAVFcecMCHco/g4bRbLPgZXiCf4Yjo6lUO2yX0NpBi700bQ+xpw32+bT2PiOz
	6q9aODO0ByJv+uT+2djKQiIuLXFmbwn4lQTs1CZMLPe/rkI9MFV/vlq9ddovrXRQ/vtv
	yTR2gj4Phk5c/twCLPd2oZ1wnsosOINbgK8dcBzgBfvuSUxpfqBAAMLhlI+u627uto4L
	uPCXFPSpuVNCfMctSu8YhB1/vXQZ8Es1beaC/TAGlwXxPihT5Gcg60INUsvfm75LhQAo
	/d7ulCy2Y+z5D2NiJAbVxtpD/wlv8eXQqjMClTK6U4xDREGvTQk7+ZATDyIt0onF11M9
	B69g==
X-Gm-Message-State: AOAM531nK4OBfBhvE4uF4Qf8WavPJHzPyzLPpSxjj4ZoINKQa03RD0Dl
	Z/Q52JT6vA4rW55AkPp7EdKe+L9TYaQcyre3zh79XLgfXHhB/wLJLYyYSQJLkcETTsjbiDShDHl
	ukrl77B24a7Cvwuob1i2oIA==
X-Received: by 2002:adf:e910:: with SMTP id f16mr6700309wrm.393.1629706491883; 
	Mon, 23 Aug 2021 01:14:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9tWYyiX6YvxpM93MetANrNoX2lZvyAZMJH8SnDUJVD31ZiO7K1OFWJvibdiL9k2vCA5llew==
X-Received: by 2002:adf:e910:: with SMTP id f16mr6700299wrm.393.1629706491736; 
	Mon, 23 Aug 2021 01:14:51 -0700 (PDT)
Received: from
	0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
	(0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
	[2001:8b0:ffda:0:2059:8730:b2:c370])
	by smtp.gmail.com with ESMTPSA id
	f2sm14085343wru.31.2021.08.23.01.14.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Aug 2021 01:14:51 -0700 (PDT)
Message-ID: <8e2ab23b93c96248b7c253dc3ea2007f5244adee.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>, Bob Peterson
	<rpeterso@redhat.com>
Date: Mon, 23 Aug 2021 09:14:50 +0100
In-Reply-To: <CAHc6FU7EMOEU7C5ryu5pMMx1v+8CTAOMyGdf=wfaw8=TTA_btQ@mail.gmail.com>
References: <20210819194102.1491495-1-agruenba@redhat.com>
	<20210819194102.1491495-11-agruenba@redhat.com>
	<5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
	<cf284633-a9db-9f88-6b60-4377bc33e473@redhat.com>
	<CAHc6FU7EMOEU7C5ryu5pMMx1v+8CTAOMyGdf=wfaw8=TTA_btQ@mail.gmail.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>, "Darrick
	J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v6 10/19] gfs2: Introduce flag for glock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-08-20 at 17:22 +0200, Andreas Gruenbacher wrote:
> On Fri, Aug 20, 2021 at 3:11 PM Bob Peterson <rpeterso@redhat.com>
> wrote:
> > 
[snip]
> > 
> > You can almost think of this as a performance enhancement. This
> > concept
> > allows a process to hold a glock for much longer periods of time,
> > at a
> > lower priority, for example, when gfs2_file_read_iter needs to hold
> > the
> > glock for very long-running iterative reads.
> 
> Consider a process that allocates a somewhat large buffer and reads
> into it in chunks that are not page aligned. The buffer initially
> won't be faulted in, so we fault in the first chunk and write into
> it.
> Then, when reading the second chunk, we find that the first page of
> the second chunk is already present. We fill it, set the
> HIF_MAY_DEMOTE flag, fault in more pages, and clear the
> HIF_MAY_DEMOTE
> flag. If we then still have the glock (which is very likely), we
> resume the read. Otherwise, we return a short result.
> 
> Thanks,
> Andreas
> 

If the goal here is just to allow the glock to be held for a longer
period of time, but with occasional interruptions to prevent
starvation, then we have a potential model for this. There is
cond_resched_lock() which does this for spin locks. So perhaps we might
do something similar:

/**
 * gfs2_glock_cond_regain - Conditionally drop and regain glock
 * @gl: The glock
 * @gh: A granted holder for the glock
 *
 * If there is a pending demote request for this glock, drop and 
 * requeue a lock request for this glock. If there is no pending
 * demote request, this is a no-op. In either case the glock is
 * held on both entry and exit.
 *
 * Returns: 0 if no pending demote, 1 if lock dropped and regained
 */
int gfs2_glock_cond_regain(struct gfs2_glock *gl, struct gfs2_holder
*gh);

That seems more easily understood, and clearly documents places where
the lock may be dropped and regained. I think that the implementation
should be simpler and cleaner, compared with the current proposed
patch. There are only two bit flags related to pending demotes, for
example, so the check should be trivial.

It may need a few changes depending on the exact circumstances, but
hopefully that illustrates the concept,

Steve.



