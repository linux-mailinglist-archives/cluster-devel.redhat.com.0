Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32070D268
	for <lists+cluster-devel@lfdr.de>; Tue, 23 May 2023 05:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684812681;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=/hND79jypjGMxrh+L0AHfmoXlB7jfnZF846f0hmvk3s=;
	b=RXo3F29p829BTUVfATvrUx2YD+r8nxLCyV4mCK77kF13DA27HEmVH1Y5A3gIUyc4OI7dJC
	YEocgrb9KaOME8Z2iFv5b6v2Zk11Pkedgx6WZpvh1Cl0jQCq7Iwmw85kO0lsG1xTqICG/V
	XrvSkXSpA9OGFCTTA/iZzjzUaAKLZho=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-1NZuMaXvOnOID4d7ZlehIQ-1; Mon, 22 May 2023 23:31:18 -0400
X-MC-Unique: 1NZuMaXvOnOID4d7ZlehIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4EB885A5B5;
	Tue, 23 May 2023 03:31:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FF59140E961;
	Tue, 23 May 2023 03:31:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F138B19465B1;
	Tue, 23 May 2023 03:31:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2230F1946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 May 2023 03:31:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 01AD8C1ED9A; Tue, 23 May 2023 03:31:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDBF3C1ED99
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 03:31:12 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D14D5185A78E
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 03:31:12 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-391-yrYVVlOOOz2Wk50H7F6mWg-1; Mon,
 22 May 2023 23:31:10 -0400
X-MC-Unique: yrYVVlOOOz2Wk50H7F6mWg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q1Ijb-009k51-9e; Tue, 23 May 2023 03:30:51 +0000
Date: Tue, 23 May 2023 04:30:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <ZGwza3fdkBHyVG3+@casper.infradead.org>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-9-hch@lst.de>
 <20230523010627.GD11598@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230523010627.GD11598@frogsfrogsfrogs>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH 08/13] iomap: assign
 current->backing_dev_info in iomap_file_buffered_write
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
Cc: NeilBrown <neilb@suse.de>, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Chao Yu <chao@kernel.org>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 22, 2023 at 06:06:27PM -0700, Darrick J. Wong wrote:
> On Fri, May 19, 2023 at 11:35:16AM +0200, Christoph Hellwig wrote:
> > Move the assignment to current->backing_dev_info from the callers into
> > iomap_file_buffered_write to reduce boiler plate code and reduce the
> > scope to just around the page dirtying loop.
> > 
> > Note that zonefs was missing this assignment before.
> 
> I'm still wondering (a) what the hell current->backing_dev_info is for,
> and (b) if we need it around the iomap_unshare operation.
> 
> $ git grep current..backing_dev_info
[results show it only set, never used]
> 
> AFAICT nobody uses it at all?  Unless there's some bizarre user that
> isn't extracting it from @current?
> 
> Oh, hey, new question (c) isn't this set incorrectly for xfs realtime
> files?

Some git archaelogy ...

This was first introduced in commit 2f45a06517a62 (in the
linux-fullhistory tree) in 2002 by one Andrew Morton.  At the time,
it added this check to the page scanner:

+                               if (page->pte.direct ||
+                                       page->mapping->backing_dev_info ==
+                                               current->backing_dev_info) {
+                                       wait_on_page_writeback(page);
+                               }

AFAICT (the code went through some metamorphoses in the intervening
twenty years), the last use of it ended up in current_may_throttle(),
and it was removed in March 2022 by Neil Brown in commit b9b1335e6403.
Since then, there have been no users of task->backing_dev_info, and I'm
pretty sure it can go away.

