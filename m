Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EDC4C22A6
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Feb 2022 04:50:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-oXcU4_D4MFqKQFmyELfU_A-1; Wed, 23 Feb 2022 22:50:51 -0500
X-MC-Unique: oXcU4_D4MFqKQFmyELfU_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 810D91091DA0;
	Thu, 24 Feb 2022 03:50:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F6D10074E0;
	Thu, 24 Feb 2022 03:50:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6F774A701;
	Thu, 24 Feb 2022 03:50:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21O3oaij025029 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 22:50:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DAE06492D55; Thu, 24 Feb 2022 03:50:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6B2A492D48
	for <cluster-devel@redhat.com>; Thu, 24 Feb 2022 03:50:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD08A811E75
	for <cluster-devel@redhat.com>; Thu, 24 Feb 2022 03:50:36 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-197-PLO5or-kOIG-suV-Siv4Ow-1; Wed, 23 Feb 2022 22:50:31 -0500
X-MC-Unique: PLO5or-kOIG-suV-Siv4Ow-1
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
	[108.7.220.252]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21O3o9DG002766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 23 Feb 2022 22:50:10 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 2BFEF15C0036; Wed, 23 Feb 2022 22:50:09 -0500 (EST)
Date: Wed, 23 Feb 2022 22:50:09 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <YhcAcfY1pZTl3sId@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com>
	<82d0f4e4-c911-a245-4701-4712453592d9@nvidia.com>
	<Yg8bxiz02WBGf6qO@mit.edu> <Yg9QGm2Rygrv+lMj@kroah.com>
	<YhbE2nocBMtLc27C@mit.edu>
	<20220224014842.GM59715@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20220224014842.GM59715@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 24, 2022 at 12:48:42PM +1100, Dave Chinner wrote:
> > Fair enough; on the other hand, we could also view this as making ext4
> > more robust against buggy code in other subsystems, and while other
> > file systems may be losing user data if they are actually trying to do
> > remote memory access to file-backed memory, apparently other file
> > systems aren't noticing and so they're not crashing.
> 
> Oh, we've noticed them, no question about that.  We've got bug
> reports going back years for systems being crashed, triggering BUGs
> and/or corrupting data on both XFS and ext4 filesystems due to users
> trying to run RDMA applications with file backed pages.

Is this issue causing XFS to crash?  I didn't know that.

I tried the Syzbot reproducer with XFS mounted, and it didn't trigger
any crashes.  I'm sure data was getting corrupted, but I figured I
should bring ext4 to the XFS level of "at least we're not reliably
killing the kernel".

On ext4, an unprivileged process can use process_vm_writev(2) to crash
the system.  I don't know how quickly we can get a fix into mm/gup.c,
but if some other kernel path tries calling set_page_dirty() on a
file-backed page without first asking permission from the file system,
it seems to be nice if the file system doesn't BUG() --- as near as I
can tell, xfs isn't crashing in this case, but ext4 is.

					- Ted

