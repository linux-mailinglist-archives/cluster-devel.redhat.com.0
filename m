Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6B04C1FD6
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Feb 2022 00:38:28 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-cZYhsINqMTy0sbJdIs6ojA-1; Wed, 23 Feb 2022 18:38:24 -0500
X-MC-Unique: cZYhsINqMTy0sbJdIs6ojA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99115180FD71;
	Wed, 23 Feb 2022 23:38:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1283879C59;
	Wed, 23 Feb 2022 23:38:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC53D4A701;
	Wed, 23 Feb 2022 23:38:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21NNcGc9007592 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 18:38:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 34F602166B4E; Wed, 23 Feb 2022 23:38:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 307DC2166B4A
	for <cluster-devel@redhat.com>; Wed, 23 Feb 2022 23:38:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F9FB185A7A4
	for <cluster-devel@redhat.com>; Wed, 23 Feb 2022 23:38:13 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-140-MIf9aRYtMOmuKRG-ZqgXkQ-1; Wed, 23 Feb 2022 18:38:09 -0500
X-MC-Unique: MIf9aRYtMOmuKRG-ZqgXkQ-1
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
	[108.7.220.252]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21NNZsRH024029
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 23 Feb 2022 18:35:54 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 0E27A15C0036; Wed, 23 Feb 2022 18:35:54 -0500 (EST)
Date: Wed, 23 Feb 2022 18:35:54 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <YhbE2nocBMtLc27C@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com>
	<82d0f4e4-c911-a245-4701-4712453592d9@nvidia.com>
	<Yg8bxiz02WBGf6qO@mit.edu> <Yg9QGm2Rygrv+lMj@kroah.com>
MIME-Version: 1.0
In-Reply-To: <Yg9QGm2Rygrv+lMj@kroah.com>
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
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 18, 2022 at 08:51:54AM +0100, Greg Kroah-Hartman wrote:
> > The challenge is that fixing this "the right away" is probably not
> > something we can backport into an LTS kernel, whether it's 5.15 or
> > 5.10... or 4.19.
> 
> Don't worry about stable backports to start with.  Do it the "right way"
> first and then we can consider if it needs to be backported or not.

Fair enough; on the other hand, we could also view this as making ext4
more robust against buggy code in other subsystems, and while other
file systems may be losing user data if they are actually trying to do
remote memory access to file-backed memory, apparently other file
systems aren't noticing and so they're not crashing.  Issuing a
warning and then not crashing is arguably a better way for ext4 to
react, especially if there are other parts of the kernel that are
randomly calling set_page_dirty() on file-backed memory without
properly first informing the file system in a context where it can
block and potentially do I/O to do things like allocate blocks.

      	  	      	     	      	 - Ted

