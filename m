Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1DD4C503E
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Feb 2022 21:57:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-onp-czoVPZyRwOcfhJ9OpA-1; Fri, 25 Feb 2022 15:57:49 -0500
X-MC-Unique: onp-czoVPZyRwOcfhJ9OpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A8C3801DDC;
	Fri, 25 Feb 2022 20:57:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD7F693250;
	Fri, 25 Feb 2022 20:57:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE81F4A701;
	Fri, 25 Feb 2022 20:57:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21PKvbQY014595 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 25 Feb 2022 15:57:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 62F61492C14; Fri, 25 Feb 2022 20:57:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F0B1401E58
	for <cluster-devel@redhat.com>; Fri, 25 Feb 2022 20:57:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 444961C0515C
	for <cluster-devel@redhat.com>; Fri, 25 Feb 2022 20:57:37 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-9-yEBmB03uPTWElyO9YAhZWw-1; Fri, 25 Feb 2022 15:57:33 -0500
X-MC-Unique: yEBmB03uPTWElyO9YAhZWw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 96DCAB83377;
	Fri, 25 Feb 2022 20:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF336C340E7;
	Fri, 25 Feb 2022 20:51:29 +0000 (UTC)
Date: Fri, 25 Feb 2022 12:51:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Ts'o" <tytso@mit.edu>
Message-ID: <YhlBUCi9O30szf6l@sol.localdomain>
References: <Yg0m6IjcNmfaSokM@google.com>
 <Yhks88tO3Em/G370@mit.edu>
MIME-Version: 1.0
In-Reply-To: <Yhks88tO3Em/G370@mit.edu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [PATCH -v2] ext4: don't BUG if kernel
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 25, 2022 at 02:24:35PM -0500, Theodore Ts'o wrote:
> [un]pin_user_pages_remote is dirtying pages without properly warning
> the file system in advance (or faulting in the file data if the page
> is not yet in the page cache).  This was noted by Jan Kara in 2018[1]
> and more recently has resulted in bug reports by Syzbot in various
> Android kernels[2].
> 
> This is technically a bug in the mm/gup.c codepath, but arguably ext4
> is fragile in that a buggy get_user_pages() implementation causes ext4
> to crash, where as other file systems are not crashing (although in
> some cases the user data will be lost since gup code is not properly
> informing the file system to potentially allocate blocks or reserve
> space when writing into a sparse portion of file).  I suspect in real
> life it is rare that people are using RDMA into file-backed memory,
> which is why no one has complained to ext4 developers except fuzzing
> programs.
> 
> So instead of crashing with a BUG, issue a warning (since there may be
> potential data loss) and just mark the page as clean to avoid
> unprivileged denial of service attacks until the problem can be
> properly fixed.  More discussion and background can be found in the
> thread starting at [2].
> 
> [1] https://www.spinics.net/lists/linux-mm/msg142700.html

Can you use a lore link
(https://lore.kernel.org/linux-mm/20180103100430.GE4911@quack2.suse.cz/T/#u)?

> +			/*
> +			 * Should never happen but for buggy code in
> +			 * other subsystemsa that call

subsystemsa => subsystems

> +			 * set_page_dirty() without properly warning
> +			 * the file system first.  See [1] for more
> +			 * information.
> +			 *
> +			 * [1] https://www.spinics.net/lists/linux-mm/msg142700.html

Likewise, lore link here.

- Eric

