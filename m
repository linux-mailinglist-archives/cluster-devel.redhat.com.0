Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DA1443A5726
	for <lists+cluster-devel@lfdr.de>; Sun, 13 Jun 2021 10:44:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623573894;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FHEEdqa7cqln4XKJYtrL82d5dzyuGs+JlNcccHmAJK4=;
	b=Mv4ljPxRP4EObR5P4m++sfORhguvzrUQ5/DSrguEXtDzvmaIqaRT4ZYStDlEYeDlv9WOEe
	wgug3IVZ7N6ZNJh9IMacXH7r0Jb6Y8QDvymRI+p9JESQe4TszaOLaZ7WpaFHc1iz+J7GQ8
	t47+UAn3UZKJMMBk883qbzskxaW0SaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-YzQdME3TPKmrd1GszU2XJQ-1; Sun, 13 Jun 2021 04:44:53 -0400
X-MC-Unique: YzQdME3TPKmrd1GszU2XJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DB668049C5;
	Sun, 13 Jun 2021 08:44:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F2205D9D3;
	Sun, 13 Jun 2021 08:44:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7B5046F81;
	Sun, 13 Jun 2021 08:44:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15D8idSi004881 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 13 Jun 2021 04:44:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CCAB44029; Sun, 13 Jun 2021 08:44:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07D2B44027
	for <cluster-devel@redhat.com>; Sun, 13 Jun 2021 08:44:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 452AF185A79C
	for <cluster-devel@redhat.com>; Sun, 13 Jun 2021 08:44:36 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-152-OsuhBjV_Od6ONiDKIkLikg-1; Sun, 13 Jun 2021 04:44:34 -0400
X-MC-Unique: OsuhBjV_Od6ONiDKIkLikg-1
Received: by mail-wr1-f70.google.com with SMTP id
	y12-20020adffa4c0000b0290119c11bd29eso2638918wrr.2
	for <cluster-devel@redhat.com>; Sun, 13 Jun 2021 01:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=FHEEdqa7cqln4XKJYtrL82d5dzyuGs+JlNcccHmAJK4=;
	b=Rn6KIh0mdI5Miu7hIMs+/TRgtdrMP0slMlYIrk272K8v7yfDWzAnNH3EEfdTzpJUQj
	uqVYkiX94FW1qdPitDMtRWGN5ucmQ4D54KL/Kcj13OTJ46NqiiydgllJKQFe3nCZHwZO
	SO3Iyer2yNW/SHA1pzLTRDfduJ8FXCAR4xJjaUnq4QWYojXV/whOmR1JDhnfgutQy+Q/
	20tHs9rC56H5brBALQAozjidWbET90Re8ybSPTPsbzhOCvdK266BeLbXAORry1weDF+p
	+t1nenkaMnaoLji/aEqy1gS/xQRDRd+q5l1FxDAYW1GPUGqK9gNCbmTuEmWhqrB3XoyH
	G/Kg==
X-Gm-Message-State: AOAM531Ur+igVQJmF/3A0SkLKg6EsPPGjEikkPhrVNhjDRq3GNAppXIB
	lTP8UjJIOlMxnUIkzennOS9bG3VjCEAQ2ov9qxxsRP7kEeBJMwaGjJn+ZXiT7yaV4DI5epp/9g0
	buIlqcbVGHjxfa4WtAvOwdw==
X-Received: by 2002:a5d:4689:: with SMTP id u9mr12894321wrq.31.1623573873475; 
	Sun, 13 Jun 2021 01:44:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPV5Df5jlQniyi+mEa+LESxC0jsxbRNrsfkQ0E+V2REF6TTCGUK0DwVzr+uD6OmWQlwPAVMQ==
X-Received: by 2002:a5d:4689:: with SMTP id u9mr12894306wrq.31.1623573873233; 
	Sun, 13 Jun 2021 01:44:33 -0700 (PDT)
Received: from
	0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
	(0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
	[2001:8b0:ffda:0:2059:8730:b2:c370])
	by smtp.gmail.com with ESMTPSA id
	k42sm19768540wms.0.2021.06.13.01.44.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Jun 2021 01:44:32 -0700 (PDT)
Message-ID: <3ae2eac460c27a9f58a1b89b49da710c0c9d43ed.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Al Viro <viro@zeniv.linux.org.uk>, Andreas Gruenbacher
	<agruenba@redhat.com>
Date: Sun, 13 Jun 2021 09:44:31 +0100
In-Reply-To: <YMUokdiLMIpr8ee/@zeniv-ca.linux.org.uk>
References: <20210531170123.243771-1-agruenba@redhat.com>
	<20210531170123.243771-5-agruenba@redhat.com>
	<CAHk-=wiB9gvUsebmiOaRXzYVUxJDUt1SozGtRyxR_MDR=Nv7YQ@mail.gmail.com>
	<CAHc6FU4n_F9sPjP7getGRKLpB-KsZt_qhHctqwY5pJrxGxLr2w@mail.gmail.com>
	<YMOOZsBzg/6SKSzT@zeniv-ca.linux.org.uk>
	<YMUhpI/ZIuxvKCt8@zeniv-ca.linux.org.uk>
	<YMUokdiLMIpr8ee/@zeniv-ca.linux.org.uk>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>, Linus
Subject: Re: [Cluster-devel] [RFC 4/9] gfs2: Fix mmap + page fault deadlocks
 (part 1)
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
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 2021-06-12 at 21:35 +0000, Al Viro wrote:
> On Sat, Jun 12, 2021 at 09:05:40PM +0000, Al Viro wrote:
> 
> > Is the above an accurate description of the mainline situation
> > there?
> > In particular, normal read doesn't seem to bother with locks at
> > all.
> > What exactly are those cluster locks for in O_DIRECT read?
> 
> BTW, assuming the lack of contention, how costly is
> dropping/regaining
> such cluster lock?
> 

The answer is that it depends...

The locking modes for glocks for inodes look like this:

==========      ==========   ==============   ==========   ==============
Glock mode      Cache data   Cache Metadata   Dirty Data   Dirty Metadata
==========      ==========   ==============   ==========   ==============
    UN             No              No             No            No
    SH             Yes             Yes            No            No
    DF             No              Yes            No            No
    EX             Yes             Yes            Yes           Yes
==========      ==========   ==============   ==========   ==============

The above is a copy & paste from Documentation/filesystems/gfs2-
glocks.rst. If you think of these locks as cache control, then it makes
a lot more sense.

The DF (deferred) mode is there only for DIO. It is a shared lock mode
that is incompatible with the normal SH mode. That is because it is ok
to cache data pages under SH but not under DF. That the only other
difference between the two shared modes. DF is used for both read and
write under DIO meaning that it is possible for multiple nodes to read
& write the same file at the same time with DIO, leaving any
synchronisation to the application layer. As soon as one performs an
operation which alters the metadata tree (truncate, extend, hole
filling) then we drop back to the normal EX mode, so DF is only used
for preallocated files.

Your original question though was about the cost of locking, and there
is a wide variation according to circumstances. The glock layer caches
the results of the DLM requests and will continue to hold glocks gained
from remote nodes until either memory pressure or requests to drop the
lock from another node is received.

When no other nodes are interested in a lock, all such cluster lock
activity is local. There is a cost to it though, and if (for example)
you tried to take and drop the cluster lock on every page, that would
definitely be noticeable. There are probably optimisations that could
be done on what is quite a complex code path, but in general thats what
we've discovered from testing. The introduction of ->readpages() vs the
old ->readpage() made a measurable difference and likewise on the write
side, iomap has also show performance increases due to the reduction in
locking on multi-page writes.

If there is another node that has an interest in a lock, then it can
get very expensive in terms of latency to regain a lock. To drop the
lock to a lower mode may involve I/O (from EX mode) and journal
flush(es) and to get the lock back again involves I/O to other nodes
and then a wait while they finish what they are doing. To avoid
starvation there is a "minimum hold time" so that when a node gains a
glock, it is allowed to retain it, in the absence of local requests,
for a short period. The idea being that if a large number of glock
requests are being made on a node, each for a short time, we allow
several of those to complete before we do the expensive glock release
to another node.

See Documentation/filesystems/gfs2-glocks.rst for a longer explanation
and locking order/rules between different lock types,

Steve.


