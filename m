Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A51FA3FE380
	for <lists+cluster-devel@lfdr.de>; Wed,  1 Sep 2021 22:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630526575;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=bFy1F+QsYxR5COx5bC/TDu7Bi/by603yH1cn5pidm4Q=;
	b=PcExKEgSla5aWXK1EK2QvotCrD49r/VEtf+GsawwtYjCYdwP1urdwLFEpHgQQiSM4LFP2U
	51OvQCAXvxzpn2DJFMLJTpQj2ZO09VNDEGn7khobH9h+P/2Eee3XHJ3GCoJ6iJ4vz9o+6g
	xf26V9jBJP5Lav4ADPrjlhiqob78Lno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-1BwiZSifOtuU2W6h-KlhVA-1; Wed, 01 Sep 2021 16:02:54 -0400
X-MC-Unique: 1BwiZSifOtuU2W6h-KlhVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B381D188E3C2;
	Wed,  1 Sep 2021 20:02:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAF465C23A;
	Wed,  1 Sep 2021 20:02:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7CBD1809C98;
	Wed,  1 Sep 2021 20:02:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 181JrD1Y023569 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 1 Sep 2021 15:53:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12BA210E60FC; Wed,  1 Sep 2021 19:53:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E264101461B
	for <cluster-devel@redhat.com>; Wed,  1 Sep 2021 19:53:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85085886483
	for <cluster-devel@redhat.com>; Wed,  1 Sep 2021 19:53:05 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-360-Sd60WpfdOrSlhJlCqqcZYg-1; Wed, 01 Sep 2021 15:53:04 -0400
X-MC-Unique: Sd60WpfdOrSlhJlCqqcZYg-1
Received: by mail-wr1-f72.google.com with SMTP id
	h6-20020a5d4fc6000000b00157503046afso265705wrw.3
	for <cluster-devel@redhat.com>; Wed, 01 Sep 2021 12:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bFy1F+QsYxR5COx5bC/TDu7Bi/by603yH1cn5pidm4Q=;
	b=NtO1GWOXM7/k7+q+MslXpfoLPHwe8pfYLHQhn2ioh+k754nG4hPrl+HgHrc77V07T6
	iXCUjQ3nSZl38RaK8olPFYDdekPXxVKA06Dpb2nW5MAhxSNvUN6SFDA1nOmLkxhMJfZd
	cHwF4H+lDTCW4hkntRSP7sNI1GvCL9R+yLrdD+2Poa1+q5TPlGO1atN2sBa3B6K9myWt
	3DS1vV36T7uqLjnrSjibhPp62m+IW1hxx75kp2c2E7h5tyb/0yxS4NFRaoEjC9UFAQiG
	rwYP/p6l/7WYVhqWcQ8JH7f3cSxEo4Bog0wQDMbE6FRq8LPT9qMjZ/LltSaPgNp6+96N
	uQ7Q==
X-Gm-Message-State: AOAM533jbJY1bPq77/pfrXrOVtijd+2fOtfVPXUB1OhOXjskoG/kSIrV
	5QCDfsJsgyOdAPnXtXUTyDKjHlxBm7v5F2MfPul3yZRLs03Cg3mzLpF4sLkA3LMt1Hvnx6ObIBQ
	WUi2+FpS8xgG5kLVQY2BcflgFK2ZFyXhXoCvdPQ==
X-Received: by 2002:a5d:674b:: with SMTP id l11mr1134424wrw.357.1630525983086; 
	Wed, 01 Sep 2021 12:53:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy13a9+qZa6g03QLR52J8E62dIEzq7mnQQkvBXnCkrMx+s+g3F4vOoKLHB3KfUO0ib83MII2IoHGfd93bk24N8=
X-Received: by 2002:a5d:674b:: with SMTP id l11mr1134407wrw.357.1630525982924; 
	Wed, 01 Sep 2021 12:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<CAHk-=wiUtyoTWuzroNJQwQDM9GHRXvq4974VL=y8T_3tUxDbkA@mail.gmail.com>
In-Reply-To: <CAHk-=wiUtyoTWuzroNJQwQDM9GHRXvq4974VL=y8T_3tUxDbkA@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 1 Sep 2021 21:52:51 +0200
Message-ID: <CAHc6FU7K0Ho=nH6fCK+Amc7zEg2G31v+gE3920ric3NE4MfH=A@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 00/19] gfs2: Fix mmap + page fault
	deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 7:17 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, Aug 27, 2021 at 9:49 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > here's another update on top of v5.14-rc7.  Changes:
> >
> >  * Some of the patch descriptions have been improved.
> >
> >  * Patch "gfs2: Eliminate ip->i_gh" has been moved further to the front.
> >
> > At this point, I'm not aware of anything that still needs fixing,
>
> From a quick scan, I didn't see anything that raised my hackles.

So there's a minor merge conflict between Christoph's iomap_iter
conversion and this patch queue now, and I should probably clarify the
description of "iomap: Add done_before argument to iomap_dio_rw" that
Darrick ran into. Then there are the user copy issues that Al has
pointed out. Fixing those will create superficial conflicts with this
patch queue, but probably nothing serious.

So how should I proceed: do you expect a v8 of this patch queue on top
of the current mainline?

Thanks,
Andreas

