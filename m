Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95944ED2D
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Nov 2021 20:18:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-u6nU71J7O02AZbO4fcqzkQ-1; Fri, 12 Nov 2021 14:18:52 -0500
X-MC-Unique: u6nU71J7O02AZbO4fcqzkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B453CBAF81;
	Fri, 12 Nov 2021 19:18:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 151FB179B3;
	Fri, 12 Nov 2021 19:18:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B3FC181A1CF;
	Fri, 12 Nov 2021 19:18:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ACJG8gl005545 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Nov 2021 14:16:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DCC492156720; Fri, 12 Nov 2021 19:16:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D67752156713
	for <cluster-devel@redhat.com>; Fri, 12 Nov 2021 19:16:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA0D0811E78
	for <cluster-devel@redhat.com>; Fri, 12 Nov 2021 19:16:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-43-QtA-PayLOtaKrQiZJuJT6w-1; 
	Fri, 12 Nov 2021 14:16:02 -0500
X-MC-Unique: QtA-PayLOtaKrQiZJuJT6w-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7138C60F0F;
	Fri, 12 Nov 2021 19:16:00 +0000 (UTC)
Date: Fri, 12 Nov 2021 19:15:57 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YY69bWxs22LNlLs6@arm.com>
References: <20211110174457.533866-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211110174457.533866-1-agruenba@redhat.com>
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
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [RFC] gfs2: Prevent endless loops in
	gfs2_file_buffered_write
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andreas,

On Wed, Nov 10, 2021 at 06:44:57PM +0100, Andreas Gruenbacher wrote:
> in commit 00bfe02f4796 ("gfs2: Fix mmap + page fault deadlocks for
> buffered I/O"), I've managed to introduce a hang in gfs2 due to the
> following check in iomap_write_iter:
> 
>   if (unlikely(fault_in_iov_iter_readable(i, bytes))) {
> 
> which fails if any of the iov iterator cannot be faulted in for reading.
> At the filesystem level, we're retrying the rest of the write if any of
> the iov iterator can be faulted in, so we can end up in a loop without
> ever making progress.  The fix in iomap_write_iter would be as follows:
> 
>   if (unlikely(fault_in_iov_iter_readable(i, bytes) == bytes)) {

My preference would be to check against the 'bytes' returned as above.
This allows the write to progress as much as possible rather than
stopping if any of the iovs cannot be faulted in. It would be more
consistent for MTE as well if we keep the fault-in check at the
beginning of the user buffers only. I mentioned it here:

https://lore.kernel.org/all/YYQk9L0D57QHc0gE@arm.com/

> The same bug exists in generic_perform_write, but I'm not aware of any
> callers of generic_perform_write that have page faults turned off.

Similar reason as above, though one may argue it's a slight ABI change.

> A related post-5.16 option would be to turn the pre-faulting in
> iomap_write_iter and generic_perform_write into post-faulting, but at
> the very least, that still needs a bit of performance analysis:
> 
>   https://lore.kernel.org/linux-fsdevel/20211026094430.3669156-1-agruenba@redhat.com/
>   https://lore.kernel.org/linux-fsdevel/20211027212138.3722977-1-agruenba@redhat.com/

I don't think that's urgent. At least generic_perform_write() will make
progress with a fault-in that checks the beginning of the buffer, even
with sub-page faults. For fault_in_iov_writable() I'll add an arch
callback, probe_user_writable_safe() or something (hopefully next week).

There is the direct I/O case but IIUC the user buffer is accessed via
the kernel mapping (kmap) and that cannot fault on access. I may have
missed something though.

For the search_ioctl() function in btrfs I thought of introducing
fault_in_writable_exact() that checks each sub-page granule in the arch
callback. This shouldn't be used on performance critical paths.

-- 
Catalin

