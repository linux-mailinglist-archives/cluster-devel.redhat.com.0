Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 728F110B33F
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Nov 2019 17:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574872203;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rcyN5dGoMhhF+8wU9SDW3LRuwC7oWgcs+VV9XVwODaY=;
	b=bcLAjKN91FSJ1rHg5yhRpZKfVZNgJFhOXNr5euTCSDrNU8EjgKzbCBugY4/VImxabF9QIz
	hVGt6IGYWENE6WfIZu0Yhm9P+/8U8Hn6RobWx0SSCfryqJ2DdLzCjVotyY7Ynd4kVEcS4R
	OLl2FkLe1fdit31/JGm14widmrRWeZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-LAhKg-AMM1q80m6yizwXbw-1; Wed, 27 Nov 2019 11:30:01 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D13BDBFE;
	Wed, 27 Nov 2019 16:29:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EA18600CC;
	Wed, 27 Nov 2019 16:29:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E7C24BB65;
	Wed, 27 Nov 2019 16:29:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xARGTrdB007792 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Nov 2019 11:29:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0216F20316E0; Wed, 27 Nov 2019 16:29:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1F4120316DF
	for <cluster-devel@redhat.com>; Wed, 27 Nov 2019 16:29:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 844F080209E
	for <cluster-devel@redhat.com>; Wed, 27 Nov 2019 16:29:50 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-316-cWAh3jKjOEmim2nxO-pTcw-1; Wed, 27 Nov 2019 11:29:48 -0500
Received: by mail-ot1-f69.google.com with SMTP id h15so12143699otr.11
	for <cluster-devel@redhat.com>; Wed, 27 Nov 2019 08:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kIu1VyYGNbaIKqeZUoUtiDvput7821e7oFhQavConxk=;
	b=ePyAD8OjQS0tuKZdXaBQyoXeHapamKytJPTthMVKiXUpA0s6DVpaxfn1H5iy8vRSWk
	633xjNrwnoQt2jts6448Qqy8pEe6HSBO0RfwTtTLKlMZW4H1qljY+QFqQcSuIQmTERkk
	6keWIo9WiAtkTrTBLUmYnKVDaMfEoQma5E2cNMksfT+tRw/HbnnlQqTWHAFBge+gKz+Z
	53uGMlK6lVktpsva172tkwWXdwqYZl/ldhAeENd9+k5okPOl1lEop2OtYSbky/KJ+LH7
	VnM9VhnvNZKrTIKNTGCZaCQvmiEMFAQbtyDwe6RYmQnZXQPVR7TeXZADnY9QQtUooqIz
	CCNw==
X-Gm-Message-State: APjAAAWcOanjC2JJ8UMzN+AubSTYFYuv53AomLGcScuWS9AM0M035+tU
	U2QWwKAmxu06Hw4gdb4Z+KIR83eTsF1QKWb2xTCiquPcR7YPW6Q5vdOV1osrC+0R7wuskT+2bcK
	QLepERR0x5h2M673e6yf59KaJO4A8dviqs6T0eA==
X-Received: by 2002:aca:d14:: with SMTP id 20mr4877838oin.178.1574872187661;
	Wed, 27 Nov 2019 08:29:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3yLKNT7wsw1AqyVf2knKKoyFNMFDOQF5O+7hYYWvVBZw57Km8zJVbATfvGULvCZMZmqbPRh8opF4b2Zj5pdE=
X-Received: by 2002:aca:d14:: with SMTP id 20mr4877821oin.178.1574872187328;
	Wed, 27 Nov 2019 08:29:47 -0800 (PST)
MIME-Version: 1.0
References: <157225677483.3442.4227193290486305330.stgit@buzz>
	<20191028124222.ld6u3dhhujfqcn7w@box>
	<CAHk-=wgQ-Dcs2keNJPovTb4gG33M81yANH6KZM9d5NLUb-cJ1g@mail.gmail.com>
	<20191028125702.xdfbs7rqhm3wer5t@box>
	<ac83fee6-9bcd-8c66-3596-2c0fbe6bcf96@yandex-team.ru>
	<CAHk-=who0HS=NT8U7vFDT7er_CD7+ZreRJMxjYrRXs5G6dbpyw@mail.gmail.com>
	<f0140b13-cca2-af9e-eb4b-82eda134eb8f@redhat.com>
	<CAHk-=wh4SKRxKQf5LawRMSijtjRVQevaFioBK+tOZAVPt7ek0Q@mail.gmail.com>
	<640bbe51-706b-8d9f-4abc-5f184de6a701@redhat.com>
	<CAHpGcM+o2OwXdrj+A2_OqRg6YokfauFNiBJF-BQp0dJFvq_BrQ@mail.gmail.com>
	<22f04f02-86e4-b379-81c8-08c002a648f0@redhat.com>
	<CAHk-=whRuPkm7zFUiGe_BXkLvEdShZGngkb=uRufgU65ogCxfg@mail.gmail.com>
	<cdd48a4d-42a4-dd15-2701-e08e26fef17f@redhat.com>
In-Reply-To: <cdd48a4d-42a4-dd15-2701-e08e26fef17f@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 27 Nov 2019 17:29:36 +0100
Message-ID: <CAHc6FU4Mx_=qMYOBc0VYdn-paFXKVffq=k72LCJgTWONv9chng@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-MC-Unique: cWAh3jKjOEmim2nxO-pTcw-1
X-MC-Unique: LAhKg-AMM1q80m6yizwXbw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xARGTrdB007792
X-loop: cluster-devel@redhat.com
Cc: Steve French <sfrench@samba.org>,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	=?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Linux-MM <linux-mm@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Cluster-devel] [PATCH] mm/filemap: do not allocate cache pages
 beyond end of file at read
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2019 at 4:42 PM Steven Whitehouse <swhiteho@redhat.com> wro=
te:
> Hi,
>
> On 25/11/2019 17:05, Linus Torvalds wrote:
> > On Mon, Nov 25, 2019 at 2:53 AM Steven Whitehouse <swhiteho@redhat.com>=
 wrote:
> >> Linus, is that roughly what you were thinking of?
> > So the concept looks ok, but I don't really like the new flags as they
> > seem to be gfs2-specific rather than generic.
> >
> > That said, I don't _gate_ them either, since they aren't in any
> > critical code sequence, and it's not like they do anything really odd.
> >
> > I still think the whole gfs2 approach is broken. You're magically ok
> > with using stale data from the cache just because it's cached, even if
> > another client might have truncated the file or something.
>
> If another node tries to truncate the file, that will require an
> exclusive glock, and in turn that means the all the other nodes will
> have to drop their glock(s) shared or exclusive. That process
> invalidates the page cache on those nodes, such that any further
> requests on those nodes will find the cache empty and have to call into
> the filesystem.
>
> If a page is truncated on another node, then when the local node gives
> up its glock, after any copying (e.g. for read) has completed then the
> truncate will take place. The local node will then have to reread any
> data relating to new pages or return an error in case the next page to
> be read has vanished due to the truncate. It is a pretty small window,
> and the advantage is that in cases where the page is in cache, we can
> directly use the cached page without having to call into the filesystem
> at all. So it is page atomic in that sense.
>
> The overall aim here is to avoid taking (potentially slow) cluster locks
> when at all possible, yet at the same time deliver close to local fs
> semantics whenever we can. You can think of GFS2's glock concept (at
> least as far as the inodes we are discussing here) as providing a
> combination of (page) cache control and cluster (dlm) locking.
>
> >
> > So you're ok with saying "the file used to be X bytes in size, so
> > we'll just give you this data because we trust that the X is correct".
> >
> > But you're not ok to say "oh, the file used to be X bytes in size, but
> > we don't want to give you a short read because it might not be correct
> > any more".
> >
> > See the disconnect? You trust the size in one situation, but not in ano=
ther one.
>
> Well we are not trusting the size at all... the original algorithm
> worked entirely off "is this page in cache and uptodate?" and for
> exactly the reason that we know the size in the inode might be out of
> date, if we are not currently holding a glock in either shared or
> exclusive mode. We also know that if there is a page in cache and
> uptodate then we must be holding the glock too.
>
>
> >
> > I also don't really see that you *need* the new flag at all. Since
> > you're doing to do a speculative read and then a real read anyway, and
> > since the only thing that you seem to care about is the file size
> > (because the *data* you will trust if it is cached), then why don't
> > you just use the *existing* generic read, and *IFF* you get a
> > truncated return value, then you go and double-check that the file
> > hasn't changed in size?
> >
> > See what I'm saying? I think gfs2 is being very inconsistent in when
> > it trusts the file size, and I don't see that you even need the new
> > behavior that patch gives, because you might as well just use the
> > existing code (just move the i_size check earlier, and then teach gfs2
> > to double-check the "I didn't get as much as I expected" case).

We can identify short reads, but we won't get information about
readahead back from generic_file_read_iter or filemap_fault. We could
try to work around this with filesystem specific flags for ->readpage
and ->readpages, but that would break down with multiple concurrent
readers in addition to being a real mess. I'm currently out of better
ideas that avoid duplicating the generic code.

> >                   Linus
>
> I'll leave the finer details to Andreas here, since it is his patch, and
> hopefully we can figure out a good path forward. We are perhaps also a
> bit reluctant to go off and (nearly) duplicate code that is already in
> the core vfs library functions, since that often leads to things getting
> out of sync (our implementation of ->writepages is one case where that
> happened in the past) and missing important bug fixes/features in some
> cases. Hopefully though we can iterate on this a bit and come up with
> something which will resolve all the issues,
>
> Steve.

Thanks,
Andreas


