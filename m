Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E6D973A4674
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Jun 2021 18:25:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-IVoSTdcEPDizAqm-OCqjNg-1; Fri, 11 Jun 2021 12:25:26 -0400
X-MC-Unique: IVoSTdcEPDizAqm-OCqjNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D571D1084F40;
	Fri, 11 Jun 2021 16:25:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE8AE5D9C6;
	Fri, 11 Jun 2021 16:25:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20CDB1809CAD;
	Fri, 11 Jun 2021 16:25:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BGPIV1017879 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 12:25:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28C8321231C9; Fri, 11 Jun 2021 16:25:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2352221231C0
	for <cluster-devel@redhat.com>; Fri, 11 Jun 2021 16:25:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 833B2863739
	for <cluster-devel@redhat.com>; Fri, 11 Jun 2021 16:25:15 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-286-O8EqriS4PEudRU5ndXQEbQ-1; Fri, 11 Jun 2021 12:25:13 -0400
X-MC-Unique: O8EqriS4PEudRU5ndXQEbQ-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lrjy2-006zhk-Gb; Fri, 11 Jun 2021 16:25:10 +0000
Date: Fri, 11 Jun 2021 16:25:10 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YMOOZsBzg/6SKSzT@zeniv-ca.linux.org.uk>
References: <20210531170123.243771-1-agruenba@redhat.com>
	<20210531170123.243771-5-agruenba@redhat.com>
	<CAHk-=wiB9gvUsebmiOaRXzYVUxJDUt1SozGtRyxR_MDR=Nv7YQ@mail.gmail.com>
	<CAHc6FU4n_F9sPjP7getGRKLpB-KsZt_qhHctqwY5pJrxGxLr2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU4n_F9sPjP7getGRKLpB-KsZt_qhHctqwY5pJrxGxLr2w@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 02, 2021 at 01:16:32PM +0200, Andreas Gruenbacher wrote:

> Well, iomap_file_buffered_write() does that by using
> iov_iter_fault_in_readable() and iov_iter_copy_from_user_atomic() as
> in iomap_write_actor(), but the read and direct I/O side doesn't seem
> to have equivalents. I suspect we can't just wrap
> generic_file_read_iter() and iomap_dio_rw() calls in
> pagefault_disable().

And it will have zero effect on O_DIRECT case, so you get the same
deadlocks right back.  Because there you hit
	iomap_dio_bio_actor()
		bio_iov_iter_get_pages()
			....
				get_user_pages_fast()
					....
						faultin_page()
							handle_mm_fault()
and at no point had CPU hit an exception, so disable_pagefault() will
have no effect whatsoever.  You can bloody well hit gfs2 readpage/mkwrite
if the destination is in mmapped area of some GFS2 file.  Do that
while holding GFS2 locks and you are fucked.

No amount of prefaulting will protect you, BTW - it might make the
deadlock harder to reproduce, but that's it.

