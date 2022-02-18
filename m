Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF544BAFEB
	for <lists+cluster-devel@lfdr.de>; Fri, 18 Feb 2022 03:58:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-ETMv_DjKNUC7nzhUWBq3Sg-1; Thu, 17 Feb 2022 21:58:20 -0500
X-MC-Unique: ETMv_DjKNUC7nzhUWBq3Sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C673F1091DA0;
	Fri, 18 Feb 2022 02:58:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7411061093;
	Fri, 18 Feb 2022 02:58:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10ABF4BB7C;
	Fri, 18 Feb 2022 02:58:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21I2w8aL023163 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 21:58:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 757862024CC9; Fri, 18 Feb 2022 02:58:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7007A2024CC7
	for <cluster-devel@redhat.com>; Fri, 18 Feb 2022 02:58:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64E30100E651
	for <cluster-devel@redhat.com>; Fri, 18 Feb 2022 02:58:05 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-345-fpk63NtPPAKiNKaMMPgbJw-1; Thu, 17 Feb 2022 21:58:03 -0500
X-MC-Unique: fpk63NtPPAKiNKaMMPgbJw-1
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
	[108.7.220.252]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21I2sUcx031678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 17 Feb 2022 21:54:31 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 8A76415C34C8; Thu, 17 Feb 2022 21:54:30 -0500 (EST)
Date: Thu, 17 Feb 2022 21:54:30 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <Yg8KZvDVFJgTXm4C@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com>
MIME-Version: 1.0
In-Reply-To: <Yg0m6IjcNmfaSokM@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [REPORT] kernel BUG at fs/ext4/inode.c:2620 -
	page_buffers()
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 16, 2022 at 04:31:36PM +0000, Lee Jones wrote:
> 
> After recently receiving a bug report from Syzbot [0] which was raised
> specifically against the Android v5.10 kernel, I spent some time
> trying to get to the crux.  Firstly I reproduced the issue on the
> reported kernel, then did the same using the latest release kernel
> v5.16.
> 
> The full kernel trace can be seen below at [1].
> 

Lee, thanks for your work in trimming down the syzkaller reproducer.
The moral equivalent of what it is doing (except each system call is
done in a separate thread, with synchronization so each gets executed
in order, but perhaps on a different CPU) is:

        int dest_fd, src_fd, truncate_fd, mmap_fd;
        pid_t tid;
        struct iovec local_iov, remote_iov;

        dest_fd = open("./bus", O_RDWR|O_CREAT|O_NONBLOCK|O_SYNC|
                       O_DIRECT|O_LARGEFILE|O_NOATIME, 0);
        src_fd = openat(AT_FDCWD, "/bin/bash", O_RDONLY);
        truncate_fd = syscall(__NR_open, "./bus", O_RDWR|O_CREAT|O_SYNC|O_NOATIME|O_ASYNC);
        ftruncate(truncate_fd, 0x2008002ul);
        mmap((void *) 0x20000000ul /* addr */, 0x600000ul /* length */,
             PROT_WRITE|PROT_EXEC|PROT_SEM||0x7ffff0, MAP_FIXED|MAP_SHARED, mmap_fd, 0);
        sendfile(dest_fd, src_fd, 0 /* offset */, 0x80000005ul /* count */);
        local_iov.iov_base = (void *) 0x2034afa4;
        local_iov.iov_len = 0x1f80;
        remote_iov.iov_base = (void *) 0x20000080;
        remote_iov.iov_len = 0x2034afa5;
        process_vm_writev(gettid(), &local_iov, 1, &remote_iov, 1, 0);
        sendfile(dest_fd, src_fd, 0 /* offset */, 0x1f000005ul /* count */);

Which is then executed repeataedly over and over again.  (With the
file descriptors closed at each loop, so the file is reopened each time.)

So basically, we have a scratch file which is initialized using an
sendfile using O_DIRECT.  The scratch file is also mmap'ed into the
process's address space, and we then *modify* that an mmap'ed reagion
using process_vm_writev() --- and this is where the problem starts.

process_vm_writev() uses [un]pin_user_pages_remote() which is the same
interface uses for RDMA.  But it's not clear this is ever supposed to
work for memory which is mmap'ed region backed by a file.
pin_user_pages_remote() appears to assume that it is an anonymous
region, since the get_user_pages functions in mm/gup.c don't call
read_page() to read data into any pages that might not be mmaped in.

They also don't follow the mm / file system protocol of calling the
file system's write_begin() or page_mkwrite() before modifying a page,
and so when when process_vm_writev() calls unpin_user_pages_remote(),
this tries to dirty the page, but since page_mkwrite() or
write_begin() hasn't been called, buffers haven't been attached to the
page, and so that triggers the following ext4 WARN_ON:

[ 1451.095939] WARNING: CPU: 1 PID: 449 at fs/ext4/inode.c:3565 ext4_set_page_dirty+0x48/0x50
  ...
[ 1451.139877] Call Trace:
[ 1451.140833]  <TASK>
[ 1451.141889]  folio_mark_dirty+0x2f/0x60
[ 1451.143408]  set_page_dirty_lock+0x3e/0x60
[ 1451.145130]  unpin_user_pages_dirty_lock+0x108/0x130
[ 1451.147405]  process_vm_rw_single_vec.constprop.0+0x1b9/0x260
[ 1451.150135]  process_vm_rw_core.constprop.0+0x156/0x280
[ 1451.159576]  process_vm_rw+0xc4/0x110


Then when ext4_writepages() gets called, we trigger the BUG because
buffers haven't been attached to the page.  We can certainly avoid the
BUG by checking to see if buffers are attached first, and if not, skip
writing the page trigger a WARN_ON, and then forcibly clear the page
dirty flag so don't permanently leak memory and allow the file system
to be unmounted.  (Note: we can't fix the problem by attaching the
buffers in set_page_dirty(), since is occasionally called under
spinlocks and without the page being locked, so we can't do any kind
of allocation, so ix-nay on calling create_empty_buffers() which calls
alloc_buffer_head().)

BUT, that is really papering over the problem, since it's not clear
it's valid to try to use get_user_pages() and friends (including
[un]pin_user_pages_remote() on file-backed memory.

And if it is supposed to be valid, then mm/gup.c needs to first call
readpage() if the page is not present, so that if process_vm_writev()
is only modifying a few bytes in the mmap'ed region, we need to fault
in the page first, and then mm/gup.c needs to inform the file system
to make sure that if pinned memory region is not yet allocated, than
whatever needs to happen to allocate space, via page_mkwrite() has
taken place.  (And by the way, that means that pin_user_pages_remote()
may need to return ENOSPC if there is not free space in the file
system, and hence ENOSPC may need to reflected all the way back to
process_vm_writev().

Alternatively, if we don't expect process_vm_writev() to work on
file-backed memory, perhaps it and pin_user_pages_remote() should
return some kind of error?

	    	      	     	    	      - Ted

