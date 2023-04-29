Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF4C6F21EE
	for <lists+cluster-devel@lfdr.de>; Sat, 29 Apr 2023 03:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682731243;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=BaIEj2paZYE/uU2XkcW2I8y0R+043vPSdJ9uniAsh0U=;
	b=Eb0FioX4T3OvtHLUC0w2PRAN0dyqYuqpdHTfkKSf6fEwyVoORdr7A8L4dnQfVlXSZRObTp
	kICYr+L/rQ8nnh5iXZVj2ZjTFqtlsAU4sVhKlW73Q81wCqOdFiZ+mdgam39ln2QXFsuEyC
	ACTWDcpPgIg5jDhDM9/sggI3+Wz8tAg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-Cd3N6VfMM2Ouly1V0HnyDA-1; Fri, 28 Apr 2023 21:20:40 -0400
X-MC-Unique: Cd3N6VfMM2Ouly1V0HnyDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F83F1C04B41;
	Sat, 29 Apr 2023 01:20:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 354F61121314;
	Sat, 29 Apr 2023 01:20:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DEDC31946A50;
	Sat, 29 Apr 2023 01:20:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C2A991946A45 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 29 Apr 2023 01:20:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 84B79492C14; Sat, 29 Apr 2023 01:20:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CAD9492C13
 for <cluster-devel@redhat.com>; Sat, 29 Apr 2023 01:20:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E4C5185A78B
 for <cluster-devel@redhat.com>; Sat, 29 Apr 2023 01:20:36 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-IQnbqqlSP2a7X_LHkIAR7Q-1; Fri,
 28 Apr 2023 21:20:33 -0400
X-MC-Unique: IQnbqqlSP2a7X_LHkIAR7Q-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1psZG6-0059h2-19; Sat, 29 Apr 2023 01:20:18 +0000
Date: Sat, 29 Apr 2023 02:20:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZExw0eW52lYj2R1m@casper.infradead.org>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-18-hch@lst.de>
 <ZExgzbBCbdC1y9Wk@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZExgzbBCbdC1y9Wk@bombadil.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 17/17] fs: add CONFIG_BUFFER_HEAD
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Pankaj Raghav <p.raghav@samsung.com>, Jens Axboe <axboe@kernel.dk>,
 David Howells <dhowells@redhat.com>, cluster-devel@redhat.com,
 linux-xfs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 "Darrick J. Wong" <djwong@kernel.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daniel Gomez <da.gomez@samsung.com>, linux-mm@kvack.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 28, 2023 at 05:11:57PM -0700, Luis Chamberlain wrote:
> [   11.245248] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [   11.254581] #PF: supervisor read access in kernel mode
> [   11.257387] #PF: error_code(0x0000) - not-present page
> [   11.260921] PGD 0 P4D 0
> [   11.262600] Oops: 0000 [#1] PREEMPT SMP PTI
> [   11.264993] CPU: 7 PID: 198 Comm: (udev-worker) Not tainted 6.3.0-large-block-20230426 #2
> [   11.269385] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> [   11.275054] RIP: 0010:iomap_page_create.isra.0+0xc/0xd0
> [   11.277924] Code: 41 5e 41 5f c3 cc cc cc cc 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 54 55 48 89 f5 53 <48> 8b 06 48 c1 e8 0d 89 c6 83 e6 01 0f 84 a1 00 00 00 4c 8b 65 28
> [   11.287293] RSP: 0018:ffffb0f0805ef9d8 EFLAGS: 00010293
> [   11.289964] RAX: ffff9de3c1fa8388 RBX: ffffb0f0805efa78 RCX: 000000037ffe0000
> [   11.293212] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000000000d
> [   11.296485] RBP: 0000000000000000 R08: 0000000000021000 R09: ffffffff9c733b20
> [   11.299724] R10: 0000000000000001 R11: 000000000000c000 R12: 0000000000000000
> [   11.302974] R13: ffffffff9be96260 R14: ffffb0f0805efa58 R15: 0000000000000000

RSI is argument 2, which is folio.

Code starting with the faulting instruction
===========================================
   0:	48 8b 06             	mov    (%rsi),%rax
   3:	48 c1 e8 0d          	shr    $0xd,%rax

Looks to me like a NULL folio was passed into iomap_page_create().

> [   11.306206] FS:  00007f03ea8368c0(0000) GS:ffff9de43bdc0000(0000) knlGS:0000000000000000
> [   11.309949] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   11.312464] CR2: 0000000000000000 CR3: 0000000117ec6006 CR4: 0000000000770ee0
> [   11.315442] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   11.318310] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   11.321010] PKRU: 55555554
> [   11.322212] Call Trace:
> [   11.323224]  <TASK>
> [   11.324146]  iomap_readpage_iter+0x96/0x300
> [   11.325694]  iomap_readahead+0x174/0x2d0
> [   11.327129]  read_pages+0x69/0x1f0
> [   11.329751]  page_cache_ra_unbounded+0x187/0x1d0

... that shouldn't be possible.  read_pages() allocates pages, puts them
in the page cache and tells the filesystem to fill them in.

In your patches, did you call mapping_set_large_folios() anywhere?

