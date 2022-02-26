Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA43E4C5321
	for <lists+cluster-devel@lfdr.de>; Sat, 26 Feb 2022 02:48:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-xsZTEfJJPHO9M32c3bbd5w-1; Fri, 25 Feb 2022 20:48:34 -0500
X-MC-Unique: xsZTEfJJPHO9M32c3bbd5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27930801AAD;
	Sat, 26 Feb 2022 01:48:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FFF58F7DA;
	Sat, 26 Feb 2022 01:48:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 829B41D8C;
	Sat, 26 Feb 2022 01:48:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21Q1fbJG011794 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 25 Feb 2022 20:41:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E7EBE2166B17; Sat, 26 Feb 2022 01:41:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E39962166B13
	for <cluster-devel@redhat.com>; Sat, 26 Feb 2022 01:41:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D004B185A7A4
	for <cluster-devel@redhat.com>; Sat, 26 Feb 2022 01:41:32 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-127-knxdgcSiMKqbwQEZm6VWUQ-1; Fri, 25 Feb 2022 20:41:31 -0500
X-MC-Unique: knxdgcSiMKqbwQEZm6VWUQ-1
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
	[108.7.220.252]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21Q1eagt021711
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 25 Feb 2022 20:40:36 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 0635415C0038; Fri, 25 Feb 2022 20:40:36 -0500 (EST)
Date: Fri, 25 Feb 2022 20:40:36 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <YhmFFMwvOaMiNBTQ@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com> <Yhks88tO3Em/G370@mit.edu>
	<YhlBUCi9O30szf6l@sol.localdomain> <YhlFRoJ3OdYMIh44@mit.edu>
	<YhlIvw00Y4MkAgxX@mit.edu>
	<2f9933b3-a574-23e1-e632-72fc29e582cf@nvidia.com>
	<YhlkcYjozFmt3Kl4@mit.edu>
	<303059e6-3a33-99cb-2952-82fe8079fa45@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <303059e6-3a33-99cb-2952-82fe8079fa45@nvidia.com>
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
Cc: linux-xfs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [PATCH -v3] ext4: don't BUG if kernel
 subsystems dirty pages without asking ext4 first
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

On Fri, Feb 25, 2022 at 04:41:14PM -0800, John Hubbard wrote:
> 
> > f2fs and btrfs's compressed file write support, by making things work
> > much like the write(2) system call.  Imagine if we had a
> > "pin_user_pages_local()" which calls write_begin(), and a
> > "unpin_user_pages_local()" which calls write_end(), and the
> 
> Right, that would supply the missing connection to the filesystems.
> 
> In fact, maybe these names about right:
> 
>     pin_user_file_pages()
>     unpin_user_file_pages()
> 
> ...and then put them in a filesystem header file, because these are now
> tightly coupled to filesystems, what with the need to call
> .write_begin() and .write_end().

Well, that makes it process_vm_writev()'s is that it needs to know
when to call pin_user_file_pages().  I suspect that for many use cases
--- for example, if this is being used by a debugger to modify a
variable on a stack, or an anonymous page in the program's data
segment, process_vm_writev() *isn't* actually pinning a file.  So they
want some kind of interface that automatically DTRT regardless of
whether the user pages being edited are file-backed or not
file-backed.

So some kind of [un]pin_user_pages_local() which will call
write_{begin,end}() if necessary would be the most convenient for
users such as process_vm_writev().   

And perhaps would it make sense for pin_user_pages to optionally (or
by default?) check for file-backed pages, and if it finds any, return
an error or stop pinning pages at that point, so the system call can
return EOPNOSUPP to the user, instead of silently causing user data to
be lost or corrupted as is currently the case with xfs and btrfs (and
ext4 once I patch it so it doesn't BUG).

I'll note that at least one caller of pin_user_pages, in fs/io_uring.c
takes it upon itself to check for file-backed pages, and returns
EOPNOTSUPP if there are any found.  Many that should be lifted to
pin_user_pages()?

For that matter, maybe pin_user_pages() and friends should take some
new FOLL_ flags to indicate whether file-backed pages should be
rejected, or perhaps they can promise they will only be holding the
pin for a very short amount of time (FOLL_SHORTERM?), and then
pin_user_pages() and unpin_user_pages() can automagically call
write_begin() and write_end() if necessary?  I dunno....

	      	  	      	 	       - Ted

