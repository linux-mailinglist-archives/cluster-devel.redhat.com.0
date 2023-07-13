Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A97527D5
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 17:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689263825;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=++WXYeXpyNvC2a4FnzOUlKJJhfqf/XKZGJ778A0ecjo=;
	b=hX6uMrrcm5w/0yg0/f24mrYuYsErNd7FRI9PACVdeYI6/FU6CyaS4ISqId8lRqJj9jabyt
	Tu/qgHjxLBuLouO81C1Zq0ZghlmJYNCIEhfYnx0cgjxQGzhQXqRye/bRivLaX0DTUQdEVU
	3ohzUeM7nsdxawjYQZHVJNOTEAiBUrE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-PXPne7c7Mk2Mf-xuOaY94A-1; Thu, 13 Jul 2023 11:57:02 -0400
X-MC-Unique: PXPne7c7Mk2Mf-xuOaY94A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 675403C10171;
	Thu, 13 Jul 2023 15:56:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 113E840D285E;
	Thu, 13 Jul 2023 15:56:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B89F419465A2;
	Thu, 13 Jul 2023 15:56:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C9BD51946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 15:56:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8EE41454143; Thu, 13 Jul 2023 15:56:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A00B71454142
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 15:56:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 827131C28D04
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 15:56:38 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-TjtSVDghPWOyGBzTP1T02g-1; Thu, 13 Jul 2023 11:56:36 -0400
X-MC-Unique: TjtSVDghPWOyGBzTP1T02g-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id AC4A86732D; Thu, 13 Jul 2023 17:56:31 +0200 (CEST)
Date: Thu, 13 Jul 2023 17:56:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230713155631.GA29281@lst.de>
References: <202307132107.2ce4ea2f-oliver.sang@intel.com>
 <20230713150923.GA28246@lst.de> <ZLAZn_SBmoIFG5F5@yuki>
MIME-Version: 1.0
In-Reply-To: <ZLAZn_SBmoIFG5F5@yuki>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [LTP] [linus:master] [iomap] 219580eea1:
 ltp.writev07.fail
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 Miklos Szeredi <mszeredi@redhat.com>, Chao Yu <chao@kernel.org>,
 oe-lkp@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, ltp@lists.linux.it,
 lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, kernel test robot <oliver.sang@intel.com>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Hannes Reinecke <hare@suse.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 13, 2023 at 05:34:55PM +0200, Cyril Hrubis wrote:
>                 iter.processed = iomap_write_iter(&iter, i);
> 
> +       iocb->ki_pos += iter.pos - iocb->ki_pos;
> +
>         if (unlikely(ret < 0))
>                 return ret;
> -       ret = iter.pos - iocb->ki_pos;
> -       iocb->ki_pos += ret;
> -       return ret;
> +
> +       return iter.pos - iocb->ki_pos;

I don't think this works, as iocb->ki_pos has been updated above.
What you want is probably the version below.  But so far I can't
reproduce anything yet..

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index adb92cdb24b009..02aea0174ddbcf 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -872,7 +872,7 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
 	while ((ret = iomap_iter(&iter, ops)) > 0)
 		iter.processed = iomap_write_iter(&iter, i);
 
-	if (unlikely(ret < 0))
+	if (iter.pos == iocb->ki_pos)
 		return ret;
 	ret = iter.pos - iocb->ki_pos;
 	iocb->ki_pos += ret;

