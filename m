Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC178B0B9
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Aug 2023 14:40:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693226421;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TLnvMQnkyoR7wwCry5GRCKzwjL5P4BV+bNSPRJ9AdUw=;
	b=fQBdwD5Gs1MqrqML7rDSAPoZFj86QGpPEI6+NT48fXXEBd17YoEcLFEmmhZdXDW7Zxwj5N
	E/YFtzdpxuXcoO6fidyoQyI0BU5xQaF5SpGsI6sJBSYolmFnkMYORvg3TyoYFEvlkhUI0w
	zbY21FWp4DdPZxY9PBvC7fnqqUVyXBM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-yzjI9ri3OEGavgcGtPP8Qg-1; Mon, 28 Aug 2023 08:40:15 -0400
X-MC-Unique: yzjI9ri3OEGavgcGtPP8Qg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE1E985D061;
	Mon, 28 Aug 2023 12:40:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDE41140E962;
	Mon, 28 Aug 2023 12:40:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 64E1019465B3;
	Mon, 28 Aug 2023 12:40:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0AC301946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 28 Aug 2023 12:40:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A2AB02026D68; Mon, 28 Aug 2023 12:40:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BADA2026D4B
 for <cluster-devel@redhat.com>; Mon, 28 Aug 2023 12:40:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B6841C0896A
 for <cluster-devel@redhat.com>; Mon, 28 Aug 2023 12:40:12 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-1ijWz2k3NgqWVCBEWszHLg-1; Mon, 28 Aug 2023 08:40:10 -0400
X-MC-Unique: 1ijWz2k3NgqWVCBEWszHLg-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 981DA68D05; Mon, 28 Aug 2023 14:30:25 +0200 (CEST)
Date: Mon, 28 Aug 2023 14:30:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20230828123023.GA11084@lst.de>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-4-hch@lst.de> <20230827194122.GA325446@ZenIV>
MIME-Version: 1.0
In-Reply-To: <20230827194122.GA325446@ZenIV>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 03/12] filemap: update ki_pos in
 generic_perform_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 27, 2023 at 08:41:22PM +0100, Al Viro wrote:
> That part is somewhat fishy - there's a case where you return a positive value
> and advance ->ki_pos by more than that amount.  I really wonder if all callers
> of ->write_iter() are OK with that.  Consider e.g. this:

This should not exist in the latest version merged by Jens.  Can you
check if you still  see issues in the version in the block tree or
linux-next.

> Suppose ->write_iter() ends up doing returning a positive value smaller than
> the increment of kiocb.ki_pos.  What do we get?  ret is positive, so
> kiocb.ki_pos gets copied into *ppos, which is ksys_write's pos and there
> we copy it into file->f_pos.
> 
> Is it really OK to have write() return 4096 and advance the file position
> by 16K?  AFAICS, userland wouldn't get any indication of something
> odd going on - just a short write to a regular file, with followup write
> of remaining 12K getting quietly written in the range 16K..28K.
> 
> I don't remember what POSIX says about that, but it would qualify as
> nasty surprise for any userland program - sure, one can check fsync()
> results before closing the sucker and see if everything looks fine,
> but the way it's usually discussed could easily lead to assumption that
> (synchronous) O_DIRECT writes would not be affected by anything of that
> sort.

ki_pos should always be updated by the write return value.  Everything
else is a bug.

