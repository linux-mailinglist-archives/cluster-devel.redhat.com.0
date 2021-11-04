Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 036704459A9
	for <lists+cluster-devel@lfdr.de>; Thu,  4 Nov 2021 19:23:14 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-PAXc5iXlNVmPjSO826FCEA-1; Thu, 04 Nov 2021 14:23:10 -0400
X-MC-Unique: PAXc5iXlNVmPjSO826FCEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FE6F101872E;
	Thu,  4 Nov 2021 18:23:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 409781007625;
	Thu,  4 Nov 2021 18:23:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CAB94A703;
	Thu,  4 Nov 2021 18:23:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A4IMt9M010640 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Nov 2021 14:22:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 210F940CFD10; Thu,  4 Nov 2021 18:22:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BDB440CFD0A
	for <cluster-devel@redhat.com>; Thu,  4 Nov 2021 18:22:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0061D802E5E
	for <cluster-devel@redhat.com>; Thu,  4 Nov 2021 18:22:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-143-gV2fdMLNPEKCrSjIndMl5w-1;
	Thu, 04 Nov 2021 14:22:51 -0400
X-MC-Unique: gV2fdMLNPEKCrSjIndMl5w-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A5C161212;
	Thu,  4 Nov 2021 18:22:47 +0000 (UTC)
Date: Thu, 4 Nov 2021 18:22:44 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YYQk9L0D57QHc0gE@arm.com>
References: <20211102122945.117744-1-agruenba@redhat.com>
	<20211102122945.117744-5-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211102122945.117744-5-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	joey.gouly@arm.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Paul Mackerras <paulus@ozlabs.org>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v9 04/17] iov_iter: Turn
 iov_iter_fault_in_readable into fault_in_iov_iter_readable
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 02, 2021 at 01:29:32PM +0100, Andreas Gruenbacher wrote:
> Turn iov_iter_fault_in_readable into a function that returns the number
> of bytes not faulted in, similar to copy_to_user, instead of returning a
> non-zero value when any of the requested pages couldn't be faulted in.
> This supports the existing users that require all pages to be faulted in
> as well as new users that are happy if any pages can be faulted in.
> 
> Rename iov_iter_fault_in_readable to fault_in_iov_iter_readable to make
> sure this change doesn't silently break things.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
[...]
> diff --git a/mm/filemap.c b/mm/filemap.c
> index ff34f4087f87..4dd5edcd39fd 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3757,7 +3757,7 @@ ssize_t generic_perform_write(struct file *file,
>  		 * same page as we're writing to, without it being marked
>  		 * up-to-date.
>  		 */
> -		if (unlikely(iov_iter_fault_in_readable(i, bytes))) {
> +		if (unlikely(fault_in_iov_iter_readable(i, bytes))) {
>  			status = -EFAULT;
>  			break;
>  		}

Now that fault_in_iov_iter_readable() returns the number of bytes, we
could change the above test to:

		if (unlikely(fault_in_iov_iter_readable(i, bytes) == bytes)) {

Assuming we have a pointer 'a', accessible, and 'a + PAGE_SIZE' unmapped:

	write(fd, a + PAGE_SIZE - 1, 2);

can still copy one byte but it returns -EFAULT instead since the second
page is not accessible.

While writing some test-cases for MTE (sub-page faults, 16-byte
granularity), we noticed that reading 2 bytes from 'a + 15' with
'a + 16' tagged for faulting:

	write(fd, a + 15, 2);

succeeds as long as 'a + 16' is not at a page boundary. Checking against
'bytes' above makes this consistent.

The downside is that it's an ABI change though not sure anyone is
relying on it.

-- 
Catalin

