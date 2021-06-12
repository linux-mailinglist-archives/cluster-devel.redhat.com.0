Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7633A50C4
	for <lists+cluster-devel@lfdr.de>; Sat, 12 Jun 2021 23:08:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-tUjDqgtMNba2Ghy__MnkPQ-1; Sat, 12 Jun 2021 17:08:41 -0400
X-MC-Unique: tUjDqgtMNba2Ghy__MnkPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D26C21084F44;
	Sat, 12 Jun 2021 21:08:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 970DA5D6B1;
	Sat, 12 Jun 2021 21:08:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60CAE46F81;
	Sat, 12 Jun 2021 21:08:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15CL5o88005239 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 12 Jun 2021 17:05:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E309F11301DC; Sat, 12 Jun 2021 21:05:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEA0111301DB
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 21:05:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11719185A7B9
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 21:05:47 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-545-z2zI1x84Noi9B3G3YlkUAQ-1; Sat, 12 Jun 2021 17:05:42 -0400
X-MC-Unique: z2zI1x84Noi9B3G3YlkUAQ-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lsAp2-007R1x-4p; Sat, 12 Jun 2021 21:05:40 +0000
Date: Sat, 12 Jun 2021 21:05:40 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YMUhpI/ZIuxvKCt8@zeniv-ca.linux.org.uk>
References: <20210531170123.243771-1-agruenba@redhat.com>
	<20210531170123.243771-5-agruenba@redhat.com>
	<CAHk-=wiB9gvUsebmiOaRXzYVUxJDUt1SozGtRyxR_MDR=Nv7YQ@mail.gmail.com>
	<CAHc6FU4n_F9sPjP7getGRKLpB-KsZt_qhHctqwY5pJrxGxLr2w@mail.gmail.com>
	<YMOOZsBzg/6SKSzT@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YMOOZsBzg/6SKSzT@zeniv-ca.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 11, 2021 at 04:25:10PM +0000, Al Viro wrote:
> On Wed, Jun 02, 2021 at 01:16:32PM +0200, Andreas Gruenbacher wrote:
> 
> > Well, iomap_file_buffered_write() does that by using
> > iov_iter_fault_in_readable() and iov_iter_copy_from_user_atomic() as
> > in iomap_write_actor(), but the read and direct I/O side doesn't seem
> > to have equivalents. I suspect we can't just wrap
> > generic_file_read_iter() and iomap_dio_rw() calls in
> > pagefault_disable().
> 
> And it will have zero effect on O_DIRECT case, so you get the same
> deadlocks right back.  Because there you hit
> 	iomap_dio_bio_actor()
> 		bio_iov_iter_get_pages()
> 			....
> 				get_user_pages_fast()
> 					....
> 						faultin_page()
> 							handle_mm_fault()
> and at no point had CPU hit an exception, so disable_pagefault() will
> have no effect whatsoever.  You can bloody well hit gfs2 readpage/mkwrite
> if the destination is in mmapped area of some GFS2 file.  Do that
> while holding GFS2 locks and you are fucked.
> 
> No amount of prefaulting will protect you, BTW - it might make the
> deadlock harder to reproduce, but that's it.

AFAICS, what we have is
	* handle_mm_fault() can hit gfs2_fault(), which grabs per-inode lock
shared
	* handle_mm_fault() for write can hit gfs2_page_mkwrite(), which grabs
per-inode lock exclusive
	* pagefault_disable() prevents that for real page faults, but not for
get_user_pages_fast()
	* normal write:
        with inode_lock(inode)
		in a loop
			with per-inode lock exclusive
				__gfs2_iomap_get
				possibly gfs2_iomap_begin_write
				in a loop
					fault-in [read faults]
					iomap_write_begin
					copy_page_from_iter_atomic() [pf disabled]
					iomap_write_end
				gfs2_iomap_end
	* O_DIRECT write:
	with inode_lock(inode) and per-inode lock deferred (?)
		in a loop
			__gfs2_iomap_get
			possibly gfs2_iomap_begin_write
			bio_iov_iter_get_pages(), map and submit [gup]
			gfs2_iomap_end
	* normal read:
		in a loop
			filemap_get_pages (grab pages and readpage them if needed)
			copy_page_to_iter() for each [write faults]
	* O_DIRECT read:
        with per-inode lock deferred
		in a loop
			__gfs2_iomap_get
			either iov_iter_zero() (on hole) [write faults]
			or bio_iov_iter_get_pages(), map and submit [gup]
			gfs2_iomap_end

... with some amount of waiting on buffered IO in case of O_DIRECT writes

Is the above an accurate description of the mainline situation there?
In particular, normal read doesn't seem to bother with locks at all.
What exactly are those cluster locks for in O_DIRECT read?

